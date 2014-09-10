FormView = require '../common/form'

class Contact extends FormView
  initialize: ->
    @title = "Edit #{@model.get 'firstName'} #{@model.get 'lastName'}"

  onRender: ->
    if @options.generateTitle
      $title = $('<h1>', { text: @title })
      @$el.prepend $title

module.exports = Contact