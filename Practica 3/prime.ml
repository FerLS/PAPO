let is_prime n =
let rec check_from i =
i >= n ||
(n mod i <> 0 && check_from (i+1))
in check_from 2;;

let rec next_prime n = if n > 1 && is_prime n then n else next_prime (n+1);;
let rec last_prime_to n = if n > 1 && is_prime n then n 
else if n <= 1 then 1 
else last_prime_to (n-1);;

let is_prime2 n = let rec checkFrom i =  if i <> 0 && ((abs n) mod i) <> 0 then checkFrom(i-1) else if i = 1 then true else false in  checkFrom ((abs n) -1);;
