module.exports = {
  "jquery": "$",
  "jquery.spin": {
    "exports": "$.fn.spin",
    "depends": {
      "jquery":"$",
      "spin":"Spinner"
    }
  },
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