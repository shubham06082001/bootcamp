const express = require(`express`)
const bodyparser = require(`body-parser`)
const mongoose = require("mongoose")
const serverless = require("serverless-http")
const UserModel = require("./UserSchema")


const app = express()

app.use(bodyparser.json())

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

connectDB()



// AUTH ROUTES

// GET ALL USERS

app.get(`/users`, async (req, res) => {
  const getAllUsers = await UserModel.find()
  res.send(getAllUsers)
})

// DUMMY ROUTE TO TRACK RESPONSE TIME
app.get("/hello", (req, res) => {
  res.json({
    message: "Hello, World!",
  })
})

module.exports.handler = serverless(app)
