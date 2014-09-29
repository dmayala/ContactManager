ContactShowView = require '../views/show/contact'
MissingContactShowView = require '../views/show/missing_contact'
LoadingView = require '../../../common/views/loading'
Radio = require '../../../radio'

showContact = (id) ->
  Backbone.history.navigate "contacts/#{id}"
  Radio.commands.execute 'global', 'set:active:header', 'contacts'
  @options.mainRegion.show new LoadingView({
    title: 'Artificial Loading Delay'
    message: 'Data loading is delayed to demonstrate using a loading view.'
  })
  fetchingContact = Radio.reqres.request 'global', 'contact:entity', id
  $.when(fetchingContact).done (contact) =>
    contactView = 
      if contact?
        new ContactShowView model: contact
      else
        new MissingContactShowView()

    contactView.on 'contact:edit', (contact) =>
      @editContact contact.get 'id'

    @options.mainRegion.show contactView

module.exports = showContact