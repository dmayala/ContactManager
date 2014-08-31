# require dependencies
Marionette = require 'backbone.marionette'

# create application namespace
App = new Marionette.Application()

# add regions
App.addRegions mainRegion: '#main-region'

# define static item view class
class StaticView extends Marionette.ItemView
  template: '#static-template'

# show StaticView on start
App.on 'start', -> App.mainRegion.show new StaticView()

module.exports = App