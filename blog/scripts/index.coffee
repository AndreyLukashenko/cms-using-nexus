AppViewModel = require './viewmodels/app.vm.coffee'
AppView = require './views/app.view.coffee'


token = undefined

window.addEventListener 'load', ->

  ws = new WebSocket 'ws://localhost:8081'

  ws.onopen = ->
    ws.send JSON.stringify type: 'auth_site'
    return

  ws.onmessage = (event) ->
    determine_message (JSON.parse event.data), ws
    return

  return


determine_message = (msg, ws) ->
  switch msg.type
    when 'auth'
      token = msg.auth_token
      ws.send get_content()
    when 'content'
      render_content JSON.parse msg.body
    when 'update'
      model.update JSON.parse msg.body
    when 'add'
      model.add JSON.parse msg.body
    when 'delete'
      model.delete msg.id
  return

get_content = ->
  JSON.stringify
    type: 'get_content'
    auth_token: token

render_content = (content) ->
  window.model = new AppViewModel content
  document.body.appendChild AppView(model).data.node
