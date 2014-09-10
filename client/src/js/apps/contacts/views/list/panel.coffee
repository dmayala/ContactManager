Marionette = require 'backbone.marionette'

class Panel extends Marionette.ItemView
  template: require '../templates/list/panel'

  triggers:
    'click button.js-new': 'contact:new'

module.exports = Panel