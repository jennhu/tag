open Unify
open Tree
open Treeset
open Argument
open Derive

(* FOREST "example" *)

#0 "himself"
let himself =
	let set = setofts ([Foot("s",[1],{top = makefs [] ; bot = makefs []}); Foot("s",[2],{top = makefs [] ; bot = makefs []}); Node("np",[2],{top = makefs [] ; bot = makefs []},[Leaf "himself"]); Sub("np",[1],{top = makefs [] ; bot = makefs []}); Node("t",[1],{top = makefs [] ; bot = makefs []},[Node("et",[],{top = makefs [] ; bot = makefs []},[Node("eetet",[],{top = makefs [] ; bot = makefs []},[Leaf "refl/recp"]); Node("eet",[],{top = makefs [] ; bot = makefs []},[Var("lambda",[],{top = makefs [] ; bot = makefs []},"a"); Node("et",[],{top = makefs [] ; bot = makefs []},[Var("lambda",[],{top = makefs [] ; bot = makefs []},"b"); Foot("t",[],{top = makefs [] ; bot = makefs []})])])]); Sub("e",[1],{top = makefs [] ; bot = makefs []})]); Foot("t",[2],{top = makefs [] ; bot = makefs []}); Var("e",[2],{top = makefs [] ; bot = makefs []},"a"); Var("e",[],{top = makefs [] ; bot = makefs []},"b")]) in
		derive set ;;

#0 "himself_cat"
let himself_cat =
	let set = setofts ([Foot("s",[1],{top = makefs [] ; bot = makefs []}); Node("s",[],{top = makefs [] ; bot = makefs []},[Node("np",[2],{top = makefs [] ; bot = makefs []},[Leaf "himself"]); Foot("s",[2],{top = makefs [] ; bot = makefs []})]); Node("np",[],{top = makefs [] ; bot = makefs []},[Leaf ""]); Sub("np",[1],{top = makefs [] ; bot = makefs []}); Node("t",[1],{top = makefs [] ; bot = makefs []},[Node("et",[],{top = makefs [] ; bot = makefs []},[Node("eetet",[],{top = makefs [] ; bot = makefs []},[Leaf "refl/recp"]); Node("eet",[],{top = makefs [] ; bot = makefs []},[Var("lambda",[],{top = makefs [] ; bot = makefs []},"a"); Node("et",[],{top = makefs [] ; bot = makefs []},[Var("lambda",[],{top = makefs [] ; bot = makefs []},"b"); Foot("t",[],{top = makefs [] ; bot = makefs []})])])]); Sub("e",[1],{top = makefs [] ; bot = makefs []})]); Foot("t",[2],{top = makefs [] ; bot = makefs []}); Var("e",[2],{top = makefs [] ; bot = makefs []},"a"); Var("e",[],{top = makefs [] ; bot = makefs []},"b")]) in
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

#0 "picsof"
let picsof =
	let set = setofts ([Foot("s",[],{top = makefs [] ; bot = makefs []}); Node("np",[],{top = makefs [] ; bot = makefs []},[Node("d",[],{top = makefs [] ; bot = makefs []},[Leaf "the"]); Node("np",[1],{top = makefs [] ; bot = makefs []},[Node("n",[],{top = makefs [] ; bot = makefs []},[Leaf "pics"]); Node("pp",[],{top = makefs [] ; bot = makefs []},[Node("p",[],{top = makefs [] ; bot = makefs []},[Leaf "of"]); Foot("np",[],{top = makefs [] ; bot = makefs []})])])]); Foot("t",[],{top = makefs [] ; bot = makefs []}); Node("e",[1],{top = makefs [] ; bot = makefs []},[Quant("unique","z",Node("t",[],{top = makefs [] ; bot = makefs []},[Node("et",[],{top = makefs [] ; bot = makefs []},[Node("eet",[],{top = makefs [] ; bot = makefs []},[Leaf "picsof"]); Foot("e",[],{top = makefs [] ; bot = makefs []})])]),Var("e",[],{top = makefs [] ; bot = makefs []},"z"))])]) in
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

#0 "saw"
let saw =
	let set = setofts ([Node("s",[1; 2],{top = makefs [] ; bot = makefs []},[Sub("np",[1],{top = makefs [] ; bot = makefs []}); Node("vp",[3],{top = makefs [] ; bot = makefs []},[Node("v",[],{top = makefs [] ; bot = makefs []},[Leaf "saw"]); Sub("np",[2],{top = makefs [] ; bot = makefs []})])]); Node("t",[1; 2; 3],{top = makefs [] ; bot = makefs []},[Node("et",[],{top = makefs [] ; bot = makefs []},[Node("eet",[],{top = makefs [] ; bot = makefs []},[Leaf "saw"]); Sub("e",[2],{top = makefs [] ; bot = makefs []})]); Sub("e",[1],{top = makefs [] ; bot = makefs []})])]) in
		derive set ;;

#0 "likes"
let likes =
	let set = setofts ([Node("s",[1; 2],{top = makefs [] ; bot = makefs []},[Sub("np",[1],{top = makefs [] ; bot = makefs []}); Node("vp",[3],{top = makefs [] ; bot = makefs []},[Node("v",[],{top = makefs [] ; bot = makefs []},[Leaf "likes"]); Sub("np",[2],{top = makefs [] ; bot = makefs []})])]); Node("t",[1; 2; 3],{top = makefs [] ; bot = makefs []},[Node("et",[],{top = makefs [] ; bot = makefs []},[Node("eet",[],{top = makefs [] ; bot = makefs []},[Leaf "like"]); Sub("e",[2],{top = makefs [] ; bot = makefs []})]); Sub("e",[1],{top = makefs [] ; bot = makefs []})])]) in
		derive set ;;

#0 "app"
let app =
	setofts ([Node("vp",[],{top = makefs [] ; bot = makefs []},[Node("adv",[],{top = makefs [] ; bot = makefs []},[Leaf "apparently"]); Foot("vp",[],{top = makefs [] ; bot = makefs []})]); Node("t",[],{top = makefs [] ; bot = makefs []},[Node("tt",[],{top = makefs [] ; bot = makefs []},[Leaf "apparently"]); Foot("t",[],{top = makefs [] ; bot = makefs []})])]) ;;

#0 "really"
let really =
	setofts ([Node("vp",[],{top = makefs [] ; bot = makefs []},[Node("adv",[],{top = makefs [] ; bot = makefs []},[Leaf "really"]); Foot("vp",[],{top = makefs [] ; bot = makefs []})]); Node("t",[],{top = makefs [] ; bot = makefs []},[Node("tt",[],{top = makefs [] ; bot = makefs []},[Leaf "really"]); Foot("t",[],{top = makefs [] ; bot = makefs []})])]) ;;

#0 "quite"
let quite =
	setofts ([Node("vp",[],{top = makefs [] ; bot = makefs []},[Node("adv",[],{top = makefs [] ; bot = makefs []},[Leaf "quite"]); Foot("vp",[],{top = makefs [] ; bot = makefs []})]); Node("t",[],{top = makefs [] ; bot = makefs []},[Node("tt",[],{top = makefs [] ; bot = makefs []},[Leaf "quite"]); Foot("t",[],{top = makefs [] ; bot = makefs []})])]) ;;

#0 "pretty"
let pretty =
	setofts ([Node("np",[],{top = makefs [] ; bot = makefs []},[Node("adj",[],{top = makefs [] ; bot = makefs []},[Leaf "pretty"]); Foot("np",[],{top = makefs [] ; bot = makefs []})]); Node("e",[],{top = makefs [] ; bot = makefs []},[Node("ee",[],{top = makefs [] ; bot = makefs []},[Leaf "pretty"]); Foot("e",[],{top = makefs [] ; bot = makefs []})])]) ;;

#0 "smart"
let smart =
	setofts ([Node("e",[],{top = makefs [] ; bot = makefs []},[Node("ee",[],{top = makefs [] ; bot = makefs []},[Leaf "smart"]); Foot("e",[],{top = makefs [] ; bot = makefs []})]); Node("np",[],{top = makefs [] ; bot = makefs []},[Node("adj",[],{top = makefs [] ; bot = makefs []},[Leaf "smart"]); Foot("np",[],{top = makefs [] ; bot = makefs []})])]) ;;

(* DERIVATION TREES *)

#0 "johnlikesmary"
let johnlikesmary = likes (makearguments ([(Single 1, [john (makearguments ([(Single 1, [])]))]); (Single 2, [mary (makearguments ([(Single 1, [])]))]); (Single 3, [really; quite; app])])) in
	johnlikesmary#unify; print_string "johnlikesmary"; print_newline (); johnlikesmary#brackify ;;

#0 "picsofpicsof"
let picsofpicsof = likes (makearguments ([(Single 1, [john (makearguments ([(Single 1, [])]))]); (Single 2, [picsof (makearguments ([(Single 1, [])])); picsof (makearguments ([(Single 1, [])])); mary (makearguments ([(Single 1, [pretty])]))]); (Single 3, [])])) in
	picsofpicsof#unify; print_string "picsofpicsof"; print_newline (); picsofpicsof#brackify ;;

#0 "everyone_top"
let everyone_top = likes (makearguments ([(Single 1, [someone]); (Single 2, [everyone_top]); (Single 3, [])])) in
	everyone_top#unify; print_string "everyone_top"; print_newline (); everyone_top#brackify ;;

#0 "everyevery"
let everyevery = likes (makearguments ([(Single 1, [everyone]); (Single 2, [everyone]); (Single 3, [])])) in
	everyevery#unify; print_string "everyevery"; print_newline (); everyevery#brackify ;;

#0 "forall_exists"
let forall_exists = likes (makearguments ([(Single 2, [everyone]); (Single 1, [someone]); (Single 3, [])])) in
	forall_exists#unify; print_string "forall_exists"; print_newline (); forall_exists#brackify ;;

#0 "exists_forall"
let exists_forall = likes (makearguments ([(Single 1, [someone]); (Single 2, [everyone]); (Single 3, [])])) in
	exists_forall#unify; print_string "exists_forall"; print_newline (); exists_forall#brackify ;;

#0 "refl"
let refl = saw (makearguments ([(Union [1; 2], [himself (makearguments ([(Single 1, [john (makearguments ([(Single 1, [])]))]); (Single 2, [])]))]); (Single 3, [])])) in
	refl#unify; print_string "refl"; print_newline (); refl#brackify ;;

#0 "reflpics"
let reflpics = saw (makearguments ([(Union [1; 2], [themselves (makearguments ([(Single 1, [johnmary (makearguments ([(Single 1, [])]))]); (Single 2, [picsof (makearguments ([(Single 1, [])]))])]))]); (Single 3, [])])) in
	reflpics#unify; print_string "reflpics"; print_newline (); reflpics#brackify ;;

#0 "picsevery"
let picsevery = saw (makearguments ([(Single 1, [john (makearguments ([(Single 1, [])]))]); (Single 2, [picsof (makearguments ([(Single 1, [])])); everyone]); (Single 3, [])])) in
	picsevery#unify; print_string "picsevery"; print_newline (); picsevery#brackify ;;
