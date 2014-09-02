Marionette = require 'backbone.marionette'

class Contact extends Marionette.ItemView
  template: '#contact-view'

  events:
    'click a.js-edit': 'editClicked'

  editClicked: (e) ->
    e.preventDefault()
    @trigger 'contact:edit', @model

module.exports = Contact