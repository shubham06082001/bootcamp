const mongoose = require("mongoose")

const connectDB = async () => {
  const conn = await mongoose.connect(
    "mongodb+srv://shubhamkmr06082001:jl6RXqidtv3Eg1ET@database.mk1kzpb.mongodb.net/legacy-db",
    {
      useNewUrlParser: true,
      useUnifiedTopology: true,
    }
  )
  console.log(`MongoDb Database connected: ${conn.connection.host}`)
}

module.exports = connectDB
