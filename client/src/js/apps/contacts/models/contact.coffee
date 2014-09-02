Backbone = require 'backbone'
configureStorage = require '../../config/storage/localstorage'

class Contact extends Backbone.Model
  urlRoot: 'contacts'

configureStorage Contact

module.exports = Contact
