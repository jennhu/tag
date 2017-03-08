(*======================================================================

                                MCTAG

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

let compile_file input output =
	let s = Basics.filestr input |> parse in
		Parsed.compile output s

let interpret_file input =
	let s = Basics.filestr input |> parse in
		Parsed.interpret s

let infile = ref "-none given-"
let outfile = ref "-none given-"

let cmode = ref false
let imode = ref false

let main () =
	let specs =
		[("-c", Arg.Tuple([Arg.Set cmode; Arg.Set_string infile; Arg.Set_string outfile]), "Compile mode. Usage: -c <infile> <outfile>");
		 ("-i", Arg.Tuple([Arg.Set imode; Arg.Set_string infile]), "Interpret mode. Usage: -i <infile>")] in
	let usage_msg = "This system automates the derivations specified by a synchronous multicomponent tree-adjoining grammar. See doc/mctagdoc.pdf for more information, or refer to the list of options below." in
		Arg.parse specs (fun _ -> ()) usage_msg;
		print_endline ("Input: " ^ !infile);
		print_endline ("Output: " ^ !outfile);
		if !cmode then compile_file !infile !outfile
		else if !imode then interpret_file !infile
		else raise IncorrectUsage ;;

main () ;;