
PostView = (method, context) ->
  nxt.Element 'div',
    nxt.Class 'post'
    nxt.Element 'input',
      nxt.Class 'title'
      if method is 'add' then nxt.Attr 'placeholder', 'Title'
      nxt.ValueBinding context.title,
        (title) -> title

    nxt.Element 'div',
      nxt.Element 'textarea',
        if method is 'add' then nxt.Attr 'placeholder', 'Your new post is here'
        nxt.ValueBinding context.post_content,
          (content) -> content

    nxt.Element 'span',
      nxt.Text 'Posted on'
    nxt.Element 'input',
      nxt.Class 'posted-on'
      nxt.ValueBinding context.date,
        (date) -> date

    nxt.Element 'button',
      nxt.Attr 'type', 'button'
      nxt.Text method
      nxt.Event 'click', ->
        if method is 'update'
          context.update()
        else
          if context.title.value is '' or  context.post_content.value is '' or context.date.value is '' then alert 'Please, fill all the field'
          else
            context.add()


    if method is 'update'
      nxt.Element 'button',
        nxt.Attr 'type', 'button'
        nxt.Text 'delete'
        nxt.Event 'click', ->
          context.delete()



module.exports = PostView
