Marionette = require 'backbone.marionette'

class Layout extends Marionette.LayoutView
  template: require '../templates/list/layout'

  regions:
    panelRegion: '#panel-region'
    contactsRegion: '#contacts-region'

module.exports = Layout