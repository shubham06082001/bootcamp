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

async function connectRedis() {
  client.connect("connected", () => {
    console.log("Redis client connected".bgMagenta.underline.bold)
  })
}

connectRedis()

const GET_ASYNC = promisify(client.get).bind(client)
const SET_ASYNC = promisify(client.set).bind(client)

// app.get("/rockets", async (req, res) => {
//   try {
//     const reply = await GET_ASYNC("rockets")
//     if (reply) {
//       console.log("CACHED DATA".bgRed.underline.bold)
//       return res.send(reply)
//     }

//     const response = await axios.get("https://api.spacexdata.com/v4/rockets")

//     const saveResult = await SET_ASYNC("rockets", response.data)

//     console.log("NEW DATA CACHED!!".bgGreen.underline.bold, saveResult)

//     res.send(response.data)
//   } catch (error) {
//     res.send(error.message)
//   }
// })

// app.get("/rocket/:rocket_id", async (req, res, next) => {
//   try {
//     const { rocket_id } = req.params
//     const reply = await GET_ASYNC(rocket_id)
//     if (reply) {
//       console.log("CACHED DATA".bgRed.underline.bold)
//       return res.send(reply)
//     }

//     const response = await axios.get(
//       `https://api.spacexdata.com/v4/rockets/${rocket_id}`
//     )

//     const saveResult = await SET_ASYNC(rocket_id, response.data)

//     console.log("NEW DATA CACHED!!".bgGreen.underline.bold)

//     res.send(response.data)
//   } catch (error) {
//     res.send(error.message)
//   }
// })

// JSON FAKE API GET ALL POSTS

// app.get("/posts", async (req, res, next) => {
//   try {
//     const reply = await GET_ASYNC(posts)
//     if (reply) {
//       console.log("CACHED DATA".bgRed.underline.bold)
//       return res.send(reply)
//     }

//     const response = await axios.get(
//       `https://jsonplaceholder.typicode.com/posts`
//     )

//     const saveResult = await SET_ASYNC(posts, response.data)

//     console.log("NEW DATA CACHED!!".bgGreen.underline.bold)
//     console.log(saveResult)

//     res.send(response.data)
//   } catch (error) {
//     res.send(error.message)
//   }
// })

app.get("/posts/:post_id", async (req, res) => {
  try {
    const { post_id } = req.params
    const reply = await GET_ASYNC(post_id)
    if (reply) {
      console.log("CACHED DATA")
      return res.send(reply)
    }

    const response = await axios.get(
      `https://jsonplaceholder.typicode.com/posts/${post_id}`
    )

    const saveResult = await SET_ASYNC(post_id, response.data)

    console.log("NEW DATA CACHED!!")

    res.send(response.data)
  } catch (error) {
    res.send(error.message)
  }
})

async function getData() {
  const url = "https://jsonplaceholder.typicode.com/todos/1"
  const response = await fetch(url)
  const jsonResponse = await response.json()
  console.log(jsonResponse)
}

app.get("/", (req, res) => {
  return getData()
})

const port = 3000

app.listen(port, () => {
  console.log(`Rocket Server running on port ${port}`.bgBlack.underline.bold)
})

async function disconnect() {
  await client.disconnect()
}

disconnect()
