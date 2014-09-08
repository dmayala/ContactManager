Marionette = require 'backbone.marionette'

class Contact extends Marionette.ItemView
  tagName: 'tr'
  template: require '../templates/list/contact'

  events:
    'click': 'highlightName'
    'click td a.js-show': 'showClicked'
    'click td a.js-edit': 'editClicked'
    'click button.js-delete': 'deleteClicked'

  highlightName: ->
    @$el.toggleClass 'warning'

  showClicked: (e) ->
    e.preventDefault()
    e.stopPropagation()
    @trigger 'contact:show', @model

  editClicked: (e) ->
    e.preventDefault()
    e.stopPropagation()
    @trigger 'contact:edit', @model

  deleteClicked: (e) ->
    e.stopPropagation()
    @trigger 'contact:delete', @model

  remove: ->
    @$el.fadeOut => Marionette.ItemView::remove.call(@)

module.exports = Contact

