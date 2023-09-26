const UserModel = require("../schema/User")
const { redisClient } = require("../redis-connection")

// Function to fetch user data from MongoDB
async function fetchUserDataFromMongo() {
  const userData = await UserModel.find()
  console.log(userData)
  return userData
}

// Function to write user data to Redis
async function writeUserDataToRedis(redisClient, userData) {
  let result = await redisClient.set("users", JSON.stringify(userData), {
    // SET EXPIRY FOR REDIS CACHE
    EX: 100,
  })
  console.log("Data synced with Redis : ", result)
}

// Main synchronization function
async function synchronizeUserData() {
  const userDataFromMongo = await fetchUserDataFromMongo()
  await writeUserDataToRedis(redisClient, userDataFromMongo)
  console.log("User data synchronized from MongoDB to Redis.")
}

// // Schedule synchronization every minute
// const syncInterval = 60 * 1000
// // 1 minute in milliseconds

// setInterval(async () => {
//   await synchronizeUserData()
// }, syncInterval)

module.exports = { synchronizeUserData }
