http = require 'http'
st = require 'node-static'
file = new st.Server '.'
WebSocketServer = new require 'ws'
fs = require 'fs'


wss = new WebSocketServer.Server port:8081
token = Math.random().toString(36).substr 2
site_socket = undefined
content = JSON.parse fs.readFileSync('./data/content.json', 'utf8')

wss.on 'connection', (ws) ->

  ws.on 'message', (message) ->
    determine_message (JSON.parse message), ws
    return



determine_message = (message, ws) ->
  switch message.type
    when 'auth_site'
      site_socket = ws
      send_token ws
    when 'get_content'
      send_content ws if message.auth_token is token
    when 'auth_cms'
      if message.login == 'admin' and message.pass == '123'
        send_token ws
      else
        ws.send JSON.stringify
          type: 'auth'
          status: 'error'
    when 'update'
       update_post message if message.auth_token is token
    when 'add'
      add_post message if message.auth_token is token
    when 'delete'
      delete_post message if message.auth_token is token
  return


send_content = (ws) ->
  ws.send JSON.stringify
    type: 'content'
    body: JSON.stringify content
  return

send_token = (ws) ->
  ws.send JSON.stringify
    type: 'auth'
    auth_token: token
  return

update_post = (message) ->
  site_socket.send JSON.stringify message if site_socket and site_socket.readyState is 1
  post = JSON.parse message.body
  content.forEach (item) ->
    if item.id is post.id
      item.title = post.title
      item.post_content = post.post_content
      item.date = post.date
  save_to_file()
  return

add_post = (message) ->
  site_socket.send JSON.stringify message if site_socket and site_socket.readyState is 1
  content.unshift JSON.parse message.body
  save_to_file()
  return

delete_post = (message) ->
  site_socket.send JSON.stringify message if site_socket and site_socket.readyState is 1
  content = (post for post in content when post.id != message.id)
  save_to_file()
  return

save_to_file = ->
  fs.writeFile './data/content.json', JSON.stringify(content), (err) ->
    console.log err if err

accept = (req, res) ->
  file.serve req, res
  return

http.createServer(accept).listen 8080
console.log 'Server running on port 8080'
