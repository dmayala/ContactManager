Backbone = require 'backbone'
configureStorage = require '../../config/storage/localstorage'

class Contact extends Backbone.Model
  urlRoot: 'contacts'

  validate: (attrs, options) ->
    errors = {}
    if not attrs.firstName
      errors.firstName = 'can\'t be blank'
    if not attrs.lastName
      errors.lastName = 'can\'t be blank' 
    else if attrs.lastName.length < 2
      errors.lastName = 'is too short'
    if not _.isEmpty(errors)
      errors

configureStorage Contact

module.exports = Contact
