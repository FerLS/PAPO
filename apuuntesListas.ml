let rec append l1 l2 = match l1 with
  [] -> l2
  | h:: t -> h :: append t l2;;


let rec rev_append l1 l2 = match l1 with
[] -> l2
| h ::t -> rev_append t (h::l2);;

ler append' l1 l2 = rev_append(List.rev l1) l2


let rev = function
[] -> []
| h::t -> (rev t) @ [h];;







let rec fold_left op e = function
    [] -> e
    | h::t -> fold_left op (op e h) t;;

fold_right op[a1;a2;a3] e= op a1(op a2 (op a3))

let rec fold_right op l e = match l with
    [] -> e
    | h::t -> op h (fold_right op t e);;



let sumlist l = fold_left (+) 0 l;;
let length l = 
    fold_left (fun a _ -> a+1) 0 l;;

let last = function
    [] -> raise (Invalid_argument "lmax")
    | h::t -> fold_left max h t;;

let for_all p l = fold_left(fun b x -> b && p h) true l;;

let for_all p= function
    [] -> true
    | h::t -> p h && for_all p t;; 




let rec merge l1 l2 = match (l1,l2) with
    [], l| l, [] ->
    | h1 :: t, h2 :: t2 ->
    if h1<= h2 then h1 :: merge t1 l2
        else h2 :: merge l1 t2;;

let rec divide = function
    h1::h2::t -> let (l1,l2) = divide t in
                    h1:: l1,h2::l2
    | l -> (l,[]);;


let rec m_sort l = match l with

    [] | [_]-> l
    | _ -> let (l1,l2) = divide l in merge (m_sort l1) (m_sort l2);;
    
