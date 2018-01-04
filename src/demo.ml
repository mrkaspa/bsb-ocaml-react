let () =
  ReactDOMRe.renderToElementWithId
    [%bsx "
      <Page name='Hello'>
      </Page>
    "]
    "index"
