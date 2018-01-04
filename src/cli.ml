open Node

external to_string : 'a -> string = "toString" [@@bs.send]
external spawnSyncArgs : string -> string array -> Child_process.spawnResult =
  "spawnSync" [@@bs.module "child_process"]

let build_args path =
  [|"-mode"
   ; "cli"
   ; "-out"
   ; "/Users/mrkaspa/solutions"
   ; "-file"
   ; path
   ; "-api"
   ; "AIzaSyCOAHsS7vUAB9vyHgIu3DgcKa9wNjiwrYY"
   ; "-maxvol"
   ; "100"
   ; "-maxweight"
   ; "5500"
   ; "-maxtime"
   ; "400"
  |]

let run path =
  let res =
    path
    |> build_args
    |> spawnSyncArgs "./cligo"
    |> Child_process.readAs
  in
  Js.log res;
  match Js.Null.to_opt res##stdout with
  | Some buffer ->
    (to_string buffer)
  | None ->
    "Nothing"
