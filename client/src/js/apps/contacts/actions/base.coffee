Backbone = require 'backbone'
Marionette = require 'backbone.marionette'
Radio = require '../../../radio'
ContactEntity = require '../entities/contact'

class BaseController extends Marionette.Controller

  initialize: ->
    ContactEntity.initialize()
    @setHandlers()

  setHandlers: ->
    Radio.vent.on 'global', 'contacts:list', =>
      @listContacts()

module.exports = BaseController
