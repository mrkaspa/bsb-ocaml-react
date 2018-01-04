type 'a action = NewFile of 'a

type state = {count: int; click: int; dummy: bool}

let component = ReasonReact.reducerComponent "Counter"

let make _children =
  { component with
    initialState= (fun () -> {count= 0; click= 0; dummy= false})
  ; reducer=
      (fun action state ->
        match action with
        | NewFile e ->
          let nat = ReactEventRe.Form.nativeEvent e in
          Cli.cli ();
          ReasonReact.Update
            {state with count= state.count - 1; click= state.click + 1})
  ; render=
      (fun self ->
        [%bsx "
          <div>
            <input type='file' onChange="(self.reduce (fun e -> NewFile e))">
            </input>
          </div>
        "]) }

