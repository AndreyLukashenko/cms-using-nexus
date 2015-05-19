
HeaderView = ->
  nxt.Element 'header',
    nxt.Element 'h1',
      nxt.Class 'site-title'
      nxt.Text 'My site'

    nxt.Element 'nav',
      nxt.Element 'ul',

        nxt.Element 'li',
          nxt.Element 'a',
            nxt.Attr 'href', '#'
            nxt.Text 'Home'

        nxt.Element 'li',
          nxt.Element 'a',
            nxt.Attr 'href', '#'
            nxt.Text 'Sample Page'

        nxt.Element 'li',
          nxt.Element 'a',
            nxt.Attr 'href', '#'
            nxt.Text 'Contacts'


module.exports = HeaderView
