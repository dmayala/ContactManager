Marionette = require 'backbone.marionette'
LoadingView = require '../../../common/views/loading'
MissingContactShowView = require '../views/show/missing_contact'
ContactEditView = require '../views/edit/contact'

Radio = require '../../../radio'


editContact = (id) ->
  Backbone.history.navigate "contacts/#{id}/edit"

  @options.mainRegion.show new LoadingView {
    title: 'Artificial Loading Delay'
    message: 'Data loading is delayed to demonstrate using a loading view.'
  }

  fetchingContact = Radio.reqres.request 'global', 'contact:entity', id

  $.when(fetchingContact).done (contact) =>
    view =
      if contact?
        new ContactEditView model: contact
      else
        new MissingContactShowView()

    view.on 'form:submit', (data) =>
      contact.save data
      @showContact contact.get 'id'

    @options.mainRegion.show view

module.exports = editContact