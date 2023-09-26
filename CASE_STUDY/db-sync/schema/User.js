const mongoose = require("mongoose")

// Define the Address Schema
const AddressSchema = new mongoose.Schema({
  customerId: {
    type: String,
    // required: true,
  },
  addressId: {
    type: String,
  },
  addressLine1: {
    type: String,
    required: true,
  },
  addressLine2: {
    type: String,
  },
  city: {
    type: String,
  },
  state: {
    type: String,
  },
  zipCode: {
    type: String,
  },
  country: {
    type: String,
  },
  phoneNumber: {
    type: String,
  },
  emailAddress: {
    type: String,
  },
  isPrimaryAddress: {
    type: Boolean,
    default: false,
  },
  createdDate: {
    type: Date,
    default: Date.now,
  },
  modifiedDate: {
    type: Date,
    default: Date.now,
  },
})

// Define the User Schema
const UserSchema = new mongoose.Schema({
  id: {
    type: Number,
    autoIncrement: true,
    required: true,
  },
  name: {
    type: String,
    required: true,
  },
  email: {
    type: String,
    required: true,
  },
  password: {
    type: String,
    required: true,
  },
  role: {
    type: String,
  },
  addresses: {
    type: [AddressSchema],
    validate: {
      validator: function (addresses) {
        return addresses.length >= 1
      },
      message: "At least one address is required.",
    },
  },
})

// Set the first address as the primary address
UserSchema.pre("save", function (next) {
  if (this.addresses.length > 0) {
    this.addresses[0].isPrimaryAddress = true
  }
  next()
})

module.exports = mongoose.model("User", UserSchema)
