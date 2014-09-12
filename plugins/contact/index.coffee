Contacts = require '../../models/contacts'

exports.register = (plugin, options, next) ->

  plugin.route
    method: 'GET'
    path: '/contacts'
    handler: (request, reply) ->
      Contacts.find  {}, (err, contacts) ->
        throw err if err
        reply contacts

  next()

exports.register.attributes =
  pkg: require './package.json'
