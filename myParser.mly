%{ 
open Unify
open Tree 
open Treeset 
open Forest 
open Derivation
open Argument
open Parsed
%}

%token <string> ID
%token LBRACK RBRACK LPAREN RPAREN QUOTE
%token SUB FOOT VAR
%token FOREST EQ SET DERIV
%token AT COL SEM PER PLUS AND
%token EOF

%start parsed
%type <Parsed.parsed> parsed

%%

/*************************************************
**   INPUT: forest & list of derivation trees   **
*************************************************/

parsed: forest=forest derivs=list(deriv) EOF                  { (forest,derivs) }

/*************************************************
**        Forests, Treesets, and Trees          **
*************************************************/

forest: FOREST id=ID EQ sets=list(set)                        { (id,sets) }
set   : SET id=ID COL ts=separated_list(SEM,t) PER            { (id,ts) }
t     : LBRACK n=node RBRACK                                  { n }
      | QUOTE word=option(ID) QUOTE                           { match word with
                                                                | None -> Leaf ""
                                                                | Some w -> Leaf w }
node  : c=ID ls=list(link) fs=tfs kids=list(t)                { Node(c,ls,fs,kids) }
      | c=ID SUB ls=list(link) fs=tfs                         { Sub(c,ls,fs) }
      | c=ID FOOT ls=list(link) fs=tfs                        { Foot(c,ls,fs) }
      | c=ID ls=list(link) fs=tfs VAR v=ID
        x=option(pair(t,t))                                   { match x with
                                                                | None      -> Var(c,ls,fs,v)
                                                                | Some(l,r) -> Quant(c,v,l,r) }    

/*************************************************
**            Links and Linksets                **
*************************************************/

link  : AT l=int                                              { l }
int   : x=ID                                                  { int_of_string x }
lset  : lset=separated_list(PLUS,link)                        { match lset with
                                                                | [l] -> Single l
                                                                | _ -> Union lset }

/*************************************************
**            Feature Structures                **
*************************************************/

top   : f=feat                                                { f }
bot   : f=preceded(PER,feat)                                  { f }
feat  : LPAREN fvs=separated_list(SEM,fv) RPAREN              { makefs fvs }
fv    : feature=ID COL value=ID                               { (feature, label value) }
      | feature=ID COL AND ID /* NOT FULLY FUNCTIONAL */      { (feature, varlabel (newint ())) } /*varlabel (newint ())*/ /*label ("&"^var)*/
tfs   : t=option(top) b=option(bot)                           { match t, b with
                                                                | None, None     -> {top = new fs ; bot = new fs}
                                                                | None, Some b   -> {top = new fs ; bot = b}
                                                                | Some t, None   -> {top = t ; bot = new fs}
                                                                | Some t, Some b -> {top = t ; bot = b} }       

/*************************************************
**              Derivation Trees                **
*************************************************/

deriv : DERIV id=ID COL der=der PER                           { (id,der) }
der   : word=ID priority=option(prio)
        lst=list(separated_pair(lset,COL,ds))                 { Der(word,priority,lst) }
ds    : ds=separated_list(PLUS,delimited(LBRACK,der,RBRACK))  { ds }
      | pair(LBRACK,RBRACK)                                   { [] }
prio  : p=delimited(LPAREN,separated_list(SEM,int),RPAREN)    { p }
