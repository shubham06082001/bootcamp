const mongoose = require("mongoose")
const colors = require("colors")
require("dotenv").config()

const connectDB = async () => {
  const conn = await mongoose.connect(process.env.MONGO_CLOUD)
  console.log(
    `MongoDb Database connected: ${conn.connection.host}`.cyan.underline.bold
  )
}

module.exports = connectDB
