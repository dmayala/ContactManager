Backbone = require 'backbone'
Backbone.Picky = require 'backbone.picky'

class Header extends Backbone.Model
  initialize: ->
    selectable = new Backbone.Picky.Selectable @
    _.extend @, selectable

module.exports = Header
