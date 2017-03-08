(*======================================================================

                                FORESTS

A forest contains a list of treesets which provide the context for all
derivations that are parsed from the input file.

======================================================================*)

open List
open Printf
open Basics
open Treeset

type forest = id * treeset list

(** Get id and sets of a forest *)
let forest_id f = fst f
let sets f = snd f

(** Prints the forest in the bracketed textual notation. *)
let forest_brackify f =
  iter set_brackify (sets f); print_newline ()

(** Returns the string of all the function representations of the sets,
    separated with blank newlines. *)
let forest_tostring f =
  sets f |> map set_tofunction |> sep "\n\n"