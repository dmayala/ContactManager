Radio = require '../../../radio'
Contact = require '../models/contact'
ContactsListView = require '../views/list/contacts'
LoadingView = require '../../../common/views/loading'
ContactEditView = require '../views/edit/contact'
ContactNewView = require '../views/new/contact'
LayoutListView = require '../views/list/layout'
PanelListView = require '../views/list/panel'

listContacts = ->
  Backbone.history.navigate 'contacts'

  @options.mainRegion.show new LoadingView()

  layoutListView = new LayoutListView();
  panelListView = new PanelListView();

  fetchingContacts = Radio.reqres.request 'global', 'contact:entities'
  $.when(fetchingContacts).done (contacts) =>
    contactsListView = new ContactsListView collection: contacts

    contactsListView.on 'childview:contact:show', (childView, args) =>
      @showContact args.model.get('id')

    contactsListView.on 'childview:contact:edit', (childView, args) =>
      model = args.model
      view = new ContactEditView model: model

      view.on 'form:submit', (data) =>
        if model.save(data)
          childView.render()
          @options.dialogRegion.empty()
          childView.flash 'success'
        else
          view.triggerMethod 'form:data:invalid', model.validationError

      @options.dialogRegion.show view

    contactsListView.on 'childview:contact:delete', (childView, args) ->
      args.model.destroy()

    panelListView.on 'contact:new', =>
      newContact = new Contact()

      view = new ContactNewView model: newContact

      view.on 'form:submit', (data) =>
        if contacts.length > 0
          highestId = contacts.max((c) -> c.id).get 'id'
          data.id = highestId + 1
        else
          data.id = 1

        if newContact.save(data)
          contacts.add(newContact)
          @options.dialogRegion.empty()
          newContactView = contactsListView.children.findByModel(newContact)

          newContactView.flash 'success' if newContactView
        else
          view.triggerMethod 'form:data:invalid', newContact.validationError

      @options.dialogRegion.show view    

    layoutListView.on 'show', ->
      @panelRegion.show panelListView
      @contactsRegion.show contactsListView

    @options.mainRegion.show layoutListView

module.exports = listContacts