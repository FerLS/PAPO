let f n = if n mod 2 = 0 then n / 2 else 3 * n + 1;;
let rec orbit n = if n != 1 then (Int.to_string n)^", "^orbit(f n) else "1";;
let rec length n = if n!= 1 then 1 + length (f n) else 0;;
let rec top n = if n!=1 then let x = top(f n) in if n > x then n else x else 1;;
let rec length'n'top n = if n!= 1 then ((if n!= 1 then 1 + fst (length'n'top (f n)) else 0),(if n!=1 then if n > snd (length'n'top (f n)) then n else snd(length'n'top(f n)) else 1))  else (0,1);;
let rec longest_in n m = 
if n < m then let x = (longest_in(n+1) m) in
            if  (length n) >= snd(x) 
            then (n,length n) 
            else x
else (m,length m);;

let rec highest_in n m = 
if n < m then let x = (highest_in (n +1) m) in
            if  (top n) >= snd(x)
            then (n,top n) 
            else x
else (m,top m);;



