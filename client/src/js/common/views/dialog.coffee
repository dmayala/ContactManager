Marionette = require 'backbone.marionette'

class Dialog extends Marionette.LayoutView
  template: require './templates/dialog'
  className: 'modal-dialog'

  regions:
    modal: '#modalBody'

  serializeData: ->
    title: @options.title
 
module.exports = Dialog
