(*======================================================================

                                MAIN

Home of the main function.

The user has the option to either interpret or compile their input, 
which is explained briefly in the comments for the main function and
more in depth in the Usage section of mctagdoc.pdf.

======================================================================*)

exception IncorrectUsage

(** Parses a string and returns a parsed object, which contains a forest 
		and derivation list. See myParser.mly for parsing rules and tokens.
		Source: http://cseweb.ucsd.edu/classes/fa09/cse130/pa4/example/notes.html. *)
let parse s =
	Lexing.from_string s |> MyParser.parsed MyLexer.token ;;

(** USAGE: ./compile <inputfile> <outputfile> or ./interpret <inputfile>.
		(1) ./compile will produce a file that the user should compile and
				then run to perform derivations and print the trees.
		(2) ./interpret will perform all the derivations and directly print
				derived trees in bracketed notation to standard output.
		See mctagdoc.pdf in the /doc folder for more details. *)
let main () =
	let args = Sys.argv in
	let input = Basics.filestr args.(1) |> parse in
		match Array.length args with
		| 3 -> input#compile args.(2)		(* e.g. ./compile "in.txt" "out.ml" *)
		| 2 -> input#interpret					(* e.g. ./interpret "in.txt" *)
		| _ -> raise IncorrectUsage ;;

main () ;;