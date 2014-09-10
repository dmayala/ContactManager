Marionette = require 'backbone.marionette'

class Contacts extends Marionette.CompositeView
  tagName: 'table'
  className: 'table table-hover'
  template: require '../templates/list/contacts'
  childView: require './contact'
  childViewContainer: 'tbody'

  initialize: ->
    @listenTo @collection, 'reset', =>
      @attachHtml = (collectionView, childView, index) ->
        collectionView.$el.append childView.el

  onRenderCollection: ->
    @attachHtml = (collectionView, childView, index) ->
      collectionView.$el.prepend childView.el

module.exports = Contacts

