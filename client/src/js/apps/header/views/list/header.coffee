Marionette = require 'backbone.marionette'

class Header extends Marionette.ItemView
  template: require '../templates/list/header'
  tagName: 'li'

  triggers:
    'click a': 'navigate'

  onRender: ->
    @$el.addClass('active') if @model.selected

module.exports = Header
