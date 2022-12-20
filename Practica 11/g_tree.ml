
type 'a g_tree =
  Gt of 'a * 'a g_tree list
;;

let rec size = function 
    Gt (_, []) -> 1
  | Gt (r, h::t) -> size h + size (Gt (r, t))
;;

let rec height = function 
    Gt (_,[]) ->  1
    | Gt (r,h::t) -> height h +1 ;;


let rec leaves  = function 
    Gt (r,[]) -> [r]
    | Gt (r,h::t) -> if t = [] then leaves h else  List.append (leaves h) (leaves (Gt (r, t)));;

let rec mirror tree =
  match tree with
  | Gt (value, children) -> Gt (value, List.rev (List.map mirror children));;


let rec postorder  = function 
    Gt (r,[]) -> [r]
    | Gt (r,h::t) -> List.append (postorder h) (postorder (Gt (r, t)));;


let rec preorder = function
     Gt (r,[]) -> [r]
    | Gt (r,h::t) -> List.append  (List.append [r] (preorder h)) (List.tl (preorder (Gt (r, t)))) ;;

Gt (1,[Gt (4,[Gt (2,[]);Gt (7,[])]);Gt (8,[])]);;z
