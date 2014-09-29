HeaderCollection = require '../collections/headers'
Radio = require '../../../radio'

headers = undefined

initializeHeaders = ->
  headers = new HeaderCollection [
    { name: 'Contacts', url: 'contacts', navigationTrigger: 'contacts:list' }
    { name: 'About', url: 'about', navigationTrigger: 'about:show' }
  ]

API =
  getHeaders: ->
    initializeHeaders() unless headers?
    headers

HeaderAPI =
  initialize: ->
    @setHandlers()

  setHandlers: ->
    Radio.reqres.setHandler 'global', 'header:entities', -> API.getHeaders()

module.exports = HeaderAPI
