# require dependencies
Marionette = require 'backbone.marionette'
Radio = require './radio'

# require modules
ContactsModule = require './apps/contacts/module'
AboutModule = require './apps/about/module'

# create application namespace
App = new Marionette.Application()

# add regions
App.addRegions
  headerRegion: '#header-region'
  mainRegion: '#main-region'
  dialogRegion:
    selector: '#dialog-region',
    regionClass: require './common/regions/dialog'

# add modules
App.module 'contacts', ContactsModule
App.module 'about', AboutModule

App.getCurrentRoute = -> Backbone.history.fragment

App.on 'start', ->
  Backbone.history.start() if Backbone.history
  Radio.vent.trigger('global', 'contacts:list') if @getCurrentRoute() is ''
  
module.exports = App
