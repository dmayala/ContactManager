Marionette = require 'backbone.marionette'
ShowMessageView = require '../views/show/message'
Radio = require '../../../radio'

showAbout = ->
  Backbone.history.navigate 'about'
  Radio.commands.execute 'global', 'set:active:header', 'about'
  view = new ShowMessageView()
  @options.mainRegion.show view

module.exports = showAbout
