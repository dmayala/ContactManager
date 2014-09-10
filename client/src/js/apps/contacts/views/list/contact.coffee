Marionette = require 'backbone.marionette'

class Contact extends Marionette.ItemView
  tagName: 'tr'
  template: require '../templates/list/contact'

  events:
    'click': 'highlightName'

  triggers:
    'click td a.js-show': 'contact:show'
    'click td a.js-edit': 'contact:edit'
    'click button.js-delete': 'contact:delete'

  highlightName: ->
    @$el.toggleClass 'warning'

  flash: (cssClass) ->
    $view = @$el
    $view.hide().removeClass().toggleClass(cssClass).fadeIn 800, ->
      setTimeout ->
        $view.toggleClass(cssClass)
      , 500

  remove: ->
    @$el.fadeOut => Marionette.ItemView::remove.call(@)

module.exports = Contact

