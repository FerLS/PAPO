
type 'a bin_tree =
    Empty
  | Node of 'a * 'a bin_tree * 'a bin_tree
;;


let rec fold_tree f a = function
    Empty -> a
  | Node (x, l, r) -> f x (fold_tree f a l) (fold_tree f a r)
;;

(* map_tree: ('a -> 'b) -> 'a bin_tree -> 'b bin_tree
   Aplica la función f a cada elemento del árbol y devuelve un nuevo árbol con los elementos transformados. *)
let rec map_tree f = function
  | Empty -> Empty
  | Node (x, left, right) -> Node (f x, map_tree f left, map_tree f right)

(* sum: int bin_tree -> int
   Devuelve la suma de todos los elementos del árbol. *)
let rec sum = function
  | Empty -> 0
  | Node (x, left, right) -> x + sum left + sum right

(* prod: int bin_tree -> int
   Devuelve el producto de todos los elementos del árbol. *)
let rec prod = function
  | Empty -> 1.0
  | Node (x, left, right) -> x *. prod left *. prod right

(* size: 'a bin_tree -> int
   Devuelve la cantidad de nodos del árbol. *)
let rec size = function
  | Empty -> 0
  | Node (_, left, right) -> 1 + size left + size right

(* height: 'a bin_tree -> int
   Devuelve la altura del árbol. *)
let rec height = function
  | Empty -> 0
  | Node (_, left, right) -> 1 + max (height left) (height right)

(* inorder: 'a bin_tree -> 'a list
   Devuelve una lista con los elementos del árbol en orden simétrico. *)
let rec inorder = function
  | Empty -> []
  | Node (x, left, right) -> inorder left @ [x] @ inorder right

(* mirror: 'a bin_tree -> 'a bin_tree
   Devuelve un nuevo árbol con el espejo del árbol original. *)
let rec mirror = function
  | Empty -> Empty
  | Node (x, left, right) -> Node (x, mirror right, mirror left)

