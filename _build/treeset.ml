(*======================================================================

                              TREESETS

The class treeset represents a multicomponent set of trees in an MCTAG.
The object contains a list of trees as well as other methods that are
important for performing derivations, such as generating permutations,
reordering trees according to a priority ordering, and building the link
structure.

Note that treesets are the domain of locality for bound variables in trees
and features. One treeset corresponds to one function in the output file.

======================================================================*)

open Unify
open List
open Printf
open Utils
open Tree
open Links

type id = string
type treeset = id * t list

(** Get id and ts of a treeset *)
let set_id s = fst s
let ts s = snd s

(** Returns the ith tree, where i is 1-indexed *)
let ith s i = nth (ts s) (i-1)
(** Returns the list of lexicographic permutations of the trees. *)
let perms s = permutations (ts s)
(** Returns a new treeset with trees reordered according to a priority ordering,
    which is specified by the user in the derivation tree. *)
let reorder s priority =
  let rec aux cur =
    match cur with
    | [] -> []
    | i::tl -> (ith s i)::(aux tl) in
  let new_ts =
    match priority with
    | None -> ts s
    | Some p -> aux p in
  (set_id s,new_ts)

(** Returns the list of all linkindices in the trees in sorted order. *)
let sorted_ls s =
  let rec aux acc t =
    match t with
    | Node(_,ls,_,kids) -> fold_left aux (sort_uniq compare (acc@ls)) kids
    | Quant(_,_,l,r)    -> sort_uniq compare ((aux acc l)@(aux acc r))
    | Foot(_,ls,_)
    | Sub(_,ls,_)
    | Var(_,ls,_,_)     -> sort_uniq compare (acc@ls)
    | _                 -> acc in
  fold_left aux [] (ts s)

(** Returns the links for the treeset. *)
let treeset_links s = map (fun l -> (l,specs (ts s) l)) (sorted_ls s)
(** Returns the number of trees that have a specified link. *)
let numhaslink l s = (ts s) |> filter (haslink l) |> length

(** Unifies top and bottom features at every node in every tree. *)
let set_unify s = iter unify (ts s)

(** Prints the set in the bracketed textual notation. *)
let set_brackify s = iter brackify (ts s); print_newline ()
(** Returns the string of the abstract syntax tree of the ts. *)
let set_tostring s = (ts s) |> map tostring |> lstr
(** Returns the string of the treeset as a function, i.e.
    how it will appear in the compiled file. *)
let set_tofunction s =
  let id = set_id s in
  let head = sprintf "#0 \"%s\"\nlet %s =" id id in
  let body =
    if treeset_links s = [] then sprintf "setofts (%s)" (set_tostring s)
    else sprintf "let set = setofts (%s) in\n\t\tderive set" (set_tostring s) in
  sprintf "%s\n\t%s ;;" head body

let setofts ts = ("",ts)
