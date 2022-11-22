let hd = function
    [] -> failwith "hd"
  | h::t -> h
let tl = function
    [] -> failwith "tl"
  | h::t -> t

let rec length_aux n = function
    [] -> n
  | h::t -> length_aux (n + 1) t;;

let length l = length_aux 0 l;;

let compare_lengths l1 l2 = match l1 with
[] -> if l2 = [] then 0 else -1
| h ::t -> if length l1 > length l2 then 1 else if length l2 > length l1 then -1 else 0  ;;

let nth l n =
  if n < 0 then invalid_arg "List.nth" else
  let rec nth_aux l n =
    match l with
    [] -> failwith "nth"
    | h::t -> if n = 0 then h else nth_aux t (n-1)
  in nth_aux l n;;

let rec append l1 l2 = match l1 with
  [] -> l2
  | h:: t -> h :: append t l2;;

let rec find f = function
  | [] -> raise Not_found
  | h :: t -> if f h then h else find f t;;


  

let rec for_all f = function
    [] -> true
  | h::t -> f h && for_all f t;;
let rec exists f = function
    [] -> false
    | h::t ->  f h || exists f t;;
let rec rev_append l1 l2 =
  match l1 with
    [] -> l2
  | h :: t -> rev_append t (h :: l2);;

let rev l = rev_append l [];;

let  find_all f l =   let rec aux si no = function
      [] -> rev si
      | h::t -> if (f h) then aux (h::si) no t
                else aux si no t
  in aux [] [] l;;

let filter f l =
  let rec aux si no = function
      [] -> rev si
      | h::t -> if (f h) then aux (h::si) no t
                else aux si no t
  in aux [] [] l;;



let partition p l =
  let rec part yes no = function
  | [] -> (rev yes, rev no)
  | x :: l -> if p x then part (x :: yes) no l else part yes (x :: no) l in
  part [] [] l;;

let rec split =  function 
    [] -> ([],[])
    | h::t -> ((fst h :: fst(split t) ),(snd h :: snd(split t)));;


let rec combine l1 l2 =
  match (l1, l2) with
    ([], []) -> []
  | (h1::t1, h2::t2) -> (h1, h2) :: combine t1 t2
  | (_, _) -> invalid_arg "List.combine";;


let rec mem p = function
    [] -> false
    | h::t -> if (p = h) then true
              else (mem p t);;    

let init n f= 
    if n<0 then raise (Invalid_argument "init")
    else let rec aux acc i=
        if i=n then rev acc
        else aux (f i::acc) (i+1)
    in aux [] 0;;



let rec concat = function
    [] -> []
    | h::t -> append h (concat t);;

let flatten = concat;;

let rec map f = function
    [] -> []
    | h::t -> (f h) :: (map f t);;

let rev_map f l =
    let rec auxf l auxl = match l with
        [] -> auxl
        | h::t -> auxf t (f(h)::auxl)
    in auxf l [];;


let rec map2 f l1 l2 =
    if (length l1 != length l2)
        then raise (Invalid_argument"map2")
    else if (length l1 == 0) then []
    else (f(hd l1)(hd l2))::map2 f (tl l1)(tl l2);;

let rec fold_left op e = function
    [] -> e
    | h::t -> fold_left op (op e h) t;;


let rec fold_right op l e = match l with
    [] -> e
    | h::t -> op h (fold_right op t e);;









