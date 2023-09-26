const mongoose = require("mongoose")
const express = require("express")
const bodyParser = require("body-parser")

const app = express()
app.use(bodyParser.json())

url =
  "mongodb+srv://shubhamkmr06082001:jl6RXqidtv3Eg1ET@database.mk1kzpb.mongodb.net/Happy"
local = "mongodb://localhost:27017/Happy"

const connectDB = async () => {
  const conn = await mongoose.connect(local)
  console.log(`MongoDb connected: ${conn.connection.host}`)
}

connectDB()

const contactSchema = {
  email: String,
  query: String,
}

const Contact = mongoose.model("Contact", contactSchema)

app.post("/contact", async (req, res) => {
  const { email, query } = req.body

  const contact = new Contact({
    email: email,
    query: query,
  })

  await contact.save()
})

app.listen(3000, function () {
  console.log("App is running on Port 3000")
})
