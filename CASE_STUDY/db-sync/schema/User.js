const mongoose = require("mongoose")

const UserSchema = new mongoose.Schema({
  id: {
    type: Number,
    autoIncrement: true,
  },
  name: {
    type: String,
  },
  email: {
    type: String,
  },
  password: {
    type: String,
  },
  role: {
    type: String,
  },
})

module.exports = mongoose.model("User", UserSchema)
