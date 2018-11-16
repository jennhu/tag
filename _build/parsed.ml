(*======================================================================

                          			PARSED

The class parsed is the highest-level structure that we use in our
implementation of MCTAG. From the input file, the parser creates a forest
and list of derivation trees, where the forest is used as a reference for
all derivations in the list.

Most importantly, the class contains the methods for interpreting and
compiling, which allows us to actually perform derivations.

======================================================================*)

open Unify
open Utils
open List
open Printf
open Forest
open Derivation

type parsed = forest * derivation list

let get_forest p =
	match p with
	| (f,_) -> f

let get_derivs p =
	match p with
	| (_,ds) -> ds

(** Interprets the input forest and derivations and prints the derived trees
		in bracketed notation to standard output. We print error messages instead of
		raising an exception so that the succeeding derivations can still run. *)
let interpret p =
  iter (fun deriv ->
  	try apply_deriv deriv (get_forest p) with
  	| UnificationFailure -> printf "ERROR: Unification failed.\n\n") (get_derivs p)

(** Compiles the input into a specified output file. The user must independently
		compile and run the output file to print the derived trees. *)
let compile (outfile:string) p =
  let header = "open Unify\nopen Tree\nopen Treeset\nopen Argument\nopen Derive" in
  let oc = open_out outfile in
    fprintf oc "%s\n"
    	(sep "\n\n" [header; sprintf "(* FOREST \"%s\" *)" (forest_id (get_forest p));
    							 (forest_tostring (get_forest p)); "(* DERIVATION TREES *)";
    							 sep "\n\n" (map deriv_tofunction (get_derivs p))]) ;
  	close_out oc
