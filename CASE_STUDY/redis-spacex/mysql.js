const mysql = require("mysql2")
const redis = require("redis")
const express = require("express")
var mysqlConnection = require("./mysql-connection")

const app = express()

// Redis Connection
const redisClient = redis.createClient()

redisClient.on("connect", () => {
  console.log("Connected to Redis")
})

async function connection() {
  await redisClient.connect()
  console.log("REDIS CLIENT CONNECTING...")
}

connection()

// 3.Synchronize Data (MySQL to Redis)

function syncMySQLToRedis() {
  mysqlConnection.query("SELECT id, name FROM users", (err, result, fields) => {
    if (err) {
      return console.error(err.message)
    }
    redisClient.set("users", JSON.stringify(result), {
      EX: 60,
    })

    console.log("MySQL data synchronized to Redis")
  })
}

// Run the synchronization function periodically (e.g., every 5 minutes)

setInterval(syncMySQLToRedis, 10000)

// 4.Synchronize Data (Redis to MySQL)

async function syncRedisToMySQL() {
  const cachedData = await redisClient.get("users")
  console.log(cachedData)
  if (cachedData) {
    const data = JSON.parse(cachedData)
    const values = data.map((item) => [item.id + 1, item.name])
    const sql = "INSERT INTO users (id, name) VALUES ?"
    mysqlConnection.query(sql, [values], (err, result, fields) => {
      if (err) {
        return console.error(err.message)
      }
      console.log("Redis data synchronized to MySQL")
    })
  }
}

// Run the synchronization function periodically (e.g., every 5 minutes)

setInterval(syncRedisToMySQL, 5000)

app.get("/", async (req, res) => {
  try {
    const results = await new Promise((resolve, reject) => {
      mysqlConnection.query("SELECT * FROM users", (err, results, fields) => {
        if (err) {
          reject(err)
          return
        }
        resolve(results)
      })
    })
    console.log(results)
    res.send(JSON.stringify(results))
  } catch (error) {
    console.error(error)
    res.status(500).send("Internal Server Error")
  }
})

const PORT = 3000

app.listen(PORT, () => {
  console.log(`Server running on the port : ${PORT}`)
})
