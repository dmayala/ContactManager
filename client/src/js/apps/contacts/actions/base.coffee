Backbone = require 'backbone'
Marionette = require 'backbone.marionette'
Radio = require '../../../radio'
ContactEntity = require '../entities/contact'

class BaseController extends Marionette.Controller

  initialize: ->
    ContactEntity.initialize()
    @setHandlers()

  setHandlers: ->
    Radio.vent.on 'global', 'contacts:filter', (criterion) ->
      Backbone.history.navigate if criterion then "contacts/filter/criterion:#{criterion}" else 'contacts'

    Radio.vent.on 'global', 'contacts:list', =>
      @listContacts()

module.exports = BaseController
