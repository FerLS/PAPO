let rec factorial n =
    if n = 0.0 then 1.0 else n *. factorial (n -. 1.0);; 

let rec find_e accuracy sum =
    if accuracy = 0.0 then
        sum +. 1.0
    else
        find_e (accuracy -. 1.0) (sum +. 1.0 /. factorial accuracy);;

let result = find_e 100.0 0.0;;


print_float(result);;
print_endline "";;
