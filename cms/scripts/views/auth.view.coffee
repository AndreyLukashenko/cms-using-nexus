
AuthView = (context) ->
  nxt.Element 'div',
    nxt.Class 'authorization'

    nxt.Element 'div',
      nxt.Class 'bg'

    nxt.Element 'div',
      nxt.Class 'form'

      nxt.Element 'input',
        nxt.Class 'login'
        nxt.Attr 'type', 'text'
        nxt.Attr 'placeholder', 'login'
        nxt.Event 'keypress', (e) ->
          input_handler e, context

      nxt.Element 'div',
        nxt.Class 'hr'

      nxt.Element 'input',
        nxt.Class 'password'
        nxt.Attr 'type', 'password'
        nxt.Attr 'placeholder', 'password'
        nxt.Event 'keypress', (e) ->
          input_handler e, context

input_handler = (e, context) ->
  login = document.querySelector('.login').value
  password = document.querySelector('.password').value
  context.send_auth_req login, password if e.keyCode is 13
  return


module.exports = AuthView
