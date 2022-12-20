
open G_tree;;

let rec breadth_first = function
    Gt (x, []) -> [x]
  | Gt (x, (Gt (y, t2))::t1) -> x :: breadth_first (Gt (y, t1@t2));;


let breadth_first_t tree =
  let rec aux queue acc =
    match queue with
    | [] -> List.rev acc
    | Gt (x, children) :: t -> aux (t @ children) (x :: acc)
  in
  aux [tree] [];;

let gen size = 
 let rec aux a s = match a with 
     Gt(x,[]) -> a
    | Gt(x,h::t) -> if s = 0 then a else  aux (Gt (x,[a])) (s-1)
in
aux (Gt (1,[Gt (1,[])])) size;;

let t2 = gen 1000000;;
