AuthView = require './views/auth.view.coffee'
AppVewModel = require './viewmodels/app.vm.coffee'
AppView = require './views/app.view.coffee'





class Network
  ws = new WebSocket 'ws://localhost:8081';
  token = undefined;

  ws.onmessage = (event) ->
    determine_response JSON.parse event.data

  determine_response = (msg) ->
    switch msg.type
      when 'auth'
        if msg.status is 'error'
          alert 'login or password is wrong!'
        else
          token = msg.auth_token
          ws.send JSON.stringify
            type: 'get_content'
            auth_token: token
      when 'content'
        render_content JSON.parse msg.body
    return

  render_content = (content) ->
    window.model = new AppVewModel content, ws, token
    document.body.innerHTML = "";
    document.body.appendChild AppView(model).data.node
    return

  @send_auth_req: (login, pass) ->
    ws.send JSON.stringify
      type:'auth_cms'
      login: login
      pass: pass
    return


window.addEventListener 'load', ->
  document.body.appendChild AuthView(Network).data.node
