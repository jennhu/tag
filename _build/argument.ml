(*======================================================================

                              ARGUMENTS

Arguments are used to specify which treesets are expected to operate at
which links during MCTAG derivations. In particular, to perform one step 
in a derivation, we need a list of input treesets and a set of links over 
which the input sets operate in the target treeset.

We use a type called an arg to represent one of these derivation steps.
An arg is a tuple specifying a linkset as well as the list of treesets 
expected to operate there. An arguments object contains a list of args that
specify the details of the entire derivation.

Before using the arguments to form derived trees, we have to process them
in a few ways. First, we must deal with possible ambiguities in scope when
two trees adjoin at the same node, e.g. for quantifiers in sentences like
"everyone saw someone". The reorder_scope function takes care of this
issue by allowing the user to input a preferred scope ordering that tells
us how to arrange the sets in the list. Second, we must rename variables
appropriately to make sure we have the correct bindings while allowing the
user to reuse variable names in the grammar itself. The details of how
variables are renamed are described in the renamevars function. Both
reorder_scope and renamevars are found in the Functions section below.

======================================================================*)

open List
open Printf
open Basics
open Tree
open Treeset

(** To use treesets across multiple links, we generalize the notion of a
    linkindex to a linkset. Linksets can either be singletons or unions. *)
type linkset =
  | Single of linkindex
  | Union of linkindex list

(** One arg corresponds to one set of links in the target treeset. *)
type arg = linkset * (treeset list)

(** Reorders a treeset list list according to a specified scope ordering,
    which is generated through the scope function in links.ml. Refer to
    links.ml for more details.

    Example: the original node [s@1@2@3] has links in order [1;2;3], and
    the derivation specifies args in the order [2;1;3]. scope gives us
    [(2,2); (1,1); (3,3)]. reorder_scope then reorders the list
    according to the second indices in each of these tuples. *)
let reorder_scope lst scope =
  fold_left (fun acc x -> 
    let (_,i) = x in (nth lst (i-1))@acc) [] scope ;;
(*   let rec aux scope =
    match scope with
    | [] -> []
    | (_,i)::tl -> (nth lst (i-1))@(aux tl) in
(*       let x = try nth lst (i-1) with nth -> [] in
      x@(aux tl) in *)
  aux scope ;; *)

(** A helper function for renamevars that renames variables in a treeset
    with a suffix and subscript. The primary suffix concatenates the 
    linkindices used in the linkset, and the subscript (after underscore) 
    is the index of the set in the list it is inputted in. *)
let rename set i lset =
  let primary =
    match lset with
    | Single l -> string_of_int l
    | Union ls -> sep "" (map string_of_int ls) in
  let suffix = sprintf "%s_%i" primary i in
  let rec aux t =
    match t with
    | Node(c,ls,fs,kids) -> Node(c,ls,fs,map aux kids)
    | Quant(q,v,l,r)     -> Quant(q,v^suffix,aux l,aux r)
    | Var(c,ls,fs,v)     -> Var(c,ls,fs,v^suffix)
    | _     -> t in
  map aux (ts set)

(** Renames the variables in a list of treesets according to a specified
    linkset using the convention in the rename function. The list will 
    presumably come from an arg tuple. *)
let renamevars sets lset =
  let rec aux cur i =
    match cur with
    | [] -> []
    | hd::tl -> (rename hd i lset)::(aux tl (i+1)) in
  map setofts (aux sets 1) ;;
