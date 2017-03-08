(*======================================================================

              Unification over flat feature structures
			                 Stuart M. Shieber

Provides a very simple form of unification over feature structures
that are "flat", that is, nonrecursive. Feature values can be either
(possibly shared) variables or strings.

======================================================================*)

open List
open Format

(** Features themselves are strings *)
type feature = string

(** Feature values are references to variables or strings, or
forwarding pointers to them *)
type fv =
  | Var of int
  | Val of string
  | Forward of fvalue
and fvalue = fv ref

(*************************************
**   Feature Structure Functions    **
**************************************)

let newint =
  let i = ref 0 in
  fun () -> i := !i + 1; !i ;;
		      
let label s = ref (Val s) ;;
let varlabel i = ref (Var i) ;;

(* Dereferencing values: *)
let rec dereference (v : fvalue) =
  match !v with
  | Var _ | Val _ -> v
  | Forward v' -> dereference v' ;;
  
(* The union of two lists, removing duplicates. Assumes argument lists
have no internal duplicates. *)
let rec union l l' =
  match l with
  | [] -> l'
  | h :: t ->
    if mem h l' then union t l'
	  else h :: (union t l') ;;
			      
let string_of_fval fv =
  match !fv with
  | Var i -> sprintf "[%d]" i 
  | Val s -> s
  | Forward _ -> failwith "string_of_val: shouldn't happen" ;; 

exception AlreadyDefined
exception UnificationFailure

(*************************************
**      Feature Structure Class     **
**************************************)

class fs =
object (this)
  (* Feature structures are implemented as lists of pairs of features
  and values. The list is mutable so that additional pairs can be
  added as unifications proceed *)
  val mutable pairs : (feature * fvalue) list  = []

  (* Extract a list of features that have values in the fs *)
  method features = pairs |> map fst 

  (* True if the fs is defined (has a value) for the feature f *)
  method definedp (f : feature) : bool =
    mem f this#features

  (* Returns the value for the feature f, raising Not_found if the
  feature is not defined in the fs *)
  method lookup (f : feature) : fvalue =
    dereference (assoc f pairs)
		       
  (* Extend the fs by unifying in the feature f with value thatval,
  which may be a variable. *)
  method extend (f: feature) (thatval: fvalue) : unit =
    let thatval = dereference thatval in
    if this#definedp f then
      let thisval = this#lookup f in
      if thisval = thatval then () (* already been unified *)
      else
      	match !thisval, !thatval with
      	| Var _, Var _
      	| Var _, Val _ -> thisval := Forward thatval
      	| Val _, Var _ -> thatval := Forward thisval
      	| Val s, Val t -> if s = t then () else raise UnificationFailure
      	| Forward _, _
      	| _, Forward _ -> failwith "extend: shouldn't happen"
    else
      pairs <- (f, thatval) :: pairs

  (* Unify two features within a single feature structure. This merely
  extends the feature structure at both features with the same
  variable. *)
  method unify_features (f : feature) (f' : feature) : unit =
    let v = ref (Var (newint ())) in
    this#extend f v;
    this#extend f' v

  (* Unify two feature structures by unifying the shared features. *)
  method unify (that : fs) : unit =
    (union this#features that#features)
    |> iter (fun feat -> if this#definedp feat then
			   that#extend feat (this#lookup feat)
			 else this#extend feat (that#lookup feat))

  (* printing *)
  method print : unit =
    let print_remainder feats =
      feats |>
	iter (fun f -> printf ";@;<100 0>@[%s : %s@]"
			      f
			      (string_of_fval (this#lookup f))) in
    printf "[@[<hov 0>";
    (match this#features with
     | [] -> printf "@,"
     | [hd] -> printf "@[%s : %s@]" hd (string_of_fval (this#lookup hd))
     | hd :: tl -> (printf "@[%s : %s@]" hd (string_of_fval (this#lookup hd));
		    print_remainder tl));
    printf "@]]@.";

  (* Performs a "quick check" of the (f,v) pairs against those of another fs
     to see if they could possibly be compatible for unification. *)
  method check (that : fs) : bool =
    for_all (fun f ->
      if that#definedp f
        then match !(this#lookup f), !(that#lookup f) with
        | Val x, Val y -> x = y || x.[0] = '&' || y.[0] = '&' (* FIX THIS once variables are fixed *)
        | _ -> true
      else true) this#features

  method hasv v : bool =
    exists (fun fv -> !(snd fv) = v) pairs
end
  
(*************************************
**    Feature Structure Object      **
**************************************)

let makefs fvs =
  let feat = new fs in
    iter (fun fv -> let (f,v) = fv in feat#extend f v) fvs;
    feat ;;

(* let test () =
  let f1 = new fs in
  f1#extend "a" (label "avalue") ;
  f1#extend "b" (label "bvalue") ;
  f1#print ;
  f1#extend "c" (ref (Var (newint ()))) ;
  let f2 = new fs in
  f2#unify_features "a" "c" ;
  f2#print ;
  f1#unify f2 ;
  f1#print ;
  f2#print ;; *)
