Marionette = require 'backbone.marionette'

class Panel extends Marionette.ItemView
  template: require '../templates/list/panel'

  triggers:
    'click button.js-new': 'contact:new'

  events:
    'submit #filter-form': 'filterContacts'

  filterContacts: (e) ->
    e.preventDefault()
    criterion = @$('.js-filter-criterion').val()
    @trigger 'contacts:filter', criterion

module.exports = Panel