Marionette = require 'backbone.marionette'
Controller = require './controller'

class Module extends Marionette.Module
  onStart: ->
    @startMediator()

  startMediator: ->
    @controller = new Controller
      headerRegion: @app.headerRegion 
      mainRegion: @app.mainRegion
      dialogRegion: @app.dialogRegion
      
module.exports = Module
