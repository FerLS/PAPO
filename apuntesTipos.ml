type maybeAnInt = 
    NotAnInt
    |   AnInt of int;;

let quo x y = match x,y with
    _, AnInt 0 -> NotAnInt
    | AnInt m, AnInt n ->  AnInt (m/n)
    | _ -> NotAnInt;;

type foo = Foo;;
type boolean = T| F;;
type palo = Picas | Trebol | Diamante | Corazon ;;


let conj a b = match a,b with
    F,_ -> F
    | _,F -> F
    | _ -> T;;


let conj2 a b = match a,b with
    x,_ -> x;;


let verdadero = T;
let falso = F;

type tipo = Con of int

type maybeAnInt = 
    NotAnInt
    | AnInt of int;;

type 'a option =
    None
    |Some of 'a;;

type nat = 
    Z | S of nat;;
