FilteredCollection = (options) ->
  original = options.collection
  filtered = new original.constructor()
  filtered.add original.models
  filtered.filterFunction = options.filterFunction
    
  applyFilter = (filterCriterion, filterStrategy, collection) ->
    collection = collection || original
    criterion = if filterStrategy == 'filter' then filterCriterion.trim() else filterCriterion
  
    items = []
    if criterion
      if filterStrategy == 'filter'
        throw 'No filter defined' unless filtered.filterFunction
        filterFunction = filtered.filterFunction criterion
        items = collection.filter filterFunction
      else
        items = collection.where criterion
    else
      items = collection.models
    
    # store current criterion
    filtered._currentCriterion = criterion
    
    return items

  filtered.filter = (filterCriterion) ->
    filtered._currentFilter = 'filter'
    items = applyFilter filterCriterion, 'filter'
  
    filtered.reset items
    return filtered
  
  filtered.where = (filterCriterion) ->
    filtered._currentfilter = 'where'
    items = applyFilter filterCriterion, 'where'
  
    filtered.reset items
    return filtered
    
  original.on 'reset', ->
    items = applyFilter filtered._currentCriterion, filtered._currentFilter
    
    filtered.reset(items)
    
  original.on 'add', (models) ->
    coll = new original.constructor()
    coll.add models
    items = applyFilter filtered._currentCriterion, filtered._currentFilter, coll
    filtered.add items
     
  return filtered

module.exports = FilteredCollection
