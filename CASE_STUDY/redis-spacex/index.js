const express = require("express")
const axios = require("axios")
const redis = require("redis")
const responseTime = require("response-time")
const { promisify } = require("util")
const colors = require("colors")

const app = express()
app.use(responseTime())

const client = redis.createClient({
  host: "127.0.0.1",
  port: 6379,
})

client.on("error", (err) => {
  console.log("Error " + err)
})

const GET_ASYNC = promisify(client.get).bind(client)
const SET_ASYNC = promisify(client.set).bind(client)

// app.get("/rockets", async (req, res) => {
//   try {
//     const reply = await GET_ASYNC("rockets")
//     if (reply) {
//       console.log("CACHED DATA".bgRed.underline.bold)
//       return res.send(JSON.parse(reply))
//     }

//     const response = await axios.get(
//       "https://api.spacexdata.com/v3/rockets",
//       "EX",
//       5
//     )

//     const saveResult = await SET_ASYNC("rockets", JSON.stringify(response.data))

//     console.log("NEW DATA CACHED!!".bgGreen.underline.bold, saveResult)

//     return res.send(response.data)
//   } catch (error) {
//     return res.send(error.message)
//   }
// })

const handleRedisOperation = async (operation, ...args) => {
  try {
    if (client.status === "end") {
      console.log("Recreating Redis client...")
      client = redis.createClient({
        host: "127.0.0.1",
        port: 6379,
      })
    }
    return await operation(...args)
  } catch (error) {
    console.error("Error during Redis operation:", error)
    throw error
  }
}

app.get("/rockets", async (req, res) => {
  try {
    const reply = await handleRedisOperation(GET_ASYNC, "rockets")
    if (reply) {
      console.log("CACHED DATA".bgRed.underline.bold)
      return res.send(JSON.parse(reply))
    }

    const response = await axios.get("https://api.spacexdata.com/v3/rockets")

    const saveResult = await handleRedisOperation(
      SET_ASYNC,
      "rockets",
      JSON.stringify(response.data)
    )

    console.log("NEW DATA CACHED!!".bgGreen.underline.bold, saveResult)

    return res.send(response.data)
  } catch (error) {
    return res.send(error.message)
  }
})

const port = 3000

app.listen(port, () => {
  console.log(`Rocket Server running on port ${port}`)
})

process.on("SIGTERM", () => {
  console.log("Closing the server and Redis client gracefully...")

  server.close(() => {
    client.quit(() => {
      console.log("Server and Redis client closed.")
      process.exit(0)
    })
  })
})
