let rec divide l = match l with
h1::h2::t -> let t1, t2 = divide t in (h1::t1, h2::t2)
| _ -> l, [];;
let rec merge = function
[], l | l, [] -> l
| h1::t1, h2::t2 -> if h1 <= h2 then h1 :: merge (t1, h2::t2)
else h2 :: merge (h1::t1, t2);;
let rec msort1 l = match l with
[] | _::[] -> l
| _ -> let l1, l2 = divide l in
merge (msort1 l1, msort1 l2);;


let l2 = List.init 1000000 (fun x -> x);;    



let divide' l =
  let rec aux l1 l2 = function
    | [] -> l1, l2
    | [x] -> x::l1, l2
    | x::y::t -> aux (x::l1) (y::l2) t
  in aux [] [] l;;

let merge' cmp (l1,l2) =
  let rec aux acc = function
    | [], [] -> acc
    | [], l | l, [] -> List.rev_append l acc
    | x::t1, y::t2 ->
      if cmp x y then aux (x::acc) (t1, y::t2)
      else aux (y::acc) (x::t1, t2)
  in aux [] (l1, l2);;


let msort2 cmp l =
  let rec aux = function
    | [] | [_] -> l
    | _ ->
      let l1, l2 = divide' l in
      merge' cmp ((aux l1),(aux l2))
  in aux l;;


(*msort1 es mas mas lenta que msort2 ya que el tiempo de ejecuion es mayor en 0.12 s , y asi tambien es msort2 mas lenta que qsort2 * )


