module.exports = {
  "jquery": "$",
  "underscore": "_",
  "backbone": { 
    "exports": "Backbone",
    "depends": { 
      "jquery":"$",
      "underscore":"_"
    }
  },
  "backbone.localStorage": {
    "exports": "Backbone.LocalStorage",
    "depends": {
      "backbone":"Backbone"
    }
  },
  "backbone.syphon": {
    "exports": "Backbone.Syphon",
    "depends": {
      "jquery":"jQuery",
      "backbone":"Backbone"
    }
  },
  "backbone.wreqr": {
    "exports": "Backbone.Wreqr",
    "depends": {
      "backbone":"Backbone"
    }
  },
  "backbone.marionette": {
    "exports": "Marionette",
    "depends": {
      "backbone":"Backbone",
      "backbone.wreqr":"Backbone.Wreqr"
    }
  }
}