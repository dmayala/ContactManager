Radio = require '../../../radio'

setActiveHeader = (headerUrl) ->
  links = Radio.reqres.request 'global', 'header:entities'
  headerToSelect = links.find (header) ->
    header.get('url') == headerUrl
  headerToSelect.select()
  links.trigger 'reset'

module.exports = setActiveHeader