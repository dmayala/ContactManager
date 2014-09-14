Marionette = require 'backbone.marionette'

class Router extends Marionette.AppRouter
  appRoutes:
    'about': 'showAbout'

module.exports = Router