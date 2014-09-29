Marionette = require 'backbone.marionette'
Radio = require '../../../radio'
HeaderEntity = require '../entities/header'

class BaseController extends Marionette.Controller

  initialize: ->
    HeaderEntity.initialize()
    @listHeader()
    @setHandlers()

  setHandlers: ->
    Radio.commands.setHandler 'global', 'set:active:header', (name) =>
      @setActiveHeader name

module.exports = BaseController