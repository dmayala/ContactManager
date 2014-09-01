Backbone = require 'backbone'

class Contacts extends Backbone.Collection
  model: require '../models/contact'
  comparator: 'firstName'

module.exports = Contacts
