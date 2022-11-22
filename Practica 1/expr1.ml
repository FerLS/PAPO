();;
 (*el valor unit (parecido a void)*)
 
2+5*3;;
(*dara 17*)

1.0;;
(*float con valor 1.0*)

(*1.0*2;; en efecto da de tipo*)
(*Dara error de tipo*)

(*2 - 2.0;;*)
(*Dara error de tipo*)

3.0 +. 2.0;;
(*Dara 5 float*)

5 / 3;;
(*Dara 5/3 float*)

5 mod 3;;
(*Dara el resto de 5/3*)

3.0 *. 2.0 ** 3.0;;
(*Dara error porque falta un punto, en realidad da un float ** es exponente*)

 3.0 = float_of_int 3;;
 (*Dara true*)
 
 sqrt 4.;;
 (*dara la raiz de 4*)

int_of_float 2.1 + int_of_float (-2.9);;
(*dara un int con valor redondedo de los dos -3 + 2, en realidad trunca*)

truncate 2.1 + truncate (-2.9);;
(*dara lo mismo que arriba*)

floor 2.1 +. floor (-2.9);;
(*dara 2 + -2 = 0 float, en realidad si es negativo floor va hacia abajo*)

(*ceil 2.1 +. ceil -2.9;;error porque falta parentesis*)
(*Al reves que el floor,tira hacia el numero entero mas arriba*)

2.0 ** 3.0 ** 2.0;;
(*Exponenciacion entre ellos da float*)

'B';;
(*Da char B*)

int_of_char 'A';;
(*Dara su valor de A en ASCII*)

 char_of_int 66;;
(*Dara su valor en char en ASCII*)

Char.code 'B';;
(*Lo mismo que la anterior anterior*)

Char.chr 67;;
(*Lo mismo que la anterior anterior*)

(*\0671;; Illegal Character*)
(*ni idea*)

Char.chr (Char.code 'a' - Char.code 'A' + Char.code 'M');;
(*Convertir a int lo de dentro en su codigo ASCII y despues el resultado a char*)

"this is a string";;
(*tipo string*)

String.length "longitud";;
(* el numero de caracters de la cadena*)

(*"1999" + "1";; type error esperaba un int en la suma*)
(*string = 19991*)

"1999" ^  "1";;
(*concatenara los strings,19991*)

int_of_string "1999" + 1;;
(*int = 2000*)

"\064\065";;
(*string = "\064\065",en realidad da @A*)

string_of_int 010;;
(*string = "10"*)

not true;;
(*boolean = false*)

true && false;;
(*boolean = false*)

true || false;;
(*boolean = true*)

 (1 < 2) = false;;
 
 (*boolean = false*)
 
"1" < "2";;
(*error of type, en realidad da true*)

2 < 12;;
(*boolean = true*)

"2" < "12";;
(* compara su ASCII y da boolean*)

"uno" < "dos";;
(* compara su ASCII y da boolean*)

if 3 = 4 then 0 else 4;;
(*int = 4*)

if 3 = 4 then "0" else "4";;
(*string = "4"*)

(*if 3 = 4 then 0 else "4";;,error of type esperaba un int*)
(*string = "4"*)

(if 3 < 5 then 8 else 10) + 4;;
(*int = 12*)


2.0 *. asin 1.0;;
(*float = 0.0,en relidad es PI*)

sin (2.0 *. asin 1.0 /. 2.);;
(*type float*)

function x -> 2 * x;;
(*crea una funcion?, define la funcion*)

(function x -> 2 * x) (2 + 1);;
(*define y ejecuta la funcion*)

let x = 1;; 
(*no se , en realidad asigna a x =1*)
let y = 2;;
(*da a y el valor 2*)
 x - y;;
 (* int = -1*)

let x = y  in x - y;;
(*le da el valor de x a y y resta*)

(*z;;*)
(*error por falta de valor*)

let z = x + y;;
(* z =x +y*)
z;;
(*int = 3*)

let x = 5;; 

let y = 5 in x + y;;

x + y;;
(*int = 3*)

let x = x + y in let y = x * y in x + y + z;; 
(*int = 12*)

x + y + z;;
(*int = 6*)

int_of_float;;
(*describe la funcion, da un int y devuelve un float*)

float_of_int;;
(*describe la funcion, rednodea un float a int*)

int_of_char;;
(*describe la funcion, da el ASCII del char*)

char_of_int;;
(*describe la funcion, de el char del ASCII*)

abs;;
(*describe la funcion, valor absoluto*)

sqrt;;
(*describe la funcion,raiz cuadrada*)

truncate;;
(*describe la funcion,trunca el numero*)

ceil;;
(*describe la funcion, coge el entero cercano mas alto*)

floor;;
(*describe la funcion,coge el entero cercano mas bajo*)

Char.code;;
(*describe la funcion, da el ASCII del char*)

Char.chr;;
(*describe la funcion, da el char del ASCII*)

int_of_string;;
(*describe la funcion, convierte un numero string en int*)

string_of_int;;
(*describe la funcion, convierte un int en string*)

String. length;;
(*describe la funcion, da la longitud de la cadena*)

 let f = function x -> 2 * x;;
(* guarda una funcion en la variable f*)
 
f (2+1);;
(*corre la funcion con 3*)

f 2 + 1;;
(*Corre la funcion con 2 y le suma 1*)


let n = 1;;
(*le da a n el valor 1*)

let g x = x + n;;
(*Declara una funcion en g que usa n*)

g 3;;
(*int = 4*)

let n = 5;;
(*cambia n a 5*)

g 3;;
(*int = 8*)

let l = function r -> let pi = 2.0 *. asin 1.0 in 2.0  *. pi *. r;;
(*declara una funcion dentro de r*)

l 3.0;;
(*calcula la funcion con el valor 3.0*)

(*l 2;;*)
(*error por tipo de dato int*)

(*pi;;*)
(*no se declaro esa variable*)

let pi = 2.0 *. asin 1.0;;
(*le da el valor a pi*)

pi;;
(*float= 3.14...*)

let v = function r -> pi *. r ** 2.0;;

(*declara la funcion en v,calcula el volumen*)

 v 2.0;;

(*calcula el volumen con radio 2*)
