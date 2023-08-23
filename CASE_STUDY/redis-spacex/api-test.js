const { createClient } = require("redis")
const express = require("express")
const fetch = require("node-fetch")
globalThis.fetch = fetch

const app = express()

const client = createClient()

client.on("error", (err) => console.log("Redis Client Error", err))

async function connection() {
  await client.connect()
  console.log("REDIS CLIENT CONNECTING...")
}

connection()

async function getData() {
  const url = "https://jsonplaceholder.typicode.com/posts/1"
  const response = await fetch(url)
  const jsonResponse = response.json()
  return jsonResponse
}

app.get("/", async (req, res) => {
  const reply = await client.get("posts")
  if (reply) {
    const cachedData = JSON.parse(reply)
    console.log("CACHED DATA:", cachedData)
    return res.send(cachedData)
  }

  const data = await getData()
  console.log(data)

  const saveResult = await client.set("posts", JSON.stringify(data), {
    EX: 100,
  })
  console.log("NEW DATA CACHED!!" + saveResult)

  return res.send(data)
})

const port = 3000

app.listen(port, () => {
  console.log(`Rocket Server running on port ${port}`)
})

async function disconnect() {
  console.log("REDIS CLIENT DISCONNECTING...")
  await client.disconnect()
}

// disconnect()
