Post = require('../models/post.m.coffee')

class AppViewModel
  constructor: (content) ->
    content_models = content.map (item) -> new Post item
    @content = new nx.Collection items:content_models

  update: (post) =>
    @content.items.forEach (item) ->
      if item.id is post.id
        item.title.value = post.title
        item.post_content.value = post.post_content
        item.date.value = post.date
    return

  add: (post) =>
    @content.insertBefore @content.items[0], new Post
      id: post.id
      title: post.title
      post_content: post.post_content
      date: post.date

  delete: (id) =>
    post = item for item in @content.items when item.id is id
    @content.remove post

module.exports = AppViewModel
