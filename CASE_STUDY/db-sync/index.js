const express = require(`express`)
const bodyparser = require(`body-parser`)
const Address = require("./route/Address")
const serverless = require("serverless-http")

const connectDB = require("./mongodb-connection")

const Auth = require("./route/Auth")
const app = express()

app.use(bodyparser.json())

connectDB()

app.use("/", Auth)
app.use("/", Address)

// DUMMY ROUTE TO TRACK RESPONSE TIME
app.get("/hello", (req, res) => {
  let responseTimeHeader = res.get("X-Response-Time")
  console.log(responseTimeHeader)
  res.json({
    message: "Hello, World!",
    responseTime: responseTimeHeader,
  })
})

module.exports.handler = serverless(app)

// app.listen(8000, () => {
//   console.log('server started')
// })
