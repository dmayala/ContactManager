ContactShowView = require '../views/show/contact'
MissingContactShowView = require '../views/show/missing_contact'
Radio = require '../../../radio'

showContact = (id) ->
  Backbone.history.navigate "contacts/#{id}"
  contacts = Radio.reqres.request 'global', 'contact:entities'
  model = contacts.get id
  contactView = 
    if model?
      new ContactShowView model: model
    else
      new MissingContactShowView()
  @options.mainRegion.show contactView

module.exports = showContact