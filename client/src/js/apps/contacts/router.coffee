Marionette = require 'backbone.marionette'

class Router extends Marionette.AppRouter
  appRoutes:
    'contacts(/filter/criterion::criterion)': 'listContacts'
    'contacts/:id': 'showContact'
    'contacts/:id/edit': 'editContact'

module.exports = Router