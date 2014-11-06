mongoose = require 'mongoose'
Schema = mongoose.Schema

ContactSchema = new Schema
  firstName: String
  lastName: String
  phoneNumber: String

ContactModel = mongoose.model 'Contact', ContactSchema

module.exports = ContactModel