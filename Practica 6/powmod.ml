let rec power' x y = if y > 0 then if y mod 2 = 0 then power' (x * x) (y/2) else x * power' (x * x) (y/2) else 1;;

let rec powmod m b e = if e > 0 then ((b mod m) * (powmod m b (e-1))) mod m else 1;;
