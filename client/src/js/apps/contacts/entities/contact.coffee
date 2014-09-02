Marionette = require 'backbone.marionette'
Contact = require '../models/contact'
Contacts = require '../collections/contacts'
Radio = require '../../../radio'

initializeContacts = ->
  contacts = new Contacts [
    { id: 1, firstName: 'Alice', lastName: 'Arten', phoneNumber: '555-0184' }
    { id: 2, firstName: 'Bob', lastName: 'Brigham', phoneNumber: '555-0163' }
    { id: 3, firstName: 'Charlie', lastName: 'Campbell', phoneNumber: '555-0129' }
  ]

  contacts.forEach (contact) -> contact.save()

  return contacts.models

getContactEntities = ->
  contacts = new Contacts()
  defer = $.Deferred()
  contacts.fetch success: (data) -> defer.resolve data
  promise = defer.promise()
  $.when(promise).done (contacts) ->
    if contacts.length == 0
      models = initializeContacts()
      contacts.reset models
  return promise

getContactEntity = (id) ->
  contact = new Contact id: id
  defer = $.Deferred()
  setTimeout -> 
    contact.fetch
      success: (data) -> defer.resolve data
      error: (data) -> defer.resolve undefined
  , 2000
  return defer.promise()

ContactAPI =
  initialize: ->
    @setHandlers()

  setHandlers: ->
    Radio.reqres.setHandler 'global', 'contact:entities', -> getContactEntities()
    Radio.reqres.setHandler 'global', 'contact:entity', (id) -> getContactEntity(id)

module.exports = ContactAPI

