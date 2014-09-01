Radio = require '../../../radio'
ContactsListView = require '../views/list/contacts'

listContacts = ->
  Backbone.history.navigate 'contacts'
  
  contacts = Radio.reqres.request 'global', 'contact:entities'
  contactsListView = new ContactsListView collection: contacts

  contactsListView.on 'childview:contact:show', (childView, model) =>
    @showContact model.get('id')

  contactsListView.on 'childview:contact:delete', (childView, model) ->
    contacts.remove model

  @options.mainRegion.show contactsListView

module.exports = listContacts