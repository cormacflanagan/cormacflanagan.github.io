(* CMPS 253 Homework for April 28th *)

type tp =
    Top
  | Nat
  | Even
  | Prod of tp * tp
  | Fun of tp * tp
  | Mu of tvar * tp
  | Var of tvar
and tvar = string;;

(* This set of pairs of types may be helpful: see
 * http://caml.inria.fr/pub/docs/manual-ocaml/libref/Set.S.html         
 *)

module TpPairSet = Set.Make(struct 
  type t = tp * tp 
  let compare = compare 
end);;

exception Fail;;

let (subtype: tp -> tp -> bool) =
  fun s t ->
    (* 
     * Your code goes here 
     * Based on Chapters 20 and 21
     *)
    raise Fail;;


(* Write some test cases (both positive and negative)
 * Please share them via email
 * Here's some to get you started ...
 *)

let x = "x";;

assert (subtype 
	  (Mu(x,Fun(Nat,Prod(Nat,Var(x)))))
	  (Mu(x,Fun(Nat,Prod(Nat,Var(x))))));;

assert (subtype 
	  (Mu(x,Fun(Nat,Prod(Even,Var(x)))))
	  (Mu(x,Fun(Even,Prod(Nat,Var(x))))));;

assert (not (subtype 
	       (Mu(x,Fun(Even,Prod(Even,Var(x)))))
	       (Mu(x,Fun(Nat,Prod(Nat,Var(x)))))));;

assert (not (subtype 
	       (Mu(x,Fun(Nat,Prod(Nat,Var(x)))))
	       (Mu(x,Fun(Even,Prod(Even,Var(x)))))));;

