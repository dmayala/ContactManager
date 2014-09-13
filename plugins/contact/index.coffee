Joi = require 'joi'
Boom = require 'boom'
Contact = require '../../models/contact'

exports.register = (plugin, options, next) ->

  contactAttributes =
    _id: Joi.string()
    __v: Joi.number()
    firstName: Joi.string().required()
    lastName: Joi.string().required().min(2)
    phoneNumber: Joi.string()

  # get all contacts - seed if empty
  plugin.route
    method: 'GET'
    path: '/contacts'
    handler: (request, reply) ->
      Contact.find {}, (err, collection) ->
        throw err if err
        if collection.length is 0
          contacts = [
              { firstName: 'Alice', lastName: 'Arten', phoneNumber: '555-0184' }
              { firstName: 'Bob', lastName: 'Brigham', phoneNumber: '555-0163' }
              { firstName: 'Charlie', lastName: 'Campbell', phoneNumber: '555-0129' }
          ]
          Contact.collection.insert contacts, (err, data) ->
            throw err if err
            reply data
        else
          reply collection

  # get contact by id
  plugin.route
    method: 'GET'
    path: '/contacts/{id}'
    config:
      handler: (request, reply) ->
        Contact.findById request.params.id, (err, contact) ->
          throw err if err
          if contact
            reply contact
          else
            reply Boom.notFound()
      validate:
        params:
          id: Joi.string().alphanum().min(5).required()

  # create contact
  plugin.route
    method: 'POST'
    path: '/contacts'
    config:
      handler: (request, reply) ->
        Contact.create request.payload, (err, contact) ->
          reply contact
      validate:
        payload: contactAttributes

  # update contact
  plugin.route
    method: 'PUT'
    path: '/contacts/{id}'
    config:
      handler: (request, reply) ->
        Contact.findByIdAndUpdate request.params.id, request.payload, (err, contact) ->
          throw err if err
          reply contact
      validate:
        payload: contactAttributes

  # delete contact
  plugin.route
    method: 'DELETE'
    path: '/contacts/{id}'
    handler: (request, reply) ->
      Contact.findByIdAndRemove request.params.id, (err, contact) ->
        reply contact

  next()

exports.register.attributes = pkg: require './package.json'

