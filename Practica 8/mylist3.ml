let rec remove x l= match l with
    [] -> []
    | h::t -> if x = h then t else h :: (remove x t);;

let rec remove_all x l= match l with
    [] -> []
    | h::t -> if x = h then (remove_all x t) else h :: (remove_all x t);;

let rec ldif l1 l2 = match l2 with
    [] -> l1
    | h::t -> ldif (remove_all h l1) t;;

let rec divide = function
    h1::h2::t -> let (l1,l2) = divide t in
                    h1:: l1,h2::l2
    | l -> (l,[]);;

let rec eprod x l = match l with
    [] -> []
    |h::t -> (x,h) :: eprod x t;;

let rec lprod l1 l2 = match l1 with
    [] -> []
    | h::t -> 
    if l2 = [] then []
    else eprod h l2 @ (lprod t l2);;

    
