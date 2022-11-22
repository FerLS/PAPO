let rec fact = function
0 -> 1
| n -> n * fact (n - 1);;


let result = if Array.length Sys.argv <> 2 then "fact: numero de argumentos invalido" else Int.to_string(fact(int_of_string Sys.argv.(1)));;


print_endline result;;
