




let alcanzables nodos s (x, y) =
  List.fold_left
    (fun acc (nx, ny) ->
       if (abs (nx - x) <= s && ny = y && (nx, ny) <> (x, y)) || (abs (ny - y) <= s && nx = x && (nx, ny) <> (x, y)) then
         (((nx, ny), max (abs (nx - x)) (abs (ny - y))),(x,y))::acc
       else
         acc)
    []
    nodos;;

let alcanzables_nodos nodos s posiciones  =
  List.fold_left
    (fun acc posicion ->
       let alcanzables = alcanzables nodos s posicion in
       alcanzables @ acc)
    []
    posiciones
;;


let nodo_con_menor_salto nodos =
  match nodos with
  | [] -> (((0,0),0),(0,0))
  | (x, s)::t ->
    List.fold_left
      (fun (((min_x, min_y), min_s),min_z) (((nx, ny), ns),nz) ->
         if ns < min_s then
           (((nx, ny), ns),nz)
         else
           (((min_x, min_y), min_s),min_z))
      (x, s)
      t
;;

let shortest_tour n m trees s =

let rec makePath no_vis vis path = 

    if (List.exists (fun x -> x = (n,m)) vis) then path
    else

        let prox = nodo_con_menor_salto (alcanzables_nodos no_vis s vis) in
        if  fst (snd(prox)) = 0 then raise(Not_found)
        else makePath (List.filter (fun x -> x <> fst(fst prox )) no_vis) (fst(fst prox ) :: vis) ((fst(fst prox),snd prox)::path)


in

let path = makePath trees [(1,1)] []

in let rec aux final pos = 

if pos = (1,1) then (1,1) :: final 
else let find = ((List.find (fun x -> fst (x) = pos) path)) in  aux ((fst find) :: final) (snd (find))

in

aux [] (n,m);;



