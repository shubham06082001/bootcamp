const { createClient } = require("redis")
const responseTime = require("response-time")
const express = require("express")
const fetch = require("node-fetch")
globalThis.fetch = fetch

const app = express()
app.use(responseTime())

const client = createClient()

client.on("error", (err) => console.log("Redis Client Error", err))

async function connection() {
  await client.connect()
  console.log("REDIS CLIENT CONNECTING...")
}

connection()

async function getPost(id = 1) {
  const url = `https://jsonplaceholder.typicode.com/posts/${id}`
  const response = await fetch(url)
  const jsonResponse = response.json()
  return jsonResponse
}

async function getAllPosts() {
  const url = "https://jsonplaceholder.typicode.com/posts/"
  const response = await fetch(url)
  const jsonResponse = response.json()
  return jsonResponse
}

async function getCachedData(key) {
  const reply = await client.get(key)
  if (reply) {
    const cachedData = JSON.parse(reply)
    console.log("RETURNING CACHED DATA..")
    return cachedData
  }
}

async function setCachedData(key, value, exp) {
  const saveResult = await client.set(key, JSON.stringify(value), {
    EX: exp,
  })
  console.log("NEW DATA CACHED!!")
}

app.get("/", async (req, res) => {
  const cachedData = await getCachedData("post")
  if (cachedData) {
    return res.send(cachedData)
  }
  const data = await getPost(1)
  const setCache = await setCachedData("post", JSON.stringify(data), 100)
  return res.send(data)
})

app.get("/posts", async (req, res) => {
  const cachedData = await getCachedData("posts")
  if (cachedData) {
    return res.send(cachedData)
  }
  const data = await getAllPosts()
  const setCache = await setCachedData("posts", JSON.stringify(data), 100)
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
