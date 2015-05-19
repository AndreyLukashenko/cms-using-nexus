class Post
  constructor: ({@id, title, post_content, date}) ->
    @title = new nx.Cell value:title
    @post_content = new nx.Cell value:post_content
    @date = new nx.Cell value:date

module.exports = Post
