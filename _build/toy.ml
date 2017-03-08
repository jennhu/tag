open Unify
open Tree
open Treeset
open Argument
open Derive

(* FOREST "example" *)

#0 "john"
let john =
	let set = setofts ([Foot("s",[],{top = makefs [] ; bot = makefs []}); Node("np",[1],{top = makefs [] ; bot = makefs []},[Leaf "john"]); Foot("t",[],{top = makefs [] ; bot = makefs []}); Node("e",[1],{top = makefs [] ; bot = makefs []},[Leaf "j"])]) in
		derive set ;;

#0 "mary"
let mary =
	let set = setofts ([Foot("s",[],{top = makefs [] ; bot = makefs []}); Node("np",[1],{top = makefs [] ; bot = makefs []},[Leaf "mary"]); Foot("t",[],{top = makefs [] ; bot = makefs []}); Node("e",[1],{top = makefs [] ; bot = makefs []},[Leaf "m"])]) in
		derive set ;;

#0 "saw"
let saw =
	let set = setofts ([Node("s",[1; 2],{top = makefs [] ; bot = makefs []},[Sub("np",[1],{top = makefs [] ; bot = makefs []}); Node("vp",[3],{top = makefs [] ; bot = makefs []},[Node("v",[],{top = makefs [] ; bot = makefs []},[Leaf "saw"]); Sub("np",[2],{top = makefs [] ; bot = makefs []})])]); Node("t",[1; 2; 3],{top = makefs [] ; bot = makefs []},[Node("et",[],{top = makefs [] ; bot = makefs []},[Node("eet",[],{top = makefs [] ; bot = makefs []},[Leaf "saw"]); Sub("e",[2],{top = makefs [] ; bot = makefs []})]); Sub("e",[1],{top = makefs [] ; bot = makefs []})])]) in
		derive set ;;

(* DERIVATION TREES *)

#0 "johnsawmary"
let johnsawmary = saw (makearguments ([(Single 1, [john (makearguments ([(Single 1, [])]))]); (Single 2, [mary (makearguments ([(Single 1, [])]))]); (Single 3, [])])) in
	johnsawmary#unify; print_string "johnsawmary"; print_newline (); johnsawmary#brackify ;;
