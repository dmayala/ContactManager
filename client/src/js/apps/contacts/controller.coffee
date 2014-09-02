BaseController = require './actions/base'

class Controller extends BaseController
  listContacts: require './actions/list_contacts'
  showContact: require './actions/show_contact'
  editContact: require './actions/edit_contact'

module.exports = Controller 