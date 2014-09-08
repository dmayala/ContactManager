Marionette = require 'backbone.marionette'
Backbone.Syphon = require 'backbone.syphon'

class Contact extends Marionette.ItemView
  initialize: ->
    @title = "Edit #{@model.get 'firstName'} #{@model.get 'lastName'}"

  template: require '../templates/edit/contact'

  events:
    'click button.js-submit': 'submitClicked'

  submitClicked: (e) ->
    e.preventDefault()
    data = Backbone.Syphon.serialize @
    @trigger 'form:submit', data

  onFormDataInvalid: (errors) ->
    clearFormErrors = () =>
      $form = @$el.find('form')
      $form.find('.help-block.error').each -> $(@).remove()
      $form.find('.has-error').each -> $(@).removeClass 'has-error'

    markErrors = (val, key) =>
      $controlGroup = @$el.find("#contact-#{key}").parent()
      $errorEl = $('<span>', { class: 'help-block error', text: val })
      $controlGroup.append($errorEl).addClass 'has-error'

    clearFormErrors()
    _.each errors, markErrors

module.exports = Contact