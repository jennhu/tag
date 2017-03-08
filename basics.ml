(*======================================================================

                              BASICS

Basic helper functions for lists, combinations/permutations, and strings
that are relevant to our implementation of tree-adjoining grammars.
Many of these functions were found online, and sources are listed.

Of particular interest are the combinations and permutations functions,
which are both used in derive.ml. combinations is used when a single
treeset is expected to operate over a set of links, as it generates the
different ways of arranging the trees in the set to fit the number of
instances associated with a single link. For all linksets, permutations
is eventually called to allow the system to find a valid ordering of
trees such that their categories and operations fit those associated
with the instances of the link.

Note that permutations are generated in lexicographic order, that is,
in increasing number of inversions. See the derive function in derive.ml
for more information on why this is important for our analyses.

======================================================================*)

open List

(*************************************
**  		    List Operations			    **
**************************************)

(** Given an input list, returns a new list with duplicates removed.
    Source: https://gist.github.com/23Skidoo/1664038. *)
let rec dedup l =
	match l with 
	| [] -> []
	| hd::tl -> hd::(dedup (filter (fun x -> x != hd) tl))

(** Creates a list of indices corresponding to an input list.
    Example: inds ["a"; "hello"; "XYZ"] = [1;2;3] *)
let inds l =
  let rec aux l i =
    match l with
    | [] -> []
    | hd::tl -> i::(aux tl (i+1)) in
  aux l 1

(*************************************
**    Combinations & Permutations   **
**************************************)

(** Returns a list of the k-combinations of an input list.
    Source: https://ocaml.org/learn/tutorials/99problems.html *)
let combinations k l =
  let rec aux k acc emit = function
    | [] -> acc
    | hd::tl ->
      if k = 1 then aux k (emit [hd] acc) emit tl 
      else let new_emit x = emit (hd::x) in
        aux k (aux (k-1) acc new_emit tl) emit tl in
          let emit x acc = x::acc in
  aux k [] emit l

(** Helper function for permutations. *)
let rec without x l =
   match l with
   | [] -> []
   | hd::tl -> if hd = x then tl else hd::(without x tl)

(** Generates permutations of a list in lexicographic order.
    Source: "More OCaml: Algorithms, Methods & Diversions" by John Whitington. *)   
let rec permutations l =
  match l with
  | [] -> [[]]
  | _ ->
    map (fun x -> 
      map (fun l -> x::l) (permutations (without x l))) l 
    |> flatten

(*************************************
**  			String Operations  			  **
**************************************)

(** Reads a file into a single string. Used in the main function.
    Source: https://www.rosettacode.org/wiki/Read_entire_file#OCaml *)
let filestr file =
  let ic = open_in file in
  let n = in_channel_length ic in
  let s = Bytes.create n in
    really_input ic s 0 n; close_in ic; (s)

(** Alias for a commonly-used function. *)
let sep = String.concat

(** Functions for delimiting strings. *)
let brack s = if s = "" then "" else "["^s^"]"
let paren s = if s = "" then "" else "("^s^")"

(** Returns the string representation of a list of strings.
    Example: lstr ["1"; "2"] = "[1; 2]" *)
let lstr l  = if l = [] then "[]" else brack (sep "; " l)

(** Given an input string and its "level" of indentation, returns a copy of 
    the string preceded by the proper number of tabs. Note that we use spaces
    instead of tabs here, but this can be easily changed to suit the user's
    preferences. *)
let indent level s =
  let rec tabs n i =
    if i > n then "" else "  "^(tabs n (i+1)) in
  (tabs level 1)^s
