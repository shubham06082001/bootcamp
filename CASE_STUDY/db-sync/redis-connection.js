const redis = require("redis")

// Redis Connection

const redisClient = redis.createClient({
  host: "127.0.0.1",
  port: 6379,
})

redisClient.on("error", (err) => {
  console.log("Error " + err)
})

async function redisConnection() {
  await redisClient.connect()
  console.log("REDIS CLIENT CONNECTING...")
  return redisClient
}

module.exports = { redisConnection, redisClient }
