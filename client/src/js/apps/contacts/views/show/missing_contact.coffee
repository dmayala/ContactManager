Marionette = require 'backbone.marionette'

class MissingContact extends Marionette.ItemView
  template: require '../templates/show/missing_contact'

module.exports = MissingContact