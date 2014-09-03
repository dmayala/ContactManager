Marionette = require 'backbone.marionette'
Backbone.Syphon = require 'backbone.syphon'

class Contact extends Marionette.ItemView
  template: '../templates/edit/contact'

  events:
    'click button.js-submit': 'submitClicked'

  submitClicked: (e) ->
    e.preventDefault()
    data = Backbone.Syphon.serialize @
    @trigger 'form:submit', data

module.exports = Contact