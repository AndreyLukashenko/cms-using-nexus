Post = require '../models/post.m.coffee'

class PostViewModel extends Post
  constructor: ->
    super

  update: =>
    @send 'update'
    return

  add: =>
    @send 'add'
    model.append @id, @title._value, @post_content._value, @date._value
    @clear_form()
    return

  send: (type) =>
    model.send
      type: type
      body: JSON.stringify
        id: @id
        title: @title._value
        post_content: @post_content._value
        date: @date._value
    return

  delete: =>
    model.delete this
    model.send
      type: 'delete'
      id: @id
    return

  clear_form: =>
    @title.value = ''
    @post_content.value = ''
    @date.value = ''
    @id = create_id()

  create_id = ->
    randLetter = String.fromCharCode 65 + Math.floor(Math.random() * 26)
    randLetter + Date.now()



module.exports = PostViewModel
