HeaderView = require './header.view.coffee'
PostView = require './post.view.coffee'
FooterView = require './footer.view.coffee'


AppView = (context) ->
  nxt.Element 'div',
    HeaderView()

    nxt.Element 'main',
      nxt.Collection context.content, (post) ->
        PostView post

    FooterView()


module.exports = AppView
