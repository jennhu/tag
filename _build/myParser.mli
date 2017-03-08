
(* The type of tokens. *)

type token = 
  | VAR
  | SUB
  | SET
  | SEM
  | RPAREN
  | RBRACK
  | QUOTE
  | PLUS
  | PER
  | LPAREN
  | LBRACK
  | ID of (string)
  | FOREST
  | FOOT
  | EQ
  | EOF
  | DERIV
  | COL
  | AT
  | AND

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val parsed: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Parsed.parsed)
