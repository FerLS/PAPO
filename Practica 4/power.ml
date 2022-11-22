let rec power x y = if y > 0 then x * power x (y-1) else 1;;
let rec power' x y = if y > 0 then if y mod 2 = 0 then power' (x * x) (y/2) else x * power' (x * x) (y/2) else 1;;

(* Merecec la pena ya que filtras en dos las posbiles entradas optimizando el numero de llamadas para cada caso, como esta en int no tenemos
que preocuparnos por numeros demasiado grandes en cuanto a decimales*)

let rec powerf x n = if n > 0 then x *. powerf x (n-1) else 1.;;
