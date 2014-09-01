Marionette = require 'backbone.marionette'

class Contacts extends Marionette.CompositeView
  tagName: 'table'
  className: 'table table-hover'
  template: '#contact-list'
  childView: require './contact'
  childViewContainer: 'tbody'

module.exports = Contacts

