const mongoose = require("mongoose")

const messageSchema = new mongoose.Schema({
  messageId: {
    type: String,
    required: true,
  },
  messageBody: {
    type: String,
    required: true,
  },
})

const Message = mongoose.model("Message", messageSchema)

module.exports = Message
