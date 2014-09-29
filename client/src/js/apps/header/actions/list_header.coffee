Radio = require '../../../radio'
HeadersListView = require '../views/list/headers'

listHeader = ->
  links = Radio.reqres.request 'global', 'header:entities'
  view = new HeadersListView collection: links

  view.on 'brand:clicked', ->
    Radio.vent.trigger 'global', 'contacts:list'

  view.on 'childview:navigate', (childView, args) ->
    trigger = args.model.get 'navigationTrigger'
    Radio.vent.trigger 'global', trigger

  @options.headerRegion.show view

module.exports = listHeader
