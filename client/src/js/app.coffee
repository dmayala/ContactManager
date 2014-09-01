# require dependencies
Marionette = require 'backbone.marionette'
Radio = require './radio'

# require modules
ContactsModule = require './apps/contacts/module'

# create application namespace
App = new Marionette.Application()

# add regions
App.addRegions mainRegion: '#main-region'

# add modules
App.module 'contacts', ContactsModule

App.getCurrentRoute = -> Backbone.history.fragment

App.on 'start', ->
  Backbone.history.start() if Backbone.history
  Radio.vent.trigger('global', 'contacts:list') if @getCurrentRoute() == ''

module.exports = App
