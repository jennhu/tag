{
open TagParser 
}

rule token = parse

  (* Delimiters. Trees use brackets, features use parentheses, and comments use braces. *)
  | "[" { LBRACK }  | "]" { RBRACK }
  | "(" { LPAREN }  | ")" { RPAREN }
  | "'" { QUOTE }   | "{" { comments 0 lexbuf }

  (* Symbols for substitution, adjunction, links, and variables. *)
  | "!" { SUB }     | "*" { FOOT }
  | "@" { AT }      | "$" { VAR }

  (* Keywords for forests, multicomponent tree sets, and derivation trees. *)
  | "FOREST" { FOREST } | "SET" { SET }
  | "="      { EQ }     | ":"   { COL }
  | ";"      { SEM }    | "."   { PER }
  | "DERIV"  { DERIV }  | "&"   { AND }
  | "+"      { PLUS }

  (* Identifiers. Spaces, tabs, and newlines are ignored. *)
  | [' ''\t''\n']         { token lexbuf }
  | ['a'-'z''-''A'-'Z''_'
     '0'-'9' '/']* as s   { ID(s) }
  | _ as chr              { failwith ("Invalid char: "^(Char.escaped chr)) }
  | eof                   { EOF }

(* Comments are enclosed in {} and can be nested. *)
and comments level = parse
  | "}"   { if level = 0 then token lexbuf
            else comments (level-1) lexbuf }
  | "{"   { comments (level+1) lexbuf }
  | _     { comments level lexbuf }
  | eof   { print_endline "Comment not closed";
            raise End_of_file }
