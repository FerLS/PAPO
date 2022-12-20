let trees =
[(1,1); (1,3); (1,6); (1,11); (1,12); (1,15); (1,16); (2,1); (2,15); (3,6);
(3,7); (3,9); (3,12); (4,3); (4,12); (4,15); (5,1); (6,3); (6,7); (6,9);
(6,13); (6,14); (6,16); (7,3); (7,5); (7,16); (8,10); (8,11); (8,13);
(8,16); (9,1); (9,3); (9,13); (10,6); (10,9); (10,10); (11,16); (12,1);
(12,4); (12,6); (12,13); (13,11); (13,13); (14,1); (14,7); (14,9); (15,2);
(15,4); (15,6); (15,7); (15,13); (15,16); (16,4); (16,11); (16,13);
(16,16)];;




let tour m n trees x = 


let rec avalPos now jump visited = 

    if jump = 0 then (0,0)
    else if  (List.exists (fun y -> y = ((fst now) + jump,snd now)) trees) && not (List.exists (fun z -> z = ((fst now) + jump,snd now)) visited)  then ((fst now) + jump,snd now)
    else if  (List.exists (fun y -> y = ((fst now) - jump,snd now)) trees) && not (List.exists (fun z -> z = ((fst now) - jump,snd now)) visited) then ((fst now) - jump,snd now)
    else if  (List.exists (fun y -> y = (fst now ,(snd now) + jump)) trees) && not (List.exists (fun z -> z = (fst now ,(snd now) + jump)) visited) then (fst now ,(snd now) + jump)
    else if  (List.exists (fun y -> y = (fst now ,(snd now) - jump)) trees) && not (List.exists (fun z -> z = (fst now ,(snd now) - jump)) visited) then (fst now ,(snd now) - jump)
    else avalPos now (jump -1) visited
in

let rec next_pos now visited path = 
 
 let tryPos = avalPos now x visited in

 if tryPos = (m,n) then ((m,n) :: path)
 else if tryPos <> (0,0) then let result = (next_pos tryPos (tryPos :: visited) (tryPos :: path)) in if ( List.exists (fun z -> z = (m,n)) result) then result else next_pos now result path
 else visited (*no esta probado varios caminos cuando se equivoca*)

in

let solution = (next_pos (1,1) [(1,1)] [(1,1)]) in
if List.exists (fun z -> z = (m,n)) solution then List.rev solution
else raise (Not_found);;
 
let rec generate l = 
let r = ((Random.int 200) +1 ,(Random.int 200) +1) in
if List.length l = 10000 then l
else if not (List.exists (fun x -> x = r ) l)  then generate (r::l)
else generate l;;



