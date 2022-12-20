
open Context;;
open Lib;;

type arith_oper =
    Opp;;

type arith_bi_oper =
    Sum | Sub | Prod | Div | Mod | Pow;;

type arith =
    Float of float
  | Var of string
  | Arith_op of arith_oper * arith
  | Arith_bi_op of arith_bi_oper * arith * arith
  | Fun_call of string * arith;;

let rec eval ctx = function
    Float f ->
      f

  | Var name ->
      get_binding ctx name

  | Arith_op (Opp, a) ->
      -. (eval ctx a)

  | Arith_bi_op (Sum, a1, a2) ->
      (eval ctx a1) +. (eval ctx a2)

  | Arith_bi_op (Sub, a1, a2) ->
      (eval ctx a1) -. (eval ctx a2)

  | Arith_bi_op (Prod, a1, a2) ->
      (eval ctx a1) *. (eval ctx a2)

  | Arith_bi_op (Div, a1, a2) ->
      (eval ctx a1) /. (eval ctx a2)

  | Arith_bi_op (Mod, a1, a2) ->
      mod_float (eval ctx a1) (eval ctx a2)

  | Arith_bi_op (Pow, a1, a2) ->
      (eval ctx a1) ** (eval ctx a2)

  | Fun_call (name, a) ->
      let f = get_function name in
      f (eval ctx a)
;;
