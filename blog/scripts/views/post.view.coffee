
PostView = (context) ->
  nxt.Element 'article',
    nxt.Class 'post'

    nxt.Element 'h1',
      nxt.Binding context.title, nxt.Text

    nxt.Element 'p',
      nxt.Class 'post-content'
      nxt.Binding context.post_content, nxt.Text

    nxt.Element 'span',
      nxt.Binding context.date, (date)->
        nxt.Text "Posted on #{date}"


module.exports = PostView
