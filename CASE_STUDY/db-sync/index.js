const express = require(`express`)
const bodyparser = require(`body-parser`)
const redisConnection = require("./redis-connection")
const responseTime = require("response-time")
const connectDB = require("./mongodb-connection")
const Auth = require("./route/Auth")

const app = express()

app.use(responseTime())
app.use(bodyparser.json())

redisConnection()
connectDB()

app.use("/", Auth)

PORT = 3000

app.listen(PORT, () => {
  console.log(`Server started with port ${PORT}`)
})
