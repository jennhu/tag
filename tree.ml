(*======================================================================

                                TREES

Trees are the atoms of tree-adjoining grammars. In our implementation,
we differentiate between the actual recursive branching structure, which
is represented as an algebraic data type t, and the class tree, which
contains a t as well as methods to find whether it is initial/auxiliary
and return the category, links, and features.

======================================================================*)

open Unify
open List
open Printf
open Basics
open Format (* for printing *)

exception NoCategory
exception NoLinks
exception NoFeatures
exception NoFoot
exception InvalidAddress
exception InitFunction

(** Aliases for documentation purposes. *)
type word = string
type var = string
type categ = string
type quant = string
type linkindex = int
type treeindex = int

(** Gorn numbers to identify every node. *)
type address = int list

(** Top and bottom feature structures for a node. *)
type tfs = {
  top : fs ;
  bot : fs
}

(** Specifies whether a tree is an initial or auxiliary tree. *)
type ttype = Init | Aux

(** Recursive branching structure of tree. *)
type t =
  | Leaf of word
  | Var of categ * linkindex list * tfs * var
  | Node of categ * linkindex list * tfs * t list
  | Sub of categ * linkindex list * tfs
  | Foot of categ * linkindex list * tfs
  | Quant of quant * var * t * t

let cat t =
  match t with
  | Node(x,_,_,_) | Sub(x,_,_)
  | Foot(x,_,_)   | Var(x,_,_,_) -> x
  | _ -> raise NoCategory

let ls t =
  match t with
  | Node(_,ls,_,_) | Sub(_,ls,_)
  | Foot(_,ls,_)   | Var(_,ls,_,_) -> ls
  | _ -> raise NoLinks

let tfs t =
  match t with
  | Node(_,_,tfs,_) | Sub(_,_,tfs)
  | Foot(_,_,tfs)   | Var(_,_,tfs,_) -> tfs
  | _ -> raise NoFeatures

let rec is_aux t =
  match t with
  | Node (_,_,_,kids) -> exists is_aux kids
  | Quant (_,_,l,r)   -> is_aux l || is_aux r
  | Foot _            -> true
  | _                 -> false

let rec foot t =
  match t with
  | Quant(_,_,l,r)   -> tsfoot [l;r]
  | Node(_,_,_,kids) -> tsfoot kids
  | Foot _           -> t
  | _                -> raise NoFoot
and tsfoot ts =
  try foot (find (fun t -> is_aux t) ts) with
  | Not_found -> raise NoFoot

(** Marks t as Init or Aux by checking whether it has a foot node. *)
let ttype t =
  if is_aux t then Aux else Init

(** Unifies the top and bottom features for every node in t,
    raising UnificationFailure if there is any incompatibility. *)
let rec unify_tb t =
  match t with
  | Node(_,_,tfs,kids) -> tfs.top#unify tfs.bot; iter unify_tb kids
  | Quant(_,_,l,r)     -> unify_tb l; unify_tb r
  | Sub(_,_,tfs) 
  | Foot(_,_,tfs) 
  | Var(_,_,tfs,_)     -> tfs.top#unify tfs.bot
  | _                  -> ()

let replace_tfs t fs =
  match t with
  | Node(c,ls,_,kids) -> Node(c,ls,fs,kids)
  | Sub(c,ls,_)       -> Sub(c,ls,fs)
  | Foot(c,ls,_)      -> Foot(c,ls,fs)
  | Var(c,ls,_,v)     -> Var(c,ls,fs,v)
  | _                 -> t

(** Returns the node at a Gorn number address within t. *)
let lookup address t =
  let rec aux t a =
    if a = [] then t
    else match t with
    | Quant(_,_,l,r) -> auxts [l;r] a
    | Node(_,_,_,kids) -> auxts kids a
    | _ -> raise InvalidAddress
  and auxts ts a =
    try aux (nth ts ((hd a)-1)) (tl a)
    with nth -> raise InvalidAddress in
  aux t address

(** Makes a function out of an auxiliary tree. Fails with InitFunctionError
   if there is no foot in t, which is determined by checking ttype. *) 
let auxfun t =
  let rec aux t foot =
    match t with
    | Node(c,ls,fs,kids) -> Node(c,ls,fs,map (fun k -> aux k foot) kids)
    | Quant(c,v,l,r)     -> Quant(c,v,aux l foot,aux r foot)
    | Foot(_,_,fs)       -> replace_tfs foot fs
    | _                  -> t in
  match ttype t with
  | Init -> raise InitFunction
  | Aux -> aux t

(** Returns true if t has a specified link. *)
let haslink (i:linkindex) t =
  let rec aux t =
    match t with
    | Node(_,ls,_,kids) -> mem i ls || exists aux kids 
    | Quant(_,_,l,r)    -> aux l    || aux r
    | Sub(_,ls,_) 
    | Foot(_,ls,_) 
    | Var(_,ls,_,_)     -> mem i ls
    | Leaf _            -> false in
  aux t

(** Unifies top and bottom features at every node in t. *)
let unify t =
    try unify_tb t with Not_found -> raise UnificationFailure

(** Unifies features of two trees for substitution:
     the top fs of (this) with the bottom fs of target. *)
let unifysub (target:t) t =
  try (tfs t).top#unify (tfs target).bot
  with NoFeatures -> ()

(** Unifies features of two trees for adjunction:
    the top fs of (this) with the top fs of target, and
    the bottom fs of this foot with the bottom fs of target. *)
let unifyadj (target:t) t =
  try
    (tfs t).top#unify (tfs target).top;
    (tfs (foot t)).bot#unify (tfs target).bot
  with NoFeatures -> ()

(** Performs a "quick check" of the features of (this) and a t.
    Returns true if the features seem compatible at first glance,
    without actually following all the pointers. *)
let fscheck (that:t) t =
  try
    (tfs t).top#check (tfs that).top &&
    (tfs t).bot#check (tfs that).bot
  with NoFeatures -> true

(** Prints the tree in the bracketed textual notation. *)
let brackify t =
  let ident = print_string in
  let kwd = print_string in
  (* TODO: FIX CLOSING BRACKETS, INCLUDE FEATURES AND LINKS *) 
  let rec print_t = function
    | Leaf x -> if x = "" then print_string "(t)" else kwd "'"; ident x; kwd "'"
    | Var(c,_,_,v) -> kwd "["; ident c; kwd "$"; ident v; kwd "]"
    | Sub(c,_,_) -> kwd "["; ident c; kwd "!"; kwd "]"
    | Foot(c,_,_) -> kwd "["; ident c; kwd "*"; kwd "]"
    | Node(c,_,_,[Leaf x]) ->
        kwd "["; open_vbox 2;
            ident c; if x = "" then print_string "(t)" else kwd "'"; ident x; kwd "'";
        close_box(); kwd "]"
    | Node(c,_,_,kids) ->
        kwd "["; open_vbox 2;
            ident c; print_cut(); iter (fun k -> print_t k; print_cut()) kids;
        close_box(); kwd "]"
    | Quant(q,v,l,r) ->
        kwd "["; open_vbox 2;
            ident q; kwd "$"; ident v; print_cut();
            print_t l; print_cut(); print_t r; print_cut();
        close_box(); kwd "]" in
  print_t t; print_newline(); print_newline()

 (*    let rec brack_t t level =
      match t with
      | Leaf x -> if x = "" then "(t)" else sprintf "'%s'" x
      | Var(c,ls,fs,v) -> sprintf "[%s%s%s $%s]" c (l_to_txt ls) (tfs_to_txt fs) v
      | Node(c,ls,fs,[Leaf x]) -> indent level (sprintf "[%s%s%s '%s']" c (l_to_txt ls) (tfs_to_txt fs) x)
      | Node(c,ls,fs,kids) ->
        let k = map (fun kid -> indent (level+1) (brack_t kid (level+1))) kids in
        let s = sprintf "[%s%s%s\n%s]" c (l_to_txt ls) (tfs_to_txt fs) (sep "\n" k) in
          indent level s
      | Sub(c,ls,fs) -> sprintf "[%s!%s%s]" c (l_to_txt ls) (tfs_to_txt fs)
      | Foot(c,ls,fs) -> sprintf "[%s*%s%s]" c (l_to_txt ls) (tfs_to_txt fs)
      | Quant(q,v,l,r) -> 
        let k = (indent (level+1) (brack_t l (level+1)))^"\n"^
                (indent (level+1) (brack_t r (level+1))) in
        indent level (sprintf "[%s $%s\n%s]" q v k)
    and l_to_txt ls = ""
      (* fold_left (fun acc l -> sprintf "%s@%i" acc l) "" ls *)
    and tfs_to_txt tfs =
      let aux fs =
        try
          paren (sep "; " (map (fun f -> let v = fs#lookup f in
            sprintf "%s:%s" f (string_of_fval v)) fs#features))
        with Not_found -> "" in
      aux tfs.top in
    print_string (brack_t t 0) *)

(** Prints the abstract syntax tree of the tree. *)
let tostring t = 
  let rec treestr t =
    match t with
    | Leaf x             -> sprintf "Leaf \"%s\"" x
    | Var(c,ls,fs,v)     -> sprintf "Var(\"%s\",%s,%s,\"%s\")" c (linksstr ls) (fspecs_str fs) v
    | Foot(c,ls,fs)      -> sprintf "Foot(\"%s\",%s,%s)" c (linksstr ls) (fspecs_str fs)
    | Sub (c,ls,fs)      -> sprintf "Sub(\"%s\",%s,%s)" c (linksstr ls) (fspecs_str fs)
    | Quant (q,v,l,r)    -> sprintf "Quant(\"%s\",\"%s\",%s,%s)" q v (treestr l) (treestr r)
    | Node(c,ls,fs,kids) -> let kstr = lstr (map treestr kids) in
                            sprintf "Node(\"%s\",%s,%s,%s)" c (linksstr ls) (fspecs_str fs) kstr
  and linksstr ls = lstr (map string_of_int ls)
  and fspecs_str fspecs =
    let aux fs = 
      try map (fun f -> 
        let v = dereference (fs#lookup f) in 
          match !v with
          | Var i -> sprintf "(\"%s\",varlabel %i)" f i
          | Val s -> sprintf "(\"%s\",label \"%s\")" f s
          | _ -> failwith "treestr: something went wrong") fs#features
      with Not_found -> [] in
    let tops, bots = aux fspecs.top, aux fspecs.bot in
    sprintf "{top = makefs %s ; bot = makefs %s}" (lstr tops) (lstr bots) in
  treestr t

(*************************************
**         tree Functions           **
**************************************)

(** Given a tree list, returns a new list with the trees rearranged
    so that initial trees come first in the set. Used for substitution,
    in case we need to adjoin at a Sub node. See derive.ml for more details. *)

let initfirst ts =
  let (inits,auxes) = partition (fun t -> ttype t = Init) ts in
    inits@auxes
