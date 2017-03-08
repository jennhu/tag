open Unify
open Tree
open Treeset
open Argument
open Derive

(* FOREST "trees_from_paper" *)

#0 "himself"
let himself =
	let set = setofts ([Foot("s",[1],{top = makefs [] ; bot = makefs []}); Foot("s",[2],{top = makefs [] ; bot = makefs []}); Node("np",[2],{top = makefs [] ; bot = makefs []},[Leaf "himself"]); Sub("np",[1],{top = makefs [] ; bot = makefs []}); Node("t",[1],{top = makefs [] ; bot = makefs []},[Node("et",[],{top = makefs [] ; bot = makefs []},[Node("eetet",[],{top = makefs [] ; bot = makefs []},[Leaf "refl/recp"]); Node("eet",[],{top = makefs [] ; bot = makefs []},[Var("lambda",[],{top = makefs [] ; bot = makefs []},"a"); Node("et",[],{top = makefs [] ; bot = makefs []},[Var("lambda",[],{top = makefs [] ; bot = makefs []},"b"); Foot("t",[],{top = makefs [] ; bot = makefs []})])])]); Sub("e",[1],{top = makefs [] ; bot = makefs []})]); Foot("t",[2],{top = makefs [] ; bot = makefs []}); Var("e",[2],{top = makefs [] ; bot = makefs []},"a"); Var("e",[],{top = makefs [] ; bot = makefs []},"b")]) in
		derive set ;;

#0 "himself_cat"
let himself_cat =
	let set = setofts ([Foot("s",[1],{top = makefs [] ; bot = makefs []}); Node("s",[],{top = makefs [] ; bot = makefs []},[Node("np",[],{top = makefs [] ; bot = makefs []},[Leaf "himself"]); Foot("s",[2],{top = makefs [] ; bot = makefs []})]); Node("np",[2],{top = makefs [] ; bot = makefs []},[Leaf ""]); Sub("np",[1],{top = makefs [] ; bot = makefs []}); Node("t",[1],{top = makefs [] ; bot = makefs []},[Node("et",[],{top = makefs [] ; bot = makefs []},[Node("eetet",[],{top = makefs [] ; bot = makefs []},[Leaf "refl/recp"]); Node("eet",[],{top = makefs [] ; bot = makefs []},[Var("lambda",[],{top = makefs [] ; bot = makefs []},"a"); Node("et",[],{top = makefs [] ; bot = makefs []},[Var("lambda",[],{top = makefs [] ; bot = makefs []},"b"); Foot("t",[],{top = makefs [] ; bot = makefs []})])])]); Sub("e",[1],{top = makefs [] ; bot = makefs []})]); Foot("t",[2],{top = makefs [] ; bot = makefs []}); Var("e",[2],{top = makefs [] ; bot = makefs []},"a"); Var("e",[],{top = makefs [] ; bot = makefs []},"b")]) in
		derive set ;;

#0 "himself_ditransobj"
let himself_ditransobj =
	let set = setofts ([Foot("s",[1],{top = makefs [] ; bot = makefs []}); Foot("s",[2],{top = makefs [] ; bot = makefs []}); Node("np",[2],{top = makefs [] ; bot = makefs []},[Leaf "himself"]); Sub("np",[1],{top = makefs [] ; bot = makefs []}); Node("et",[],{top = makefs [] ; bot = makefs []},[Node("eetet",[],{top = makefs [] ; bot = makefs []},[Leaf "refl/recp"]); Node("eet",[],{top = makefs [] ; bot = makefs []},[Var("lambda",[],{top = makefs [] ; bot = makefs []},"a"); Node("et",[],{top = makefs [] ; bot = makefs []},[Var("lambda",[],{top = makefs [] ; bot = makefs []},"b"); Node("t",[1],{top = makefs [] ; bot = makefs []},[Foot("et",[],{top = makefs [] ; bot = makefs []}); Sub("e",[1],{top = makefs [] ; bot = makefs []})])])])]); Foot("t",[2],{top = makefs [] ; bot = makefs []}); Var("e",[2],{top = makefs [] ; bot = makefs []},"a"); Var("e",[],{top = makefs [] ; bot = makefs []},"b")]) in
		derive set ;;

#0 "themselves"
let themselves =
	let set = setofts ([Foot("s",[1],{top = makefs [] ; bot = makefs []}); Foot("s",[2],{top = makefs [] ; bot = makefs []}); Node("np",[2],{top = makefs [] ; bot = makefs []},[Leaf "themselves/eachother"]); Sub("np",[1],{top = makefs [] ; bot = makefs []}); Node("t",[1],{top = makefs [] ; bot = makefs []},[Node("et",[],{top = makefs [] ; bot = makefs []},[Node("eetet",[],{top = makefs [] ; bot = makefs []},[Leaf "refl/recp"]); Node("eet",[],{top = makefs [] ; bot = makefs []},[Var("lambda",[],{top = makefs [] ; bot = makefs []},"a"); Node("et",[],{top = makefs [] ; bot = makefs []},[Var("lambda",[],{top = makefs [] ; bot = makefs []},"b"); Foot("t",[],{top = makefs [] ; bot = makefs []})])])]); Sub("e",[1],{top = makefs [] ; bot = makefs []})]); Foot("t",[2],{top = makefs [] ; bot = makefs []}); Var("e",[2],{top = makefs [] ; bot = makefs []},"a"); Var("e",[],{top = makefs [] ; bot = makefs []},"b")]) in
		derive set ;;

#0 "themselves_cat"
let themselves_cat =
	let set = setofts ([Foot("s",[1],{top = makefs [] ; bot = makefs []}); Node("s",[],{top = makefs [] ; bot = makefs []},[Node("np",[2],{top = makefs [] ; bot = makefs []},[Leaf "themselves/eachother"]); Foot("s",[2],{top = makefs [] ; bot = makefs []})]); Node("np",[],{top = makefs [] ; bot = makefs []},[Leaf ""]); Sub("np",[1],{top = makefs [] ; bot = makefs []}); Node("t",[1],{top = makefs [] ; bot = makefs []},[Node("et",[],{top = makefs [] ; bot = makefs []},[Node("eetet",[],{top = makefs [] ; bot = makefs []},[Leaf "refl/recp"]); Node("eet",[],{top = makefs [] ; bot = makefs []},[Var("lambda",[],{top = makefs [] ; bot = makefs []},"a"); Node("et",[],{top = makefs [] ; bot = makefs []},[Var("lambda",[],{top = makefs [] ; bot = makefs []},"b"); Foot("t",[],{top = makefs [] ; bot = makefs []})])])]); Sub("e",[1],{top = makefs [] ; bot = makefs []})]); Foot("t",[2],{top = makefs [] ; bot = makefs []}); Var("e",[2],{top = makefs [] ; bot = makefs []},"a"); Var("e",[],{top = makefs [] ; bot = makefs []},"b")]) in
		derive set ;;

#0 "johnmary"
let johnmary =
	let set = setofts ([Foot("s",[],{top = makefs [] ; bot = makefs []}); Node("np",[1],{top = makefs [] ; bot = makefs []},[Leaf "john_and_mary"]); Foot("t",[],{top = makefs [] ; bot = makefs []}); Node("e",[1],{top = makefs [] ; bot = makefs []},[Leaf "j_and_m"])]) in
		derive set ;;

#0 "johnmary_top"
let johnmary_top =
	let set = setofts ([Node("s",[],{top = makefs [] ; bot = makefs []},[Node("np",[1],{top = makefs [] ; bot = makefs []},[Leaf "john_and_mary"]); Foot("s",[],{top = makefs [] ; bot = makefs []})]); Node("np",[],{top = makefs [] ; bot = makefs []},[Leaf ""]); Foot("t",[],{top = makefs [] ; bot = makefs []}); Node("e",[1],{top = makefs [] ; bot = makefs []},[Leaf "j_and_m"])]) in
		derive set ;;

#0 "mary"
let mary =
	let set = setofts ([Foot("s",[],{top = makefs [] ; bot = makefs []}); Node("np",[1],{top = makefs [] ; bot = makefs []},[Leaf "mary"]); Foot("t",[],{top = makefs [] ; bot = makefs []}); Node("e",[1],{top = makefs [] ; bot = makefs []},[Leaf "m"])]) in
		derive set ;;

#0 "mary_top"
let mary_top =
	let set = setofts ([Node("s",[],{top = makefs [] ; bot = makefs []},[Node("np",[1],{top = makefs [] ; bot = makefs []},[Leaf "mary"]); Foot("s",[],{top = makefs [] ; bot = makefs []})]); Node("np",[],{top = makefs [] ; bot = makefs []},[Leaf ""]); Foot("t",[],{top = makefs [] ; bot = makefs []}); Node("e",[1],{top = makefs [] ; bot = makefs []},[Leaf "m"])]) in
		derive set ;;

#0 "john"
let john =
	let set = setofts ([Foot("s",[],{top = makefs [] ; bot = makefs []}); Node("np",[1],{top = makefs [] ; bot = makefs []},[Leaf "john"]); Foot("t",[],{top = makefs [] ; bot = makefs []}); Node("e",[1],{top = makefs [] ; bot = makefs []},[Leaf "j"])]) in
		derive set ;;

#0 "john_top"
let john_top =
	let set = setofts ([Node("s",[],{top = makefs [] ; bot = makefs []},[Node("np",[1],{top = makefs [] ; bot = makefs []},[Leaf "john"]); Foot("s",[],{top = makefs [] ; bot = makefs []})]); Node("np",[],{top = makefs [] ; bot = makefs []},[Leaf ""]); Foot("t",[],{top = makefs [] ; bot = makefs []}); Node("e",[1],{top = makefs [] ; bot = makefs []},[Leaf "j"])]) in
		derive set ;;

#0 "bill"
let bill =
	let set = setofts ([Foot("s",[],{top = makefs [] ; bot = makefs []}); Node("np",[1],{top = makefs [] ; bot = makefs []},[Leaf "bill"]); Foot("t",[],{top = makefs [] ; bot = makefs []}); Node("e",[1],{top = makefs [] ; bot = makefs []},[Leaf "b"])]) in
		derive set ;;

#0 "bill_top"
let bill_top =
	let set = setofts ([Node("s",[],{top = makefs [] ; bot = makefs []},[Node("np",[1],{top = makefs [] ; bot = makefs []},[Leaf "bill"]); Foot("s",[],{top = makefs [] ; bot = makefs []})]); Node("np",[],{top = makefs [] ; bot = makefs []},[Leaf ""]); Foot("t",[],{top = makefs [] ; bot = makefs []}); Node("e",[1],{top = makefs [] ; bot = makefs []},[Leaf "b"])]) in
		derive set ;;

#0 "picsof"
let picsof =
	let set = setofts ([Foot("s",[],{top = makefs [] ; bot = makefs []}); Node("np",[],{top = makefs [] ; bot = makefs []},[Node("d",[],{top = makefs [] ; bot = makefs []},[Leaf "the"]); Node("np",[1],{top = makefs [] ; bot = makefs []},[Node("n",[],{top = makefs [] ; bot = makefs []},[Leaf "pics"]); Node("pp",[],{top = makefs [] ; bot = makefs []},[Node("p",[],{top = makefs [] ; bot = makefs []},[Leaf "of"]); Foot("np",[],{top = makefs [] ; bot = makefs []})])])]); Foot("t",[],{top = makefs [] ; bot = makefs []}); Node("e",[1],{top = makefs [] ; bot = makefs []},[Var("unique",[],{top = makefs [] ; bot = makefs []},"z"); Node("t",[],{top = makefs [] ; bot = makefs []},[Node("et",[],{top = makefs [] ; bot = makefs []},[Node("eet",[],{top = makefs [] ; bot = makefs []},[Leaf "picsof"]); Foot("e",[],{top = makefs [] ; bot = makefs []})]); Var("e",[],{top = makefs [] ; bot = makefs []},"z")])])]) in
		derive set ;;

#0 "picsof_top"
let picsof_top =
	let set = setofts ([Node("s",[],{top = makefs [] ; bot = makefs []},[Node("np",[],{top = makefs [] ; bot = makefs []},[Node("d",[],{top = makefs [] ; bot = makefs []},[Leaf "the"]); Node("np",[1],{top = makefs [] ; bot = makefs []},[Node("n",[],{top = makefs [] ; bot = makefs []},[Leaf "pics"]); Node("pp",[],{top = makefs [] ; bot = makefs []},[Node("p",[],{top = makefs [] ; bot = makefs []},[Leaf "of"]); Foot("np",[],{top = makefs [] ; bot = makefs []})])])]); Foot("s",[],{top = makefs [] ; bot = makefs []})]); Node("np",[],{top = makefs [] ; bot = makefs []},[Leaf ""]); Foot("t",[],{top = makefs [] ; bot = makefs []}); Node("e",[1],{top = makefs [] ; bot = makefs []},[Quant("unique","z",Node("t",[],{top = makefs [] ; bot = makefs []},[Node("et",[],{top = makefs [] ; bot = makefs []},[Node("eet",[],{top = makefs [] ; bot = makefs []},[Leaf "picsof"]); Foot("e",[],{top = makefs [] ; bot = makefs []})])]),Var("e",[],{top = makefs [] ; bot = makefs []},"z"))])]) in
		derive set ;;

#0 "everyone"
let everyone =
	setofts ([Foot("s",[],{top = makefs [] ; bot = makefs []}); Node("np",[],{top = makefs [] ; bot = makefs []},[Leaf "everyone"]); Node("t",[],{top = makefs [] ; bot = makefs []},[Quant("forall","x",Node("t",[],{top = makefs [] ; bot = makefs []},[Node("et",[],{top = makefs [] ; bot = makefs []},[Leaf "person"]); Var("e",[],{top = makefs [] ; bot = makefs []},"x")]),Foot("t",[],{top = makefs [] ; bot = makefs []}))]); Var("e",[],{top = makefs [] ; bot = makefs []},"x")]) ;;

#0 "everyone_top"
let everyone_top =
	setofts ([Node("s",[],{top = makefs [] ; bot = makefs []},[Node("np",[],{top = makefs [] ; bot = makefs []},[Leaf "everyone"]); Foot("s",[],{top = makefs [] ; bot = makefs []})]); Node("np",[],{top = makefs [] ; bot = makefs []},[Leaf ""]); Node("t",[],{top = makefs [] ; bot = makefs []},[Quant("forall","x",Node("t",[],{top = makefs [] ; bot = makefs []},[Node("et",[],{top = makefs [] ; bot = makefs []},[Leaf "person"]); Var("e",[],{top = makefs [] ; bot = makefs []},"x")]),Foot("t",[],{top = makefs [] ; bot = makefs []}))]); Var("e",[],{top = makefs [] ; bot = makefs []},"x")]) ;;

#0 "someone"
let someone =
	setofts ([Foot("s",[],{top = makefs [] ; bot = makefs []}); Node("np",[],{top = makefs [] ; bot = makefs []},[Leaf "someone"]); Node("t",[],{top = makefs [] ; bot = makefs []},[Quant("exists","x",Node("t",[],{top = makefs [] ; bot = makefs []},[Node("et",[],{top = makefs [] ; bot = makefs []},[Leaf "person"]); Var("e",[],{top = makefs [] ; bot = makefs []},"x")]),Foot("t",[],{top = makefs [] ; bot = makefs []}))]); Var("e",[],{top = makefs [] ; bot = makefs []},"x")]) ;;

#0 "someone_top"
let someone_top =
	setofts ([Node("s",[],{top = makefs [] ; bot = makefs []},[Node("np",[],{top = makefs [] ; bot = makefs []},[Leaf "someone"]); Foot("s",[],{top = makefs [] ; bot = makefs []})]); Node("np",[],{top = makefs [] ; bot = makefs []},[Leaf ""]); Node("t",[],{top = makefs [] ; bot = makefs []},[Quant("exists","x",Node("t",[],{top = makefs [] ; bot = makefs []},[Node("et",[],{top = makefs [] ; bot = makefs []},[Leaf "person"]); Var("e",[],{top = makefs [] ; bot = makefs []},"x")]),Foot("t",[],{top = makefs [] ; bot = makefs []}))]); Var("e",[],{top = makefs [] ; bot = makefs []},"x")]) ;;

#0 "noone"
let noone =
	setofts ([Foot("s",[],{top = makefs [] ; bot = makefs []}); Node("np",[],{top = makefs [] ; bot = makefs []},[Leaf "noone"]); Node("t",[],{top = makefs [] ; bot = makefs []},[Quant("notexists","x",Node("t",[],{top = makefs [] ; bot = makefs []},[Node("et",[],{top = makefs [] ; bot = makefs []},[Leaf "person"]); Var("e",[],{top = makefs [] ; bot = makefs []},"x")]),Foot("t",[],{top = makefs [] ; bot = makefs []}))]); Var("e",[],{top = makefs [] ; bot = makefs []},"x")]) ;;

#0 "noone_top"
let noone_top =
	setofts ([Node("s",[],{top = makefs [] ; bot = makefs []},[Node("np",[],{top = makefs [] ; bot = makefs []},[Leaf "noone"]); Foot("s",[],{top = makefs [] ; bot = makefs []})]); Node("np",[],{top = makefs [] ; bot = makefs []},[Leaf ""]); Node("t",[],{top = makefs [] ; bot = makefs []},[Quant("notexists","x",Node("t",[],{top = makefs [] ; bot = makefs []},[Node("et",[],{top = makefs [] ; bot = makefs []},[Leaf "person"]); Var("e",[],{top = makefs [] ; bot = makefs []},"x")]),Foot("t",[],{top = makefs [] ; bot = makefs []}))]); Var("e",[],{top = makefs [] ; bot = makefs []},"x")]) ;;

#0 "saw"
let saw =
	let set = setofts ([Node("s",[1; 2],{top = makefs [] ; bot = makefs []},[Sub("np",[1],{top = makefs [] ; bot = makefs []}); Node("vp",[3],{top = makefs [] ; bot = makefs []},[Node("v",[],{top = makefs [] ; bot = makefs []},[Leaf "saw"]); Sub("np",[2],{top = makefs [] ; bot = makefs []})])]); Node("t",[1; 2; 3],{top = makefs [] ; bot = makefs []},[Node("et",[],{top = makefs [] ; bot = makefs []},[Node("eet",[],{top = makefs [] ; bot = makefs []},[Leaf "saw"]); Sub("e",[2],{top = makefs [] ; bot = makefs []})]); Sub("e",[1],{top = makefs [] ; bot = makefs []})])]) in
		derive set ;;

#0 "likes"
let likes =
	let set = setofts ([Node("s",[1; 2],{top = makefs [] ; bot = makefs []},[Sub("np",[1],{top = makefs [] ; bot = makefs []}); Node("vp",[3],{top = makefs [] ; bot = makefs []},[Node("v",[],{top = makefs [] ; bot = makefs []},[Leaf "likes"]); Sub("np",[2],{top = makefs [] ; bot = makefs []})])]); Node("t",[1; 2; 3],{top = makefs [] ; bot = makefs []},[Node("et",[],{top = makefs [] ; bot = makefs []},[Node("eet",[],{top = makefs [] ; bot = makefs []},[Leaf "like"]); Sub("e",[2],{top = makefs [] ; bot = makefs []})]); Sub("e",[1],{top = makefs [] ; bot = makefs []})])]) in
		derive set ;;

#0 "showed_subj"
let showed_subj =
	let set = setofts ([Node("s",[1; 2; 3],{top = makefs [] ; bot = makefs []},[Sub("np",[1],{top = makefs [] ; bot = makefs []}); Node("vp",[],{top = makefs [] ; bot = makefs []},[Node("v",[],{top = makefs [] ; bot = makefs []},[Leaf "showed"]); Sub("np",[2],{top = makefs [] ; bot = makefs []}); Sub("np",[3],{top = makefs [] ; bot = makefs []})])]); Node("t",[1; 2; 3],{top = makefs [] ; bot = makefs []},[Node("et",[],{top = makefs [] ; bot = makefs []},[Node("eet",[],{top = makefs [] ; bot = makefs []},[Node("eeet",[],{top = makefs [] ; bot = makefs []},[Leaf "showed"]); Sub("e",[3],{top = makefs [] ; bot = makefs []})]); Sub("e",[2],{top = makefs [] ; bot = makefs []})]); Sub("e",[1],{top = makefs [] ; bot = makefs []})])]) in
		derive set ;;

#0 "showed_obj"
let showed_obj =
	let set = setofts ([Node("s",[1; 2; 3],{top = makefs [] ; bot = makefs []},[Sub("np",[1],{top = makefs [] ; bot = makefs []}); Node("vp",[],{top = makefs [] ; bot = makefs []},[Node("v",[],{top = makefs [] ; bot = makefs []},[Leaf "showed"]); Sub("np",[2],{top = makefs [] ; bot = makefs []}); Sub("np",[3],{top = makefs [] ; bot = makefs []})])]); Node("t",[1; 3],{top = makefs [] ; bot = makefs []},[Node("et",[2],{top = makefs [] ; bot = makefs []},[Node("eet",[],{top = makefs [] ; bot = makefs []},[Node("eeet",[],{top = makefs [] ; bot = makefs []},[Leaf "showed"]); Sub("e",[3],{top = makefs [] ; bot = makefs []})]); Sub("e",[2],{top = makefs [] ; bot = makefs []})]); Sub("e",[1],{top = makefs [] ; bot = makefs []})])]) in
		derive set ;;

(* DERIVATION TREES *)

#0 "johnsawmary"
let johnsawmary = saw (makearguments ([(Single 1, [john (makearguments ([(Single 1, [])]))]); (Single 2, [mary (makearguments ([(Single 1, [])]))]); (Single 3, [])])) in
	johnsawmary#unify; print_string "johnsawmary"; print_newline (); johnsawmary#brackify ;;

#0 "noonesawmary"
let noonesawmary = saw (makearguments ([(Single 1, [noone]); (Single 2, [mary (makearguments ([(Single 1, [])]))]); (Single 3, [])])) in
	noonesawmary#unify; print_string "noonesawmary"; print_newline (); noonesawmary#brackify ;;

#0 "johnsawmary_top"
let johnsawmary_top = saw (makearguments ([(Single 1, [john (makearguments ([(Single 1, [])]))]); (Single 2, [mary_top (makearguments ([(Single 1, [])]))]); (Single 3, [])])) in
	johnsawmary_top#unify; print_string "johnsawmary_top"; print_newline (); johnsawmary_top#brackify ;;

#0 "refl_john"
let refl_john = saw (makearguments ([(Union [1; 2], [himself (makearguments ([(Single 1, [john (makearguments ([(Single 1, [])]))]); (Single 2, [])]))]); (Single 3, [])])) in
	refl_john#unify; print_string "refl_john"; print_newline (); refl_john#brackify ;;

#0 "reflrecp_jm"
let reflrecp_jm = saw (makearguments ([(Union [1; 2], [themselves (makearguments ([(Single 1, [johnmary (makearguments ([(Single 1, [])]))]); (Single 2, [])]))]); (Single 3, [])])) in
	reflrecp_jm#unify; print_string "reflrecp_jm"; print_newline (); reflrecp_jm#brackify ;;

#0 "reflrecp_everyone"
let reflrecp_everyone = saw (makearguments ([(Union [1; 2], [themselves (makearguments ([(Single 1, [everyone]); (Single 2, [])]))]); (Single 3, [])])) in
	reflrecp_everyone#unify; print_string "reflrecp_everyone"; print_newline (); reflrecp_everyone#brackify ;;

#0 "refl_cat_john"
let refl_cat_john = saw (makearguments ([(Union [1; 2], [himself_cat (makearguments ([(Single 1, [john (makearguments ([(Single 1, [])]))]); (Single 2, [])]))]); (Single 3, [])])) in
	refl_cat_john#unify; print_string "refl_cat_john"; print_newline (); refl_cat_john#brackify ;;

#0 "refl_ditrans_subj1"
let refl_ditrans_subj1 = showed_subj (makearguments ([(Union [1; 3], [himself (makearguments ([(Single 1, [john (makearguments ([(Single 1, [])]))]); (Single 2, [])]))]); (Single 2, [bill (makearguments ([(Single 1, [])]))])])) in
	refl_ditrans_subj1#unify; print_string "refl_ditrans_subj1"; print_newline (); refl_ditrans_subj1#brackify ;;

#0 "refl_ditrans_subj2"
let refl_ditrans_subj2 = showed_subj (makearguments ([(Union [1; 2], [himself (makearguments ([(Single 1, [john (makearguments ([(Single 1, [])]))]); (Single 2, [])]))]); (Single 3, [bill (makearguments ([(Single 1, [])]))])])) in
	refl_ditrans_subj2#unify; print_string "refl_ditrans_subj2"; print_newline (); refl_ditrans_subj2#brackify ;;

#0 "refl_ditrans_obj"
let refl_ditrans_obj = showed_obj (makearguments ([(Union [2; 3], [himself_ditransobj (makearguments ([(Single 1, [bill (makearguments ([(Single 1, [])]))]); (Single 2, [])]))]); (Single 1, [john (makearguments ([(Single 1, [])]))])])) in
	refl_ditrans_obj#unify; print_string "refl_ditrans_obj"; print_newline (); refl_ditrans_obj#brackify ;;
