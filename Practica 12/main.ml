
open Parsing;;
open Lexing;;

open Context;;
open Lib;;
open Arith;;
open Command;;
open Parser;;
open Lexer;;

let rec loop ctx =
  try
    print_string ">> ";
    let line = read_line () in
    let cmd = Parser.s Lexer.token (Lexing.from_string line) in
    let new_ctx = Command.run ctx cmd in
    loop new_ctx
  with

    | Function_not_defined s -> print_endline ("Function not defined: " ^ s); loop ctx
    | Parse_error -> print_endline ("Syntax error"); loop ctx
    | Lexical_error -> print_endline ("Lexical Error"); loop ctx

;;

let _ = print_endline "Floating point calculator..." in
let _ = loop empty_context in
print_endline "... bye!!!";;



