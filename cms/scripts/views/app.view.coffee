PostsView = require './posts.view.coffee'
NewPostView = require '../views/new-post.view.coffee'



AppView = (context) ->
  nxt.Element 'div',
    nxt.Class 'wrapper'

    nxt.Element 'h1',
      nxt.Text 'Cms of my blog'

    NewPostView()

    PostsView(context)


module.exports = AppView
