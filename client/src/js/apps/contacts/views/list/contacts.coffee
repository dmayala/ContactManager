Marionette = require 'backbone.marionette'

class Contacts extends Marionette.CompositeView
  tagName: 'table'
  className: 'table table-hover'
  template: require '../templates/list/contacts'
  childView: require './contact'
  childViewContainer: 'tbody'

module.exports = Contacts

