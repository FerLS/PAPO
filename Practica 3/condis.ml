false && (2 / 0 > 0);;
(*false porque la division da error al dividir por 0 y el && da false*)
(*Correccion , al actuar como un if else solo evalue el primer parametro*)
true && (2 / 0 > 0);;
(*Error al dividr por 0 ya que evalua el segundo parametro*)
true || (2 / 0 > 0);;
(*True ya que no evalua el segundo parametro*)
false || (2 / 0 > 0);;
(*Error al dividir por 0 ya que como el primer paramatro da false va a el siguiente*)

let con b1 b2 = b1 && b2;;
(*Define la funcion boolena que dando dos parametros devuelve su &&*)
let dis b1 b2 = b1 || b2;;
(*Define la funcion boolena que dando dos parametros devuelve su ||*)
con (1 < 0) (2 / 0 > 0);;
(*Da false ya que el primer parametro ya es false*)
(*Correccion, evalua tambien el otro parametro, asi que da error por dividir por 0*)
(1 < 0) && (2 / 0 > 0);;
(*Da false ya que el primer parametro ya es false*)
dis (1 > 0) (2 / 0 > 0);;
(*Como evalua los dos parametros da error por dividir por 0*)
(1 > 0) || (2 / 0 > 0);;
(*Da true ya que el primer parametro ya es true*)
