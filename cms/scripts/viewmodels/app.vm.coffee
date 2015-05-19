PostViewModel = require('../viewmodels/post.vm.coffee')

class AppViewModel
  constructor: (content, @ws, @token) ->
    content_models = content.map (item) -> new PostViewModel item
    @content = new nx.Collection items:content_models

  send: (response) =>
    response.auth_token = @token
    @ws.send JSON.stringify response
    return

  append: (id, title, post_content, date ) =>
    @content.insertBefore @content.items[0], new PostViewModel
      id: id
      title: title
      post_content: post_content
      date: date


  delete: (post) =>
    @content.remove post

module.exports = AppViewModel
