Radio = require '../../../radio'
ContactsListView = require '../views/list/contacts'
LoadingView = require '../../../common/views/loading'

listContacts = ->
  Backbone.history.navigate 'contacts'

  @options.mainRegion.show new LoadingView()
  
  fetchingContacts = Radio.reqres.request 'global', 'contact:entities'
  $.when(fetchingContacts).done (contacts) =>
    contactsListView = new ContactsListView collection: contacts

    contactsListView.on 'childview:contact:show', (childView, model) =>
      @showContact model.get('id')

    contactsListView.on 'childview:contact:delete', (childView, model) ->
      model.destroy()

    @options.mainRegion.show contactsListView

module.exports = listContacts