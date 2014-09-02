Backbone.LocalStorage = require 'backbone.localStorage'
_ = require 'underscore'

findStorageKey = (entity) ->
  return _.result(entity, 'urlRoot') if entity.urlRoot
  return _.result(entity, 'url') if entity.url
  return _.result(entity.collection, 'url') if entity.collection && entity.collection.url
  throw new Error 'unable to determine storage key'

StorageMixin = (entityPrototype) ->
  storageKey = findStorageKey entityPrototype
  localStorage: new Backbone.LocalStorage storageKey

configureStorage = (entity) ->
  _.extend entity.prototype, new StorageMixin entity.prototype

module.exports = configureStorage
