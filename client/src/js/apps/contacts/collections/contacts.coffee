Backbone = require 'backbone'
configureStorage = require '../../config/storage/localstorage'

class Contacts extends Backbone.Collection
  url: 'contacts'
  model: require '../models/contact'
  comparator: 'firstName'

configureStorage Contacts

module.exports = Contacts
