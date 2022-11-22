let curry f x y = f (x, y);;
let uncurry g (x, y) = g x y;;

uncurry (+)
(*('a -> 'b -> 'c) -> 'a * 'b -> 'c*)

let sum = (uncurry (+));;
(* val sum = ('a -> 'b -> 'c) -> 'a * 'b -> 'c*)
(*sum 1*);;
(*1*)
sum (2,1);;
(*3*)
let g = curry (function p -> 2 * fst p + 3 * snd p);;
(*g = int -> int ->int *)
(*g (2,5);;*)
(*7*)
let h = g 2;;
(*int ->int*)
h 1, h 2, h 3;;
(*int *int *int = (7,9,13)*)
let comp f g = fun x -> (f (g x)) ;;

let f = let square x = x * x in comp square ((+) 1);;
(*es lo mismo que f(g(x)) es decir (x +1)^2*)
f 1, f 2, f 3;;
(*int *int *int = (4,9,16)*)


let i = fun x -> x;;
let j = fun (x,y) -> x;;
let k = fun (x,y) -> y;;
let l = fun x -> x::[];;

(*Se pueden es escribir infinitas funciones en cada tipo*)
