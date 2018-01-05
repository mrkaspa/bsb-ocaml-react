type file = <name : string; path : string> Js.t

type action = NewFile of file list

type state = {current: file option; log: string option}

let component = ReasonReact.reducerComponent "Counter"

let make _children =
  let get_files e =
    let tg =
      e
      |> ReactEventRe.Form.target
      |> ReactDOMRe.domElementToObj in
    tg##files
  in

  let prt_log log_opt =
    match log_opt with
    | Some log ->
      [%bsx "
        <div>
          "(ReasonReact.stringToElement log)"
        </div>"]
    | None -> [%bsx "<br/>"]
  in

  { component with
    initialState= (fun () -> {current=None; log=None})
  ; reducer=
      (fun (NewFile files) _state ->
         let file = List.hd files in
         let current = Some (List.hd files) in
         Js.log current;
         let log = Cli.run file##path in
         ReasonReact.Update {current=current; log=(Some log)})
  ; render=
      (fun self ->
         [%bsx "
          <div>
            <input type='file' onChange="(self.reduce (fun e -> NewFile (get_files e)))">
            </input>
            "(prt_log self.state.log)"
          </div>
        "]) }

