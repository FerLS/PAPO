

let rec fib n =
if n <= 1 then n
else fib (n-1) + fib (n-2);;

let rec printFib n = 
if n = 0 then Printf.printf "\n" 
else printFib (n -1) ; Printf.printf "%d\n" (fib n);;

printFib (int_of_string Sys.argv.(1));;
