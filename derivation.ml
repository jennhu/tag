(*======================================================================

                          DERIVATION TREES

Derivation trees specify a method of producing a derived tree in MCTAG.
The class der recursively specifies the structure of a derivation tree,
while the class derivation specifies a named der.

We have paid careful attention to the issue of ambiguous derivations and
have designed the system to allow the user to specify his/her preferences
and avoid dealing with nondeterminism. There are two primary sources of
ambiguity in derivation trees, addressed below:

First, the user can use derivation trees to specify a scope ordering,
which assigns an index to every input treeset expected to operate at a
certain node and then performs the operation(s) there in the specified order.

Second, the user can also state a priority ordering, which assigns a priority
to each tree within a set. While executing the derive function, we then
generate all permutations of the trees in lexicographic order (i.e. increasing
in number of inversions). The combination of these techniques avoids the issue
of ambiguous derivations by deterministically returning the derivation that
permutes the trees as close as possible to the user's perferred order.
If no order is explicitly specified, the order of trees from the grammar
is used by default.

======================================================================*)

open List
open Printf
open Utils
open Tree
open Treeset
open Forest
open Argument
open Derive

(** An ordering of trees within a treeset. If no priority
    is specified in the derivaiton, the default is simply
    the indices of the trees as specified in the grammar. *)

type priority = treeindex list
type der = Der of word * priority option * ((linkset * der list) list)
type derivation = id * der

(** Get word, priority, and list of a der *)
let word der =
  match der with
  | Der(w,_,_) -> w
let priority der =
  match der with
  | Der(_,p,_) -> p
let lder_lst der =
  match der with
  | Der(_,_,l) -> l

(** Get id and der of a derivation *)
let deriv_id deriv = fst deriv
let der deriv = snd deriv

(** Performs a derivation, given a forest and single derivation tree. *)
let apply_deriv deriv forest =
  let rec aux d =
    let set = find (fun s -> set_id s = word d) (sets forest) in (* get the matching treeset *)
      if lder_lst d = [] then set (* no operations *)
      else let reordered = reorder set (priority d) in (* reorder the trees *)
        let final = derive reordered (map internal (lder_lst d)) in
    set_unify final; final
  (* for the internal (linkset * der list) structure *)
  and internal lds = (fst lds, map aux (snd lds)) in
  print_string (deriv_id deriv); print_newline (); set_brackify (aux (der deriv))

(** Returns the string of the abstract syntax tree of the derivation. *)
let deriv_tostring deriv =
  let rec derstr der =
    match map lststr (lder_lst der) with
    | [] -> word der
    | _ -> sprintf "%s (makearguments (%s))" (word der) (lstr (map lststr (lder_lst der)))
  and lststr lst =
    match lst with
    | (Single l, ders) ->
      sprintf "(Single %i, %s)" l (lstr (map derstr ders))
    | (Union ls, ders) ->
      sprintf "(Union %s, %s)" (lstr (map string_of_int ls)) (lstr (map derstr ders)) in
  derstr (der deriv)

(** Returns the string of the function representation of the derivation. *)
let deriv_tofunction deriv =
  let id = deriv_id deriv in
  let head =
    sprintf "#0 \"%s\"\nlet %s = %s in\n\t" id id (deriv_tostring deriv) in
  let body =
    sprintf "%s#unify; print_string \"%s\"; print_newline (); %s#brackify" id id id in
  head^body^" ;;"
