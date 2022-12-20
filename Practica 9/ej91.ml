

let to0from n = n :: List.rev(List.init n (function x -> x));;

let fromto m n = (List.init (n-m+1) (function x -> x +m));;


let incseg = function
    [] -> []
    | h::t -> let rec aux c l n= match l with
                [] -> n
                | h::t ->let cola = h :: c  in  (aux cola t ((List.fold_left (+) 0 cola) :: n) )
    in List.rev (aux [] (h::t) []);;
    


