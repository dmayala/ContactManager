Backbone = require 'backbone'
Backbone.Picky = require 'backbone.picky'

class Headers extends Backbone.Collection
  model: require '../models/header'

  initialize: ->
    singleSelect = new Backbone.Picky.SingleSelect @
    _.extend @, singleSelect

module.exports = Headers