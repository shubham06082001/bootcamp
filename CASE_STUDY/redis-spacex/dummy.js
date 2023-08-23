const { createClient } = require("redis")

const client = createClient()

client.on("error", (err) => console.log("Redis Client Error", err))

async function doJob() {
  await client.connect()

  await client.set("animal", "monkey")
  const value = await client.get("monkey")

  console.log(value)

  await client.SET("vehicle", "car") // Set a string value
  const stringValue = await client.GET("vehicle")
  console.log(stringValue)

  await client.HSET("shape", "class", "circle") // Set a field-value in a hash map
  const hashValue = await client.HGETALL("shape")
  console.log(hashValue)

  await client.disconnect()
}

doJob()
