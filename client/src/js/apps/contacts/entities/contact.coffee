Marionette = require 'backbone.marionette'
Contacts = require '../collections/contacts'
Radio = require '../../../radio'

contacts = null

initializeContacts = ->
  contacts = new Contacts [
    { id: 1, firstName: 'Alice', lastName: 'Arten', phoneNumber: '555-0184' }
    { id: 2, firstName: 'Bob', lastName: 'Brigham', phoneNumber: '555-0163' }
    { id: 3, firstName: 'Charlie', lastName: 'Campbell', phoneNumber: '555-0129' }
  ]

getContactEntities = ->
  initializeContacts() unless contacts?
  return contacts

ContactAPI =
  initialize: ->
    @setHandlers()

  setHandlers: ->
    Radio.reqres.setHandler 'global', 'contact:entities', -> getContactEntities()

module.exports = ContactAPI

