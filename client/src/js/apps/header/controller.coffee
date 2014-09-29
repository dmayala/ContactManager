BaseController = require './actions/base'

class Controller extends BaseController
  listHeader: require './actions/list_header'
  setActiveHeader: require './actions/set_active_header'

module.exports = Controller