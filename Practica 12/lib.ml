open Context

exception Function_not_defined of string;;

let round x =
  let int_x = int_of_float x in
  if x -. float_of_int int_x < 0.5 then Int.to_float int_x
  else Int.to_float ( int_x + 1);;


let get_function name =
  let ctx = [("sqrt", sqrt); ("exp", exp); ("ln", log);("round",round)] in
  try get_binding ctx name with
  | No_binding name -> raise (Function_not_defined name)
;;

