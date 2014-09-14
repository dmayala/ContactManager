Marionette = require 'backbone.marionette'
Router = require './router'
Controller = require './controller'

class Module extends Marionette.Module
  onStart: ->
    @startMediator()

  startMediator: ->
    @controller = new Controller
      headerRegion: @app.headerRegion
      mainRegion: @app.mainRegion
      dialogRegion: @app.dialogRegion

    router = new Router { controller: @controller }

module.exports = Module
