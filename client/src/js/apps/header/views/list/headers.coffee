Marionette = require 'backbone.marionette'

class Headers extends Marionette.CompositeView
  template: require '../templates/list/headers'
  tagName: 'nav'
  className: 'navbar navbar-inverse navbar-fixed-top'
  childView: require './header'
  childViewContainer: 'ul'

  triggers:
    'click a.navbar-brand': 'brand:clicked'

module.exports = Headers