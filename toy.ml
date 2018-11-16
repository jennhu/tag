open Unify
open Tree
open Treeset
open Argument
open Derive

(* FOREST "john_saw_a_girl" *)

#0 "john"
let john =
	setofts ([Node("np",[],{top = makefs [] ; bot = makefs []},[Leaf "john"]); Node("e",[],{top = makefs [] ; bot = makefs []},[Leaf "j"])]) ;;

#0 "a_girl"
let a_girl =
	setofts ([Node("np",[],{top = makefs [] ; bot = makefs []},[Leaf "a_girl"]); Node("t",[],{top = makefs [] ; bot = makefs []},[Quant("exists","g",Node("t",[],{top = makefs [] ; bot = makefs []},[Node("et",[],{top = makefs [] ; bot = makefs []},[Leaf "girl"]); Var("e",[],{top = makefs [] ; bot = makefs []},"g")]),Foot("t",[],{top = makefs [] ; bot = makefs []}))]); Var("e",[],{top = makefs [] ; bot = makefs []},"g")]) ;;

#0 "saw"
let saw =
	let set = setofts ([Node("s",[],{top = makefs [] ; bot = makefs []},[Sub("np",[1],{top = makefs [] ; bot = makefs []}); Node("vp",[],{top = makefs [] ; bot = makefs []},[Node("v",[],{top = makefs [] ; bot = makefs []},[Leaf "saw"]); Sub("np",[2],{top = makefs [] ; bot = makefs []})])]); Node("t",[2],{top = makefs [] ; bot = makefs []},[Node("et",[],{top = makefs [] ; bot = makefs []},[Node("eet",[],{top = makefs [] ; bot = makefs []},[Leaf "saw"]); Sub("e",[2],{top = makefs [] ; bot = makefs []})]); Sub("e",[1],{top = makefs [] ; bot = makefs []})])]) in
		derive set ;;

(* DERIVATION TREES *)

#0 "john_saw_a_girl"
let john_saw_a_girl = saw (makearguments ([(Single 1, [john]); (Single 2, [a_girl])])) in
	john_saw_a_girl#unify; print_string "john_saw_a_girl"; print_newline (); john_saw_a_girl#brackify ;;
