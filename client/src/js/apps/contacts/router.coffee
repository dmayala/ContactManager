Marionette = require 'backbone.marionette'

class Router extends Marionette.AppRouter
  appRoutes:
    'contacts': 'listContacts'
    'contacts/:id': 'showContact'
    'contacts/:id/edit': 'editContact'

module.exports = Router