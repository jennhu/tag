(*======================================================================

                                LINKS

We need a consistent way to order instances of links across a treeset so
that we can accurately process the operating treesets to match categories
and features. In particular, for a single linkindex, we use a class called
a linkspec, which stores a list of the locations and categories of every
instance of the link in a treeset. Note that a location really contains
two pieces of information: a treeindex and an address. For example, (2,[])
would represent the root node of the second tree in a treeset.

The class links allows us to store linkspecs across all linkindices that
appear in a given treeset, fixing a particular ordering of all instances
of links that provides a reference for derivations.

One important link-related function is scope, which allows the user to
specify different orderings of trees that adjoin at the same node. See
the scope function for more details.

======================================================================*)

open Unify
open List
open Printf
open Utils
open Tree

type linkspec = linkindex * ((treeindex * address) * categ) list
type treesetlinks = linkspec list

(** Gets the linkindex and spec of a linkspec *)
let link_ind lspec = fst lspec
let get_specs lspec = snd lspec

(*************************************
**   Recording Addresses & Categs   **
**     for a Single Linkindex       **
**************************************)

(** Returns the list of addresses of all the nodes
    containing the specified linkindex in the tree. *)
let tladds t l =
  let rec adds t acc cur =
    match t with
    | Node(_,ls,_,kids) -> if mem l ls then kadds kids (cur::acc) cur
                           else kadds kids acc cur
    | Quant(_,_,t1,t2)  -> kadds [t1;t2] acc cur
    | Foot(_,ls,_)
    | Sub(_,ls,_)
    | Var(_,ls,_,_)     -> if mem l ls then cur::acc else acc
    | Leaf _            -> acc
  and kadds kids parentacc cur =
    let rec aux lst i =
      match lst with
      | [] -> []
      | hd::tl -> (adds hd parentacc (cur@[i]))@(aux tl (i+1)) in
    aux kids 1 in
  dedup (adds t [] []) ;;

(** Returns a list of ((treeindex * address) * categ) tuples
    for a specified tree list and linkindex. *)
let specs ts l =
  (* takes care of (treeindex * address) tuples *)
  let rec aux lst i =
    match lst with
    | [] -> []
    | t::tl ->
      let result = tladds t l |> map (fun add -> (i,add)) in
      result::(aux tl (i+1)) in
  let locs = flatten (aux ts 1) in
  (* adds categories corresponding to each location *)
  map (fun loc ->
    let (i,add) = loc in
    let node = lookup add (nth ts (i-1)) in
    (loc,cat node)) locs ;;

(** Returns the linkspec with a specified linkindex for the treeset. *)
let spec_of_l (l:linkindex) (tsl:treesetlinks) =
  find (fun lspec -> link_ind lspec = l) tsl

(** Returns the list of linkspecs the corresponds to a list of relevant link indices.
    Note that the list could contain duplicates. Used in the derive function. *)
let rels (ls:linkindex list) (tsl:treesetlinks) =
  fold_left (fun acc l ->
    let rel = spec_of_l l tsl in
    if mem rel acc then acc else acc@[rel]) [] ls

(*************************************
**    linkspec & links Functions    **
**************************************)

(** Assigns indices to each linkindex based on their original ordering.
    The scope is used in the reorder_scope function in argument.ml,
    which rearranges the input treesets in the order specified by the user
    so each treeset operates on the links with the correct scope.

    Example: a node has links [1;2;3] in the grammar (e.g. [s@1@2@3])
    and the derivation specifies link 2 before link 1. The scope function
    will generate [(2,2); (1,1); (3,3)]. For each tuple (a,b) in the list,
    a represents the linkindex, and b represents the position that linkindex
    was found in the node's original list of links. *)

let scope (rels:treesetlinks) (origorder:linkindex list) =
  let order = map link_ind rels in
  let relorder = filter (fun l -> mem l origorder) order in
  let rec originds cur i =
    match cur with
    | [] -> []
    | x::tl -> (x,i)::(originds tl (i+1)) in
  let origref = originds origorder 1 in
  let rec aux cur =
    match cur with
    | [] -> []
    | x::tl -> (x,assoc x origref)::(aux tl) in
  aux relorder ;;
