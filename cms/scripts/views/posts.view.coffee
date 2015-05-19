PostView = require './post.view.coffee'


PostsView = (context) ->
  nxt.Element 'div',
    nxt.Class 'content'
    nxt.Collection context.content, (post) ->
      PostView 'update', post


module.exports = PostsView
