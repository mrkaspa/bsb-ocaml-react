let component = ReasonReact.statelessComponent "Page"

let make ~name _children =
  { component with
    render=
      (fun _self ->
        [%bsx "
          <div>
            <h1>
              "(ReasonReact.stringToElement name)"
            </h1>
            <Counter/>
          </div>
        "]) }

