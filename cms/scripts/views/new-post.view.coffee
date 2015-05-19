PostViewModel = require '../viewmodels/post.vm.coffee'
PostView = require '../views/post.view.coffee'

NewPostVew = () ->
  nxt.Element 'div',
    nxt.Class 'new-post'
    PostView 'add', new PostViewModel
      id: create_id()
      title: ''
      post_content: ''
      date: ''

create_id = ->
  randLetter = String.fromCharCode 65 + Math.floor(Math.random() * 26)
  randLetter + Date.now()


module.exports = NewPostVew
