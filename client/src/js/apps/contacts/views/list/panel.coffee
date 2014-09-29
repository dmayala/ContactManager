Marionette = require 'backbone.marionette'

class Panel extends Marionette.ItemView
  template: require '../templates/list/panel'

  triggers:
    'click button.js-new': 'contact:new'

  events:
    'submit #filter-form': 'filterContacts'

  ui:
    criterion: 'input.js-filter-criterion'

  filterContacts: (e) ->
    e.preventDefault()
    criterion = @$('.js-filter-criterion').val()
    @trigger 'contacts:filter', criterion

  onSetFilterCriterion: (criterion) ->
    @ui.criterion.val criterion

module.exports = Panel