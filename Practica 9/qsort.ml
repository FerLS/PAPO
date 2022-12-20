let rec qsort1 ord = function
[] -> []
| h::t -> let after, before = List.partition (ord h) t in
qsort1 ord before @ h :: qsort1 ord after;;

(*puede tener un rendimiento no óptimo en el caso en que se reciba
una lista que ya está ordenada de acuerdo con la función ord dada como argumento. *)


let rec qsort2 ord =
let append' l1 l2 = List.rev_append (List.rev l1) l2 in
function
[] -> []
| h::t -> let after, before = List.partition (ord h) t in
append' (qsort2 ord before) (h :: qsort2 ord after);;

(*En el caso en que se recibe una lista tendra un rendimiento mejor. En este caso, en cada iteración, la función particionará la lista en dos sublistas de tamaños muy diferentes, lo que permitirá que la función termine de ejecutarse en un número relativamente pequeño de iteraciones*)



let l1 = [];;
(*No porque solo cambia la forma de la que concatena las listas y no su resultado*)

(*Al utilizar List.rev_append en lugar de la concatenación directa, qsort2 tendrá que realizar un número adicional de operaciones para invertir el orden de los elementos en cada sublista, lo que podría afectar negativamente su rendimiento. La funciona*)
(*La funcion de qsort2 es mas optima en un 20% mas o menos, aunque al ser recursiva terminal, tiene una clara venaja frente a qsort1 en escenarios
de mas de un millon de elementos*)
