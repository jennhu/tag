open Unify
open Tree
open Treeset
open Argument
open Derive

(* FOREST "toygrammar" *)

#0 "mary"
let mary =
	let set = setofts ([Foot("s",[],{top = makefs [] ; bot = makefs []}); Node("np",[1],{top = makefs [] ; bot = makefs [("per",label "3"); ("num",label "sg")]},[Leaf "mary"]); Foot("t",[],{top = makefs [] ; bot = makefs []}); Node("e",[1],{top = makefs [] ; bot = makefs [("per",label "3"); ("num",label "sg")]},[Leaf "m"])]) in
		derive set ;;

#0 "john"
let john =
	let set = setofts ([Foot("s",[],{top = makefs [] ; bot = makefs []}); Node("np",[1],{top = makefs [] ; bot = makefs [("per",label "3"); ("num",label "sg")]},[Leaf "john"]); Foot("t",[],{top = makefs [] ; bot = makefs []}); Node("e",[1],{top = makefs [] ; bot = makefs [("per",label "3"); ("num",label "sg")]},[Leaf "j"])]) in
		derive set ;;

#0 "himself"
let himself =
	let set = setofts ([Foot("s",[1],{top = makefs [] ; bot = makefs []}); Foot("s",[2],{top = makefs [] ; bot = makefs []}); Node("np",[2],{top = makefs [] ; bot = makefs [("per",label "3"); ("num",label "sg"); ("case",label "acc")]},[Leaf "himself"]); Sub("np",[1],{top = makefs [] ; bot = makefs []}); Node("t",[1],{top = makefs [] ; bot = makefs []},[Node("et",[],{top = makefs [] ; bot = makefs []},[Node("eetet",[],{top = makefs [] ; bot = makefs []},[Leaf "refl/recp"]); Node("eet",[],{top = makefs [] ; bot = makefs []},[Var("lambda",[],{top = makefs [] ; bot = makefs []},"a"); Node("et",[],{top = makefs [] ; bot = makefs []},[Var("lambda",[],{top = makefs [] ; bot = makefs []},"b"); Foot("t",[],{top = makefs [] ; bot = makefs []})])])]); Sub("e",[1],{top = makefs [] ; bot = makefs []})]); Foot("t",[2],{top = makefs [] ; bot = makefs []}); Var("e",[2],{top = makefs [] ; bot = makefs []},"a"); Var("e",[],{top = makefs [] ; bot = makefs []},"b")]) in
		derive set ;;

#0 "cousinsof"
let cousinsof =
	let set = setofts ([Foot("s",[],{top = makefs [] ; bot = makefs []}); Node("np",[],{top = makefs [] ; bot = makefs []},[Node("d",[],{top = makefs [] ; bot = makefs []},[Leaf "the"]); Node("np",[1],{top = makefs [] ; bot = makefs [("num",label "pl")]},[Node("n",[],{top = makefs [] ; bot = makefs []},[Leaf "cousins"]); Node("pp",[],{top = makefs [] ; bot = makefs []},[Node("p",[],{top = makefs [] ; bot = makefs []},[Leaf "of"]); Foot("np",[],{top = makefs [] ; bot = makefs [("case",label "acc")]})])])]); Foot("t",[],{top = makefs [] ; bot = makefs []}); Node("e",[1],{top = makefs [] ; bot = makefs [("num",label "pl")]},[Var("unique",[],{top = makefs [] ; bot = makefs []},"z"); Node("t",[],{top = makefs [] ; bot = makefs []},[Node("et",[],{top = makefs [] ; bot = makefs []},[Node("eet",[],{top = makefs [] ; bot = makefs []},[Leaf "cousinsof"]); Foot("e",[],{top = makefs [] ; bot = makefs [("case",label "acc")]})]); Var("e",[],{top = makefs [] ; bot = makefs []},"z")])])]) in
		derive set ;;

#0 "saw"
let saw =
	let set = setofts ([Node("s",[1; 2],{top = makefs [] ; bot = makefs []},[Sub("np",[1],{top = makefs [("case",label "nom")] ; bot = makefs [("per",varlabel 2); ("num",varlabel 1)]}); Node("vp",[3],{top = makefs [("per",varlabel 4); ("num",varlabel 3)] ; bot = makefs []},[Node("v",[],{top = makefs [] ; bot = makefs []},[Leaf "saw"]); Sub("np",[2],{top = makefs [("case",label "acc")] ; bot = makefs []})])]); Node("t",[1; 2; 3],{top = makefs [] ; bot = makefs []},[Node("et",[],{top = makefs [] ; bot = makefs []},[Node("eet",[],{top = makefs [] ; bot = makefs []},[Leaf "saw"]); Sub("e",[2],{top = makefs [("case",label "acc")] ; bot = makefs []})]); Sub("e",[1],{top = makefs [("case",label "nom")] ; bot = makefs []})])]) in
		derive set ;;

(* DERIVATION TREES *)

#0 "cousins_features"
let cousins_features = saw (makearguments ([(Single 2, [john (makearguments ([(Single 1, [])]))]); (Single 1, [cousinsof (makearguments ([(Single 1, [])])); mary (makearguments ([(Single 1, [])]))]); (Single 3, [])])) in
	cousins_features#unify; print_string "cousins_features"; print_newline (); cousins_features#brackify ;;
