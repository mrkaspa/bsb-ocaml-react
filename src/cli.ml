open Node

external to_string : 'a -> string = "toString" [@@bs.send]

let cli () =
  let res =
    Child_process.spawnSync "./cligo"
    |> Child_process.readAs
  in
  match Js.Null.to_opt res##stdout with
  | Some buffer ->
    Js.log (to_string buffer)
  | None ->
    Js.log "Nothing"
