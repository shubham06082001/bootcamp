const MongoClient = require("mongodb").MongoClient
const redis = require("redis")
const async = require("async") // For managing asynchronous operations

const mongoUrl = "mongodb://localhost:27017/mydb"
const redisClient = redis.createClient()

MongoClient.connect(mongoUrl, (mongoErr, mongoClient) => {
  if (mongoErr) throw mongoErr
  const mongoDb = mongoClient.db()

  // Initialize a queue for processing synchronization tasks
  const syncQueue = async.queue((task, callback) => {
    processSyncTask(task, callback)
  }, 1) // Limit to 1 task at a time to ensure proper synchronization

  const userCollection = mongoDb.collection("users")
  const changeStream = userCollection.watch()

  changeStream.on("change", (change) => {
    if (change.operationType === "insert") {
      const user = change.fullDocument
      enqueueSyncTask(user)
    }
  })

  // Handle errors
  changeStream.on("error", (err) => {
    console.error("Change Stream Error:", err)
  })

  // Redis client error handling
  redisClient.on("error", (redisErr) => {
    console.error("Redis Error:", redisErr)
  })

  // Helper function to enqueue a sync task
  function enqueueSyncTask(user) {
    syncQueue.push(user, (err) => {
      if (err) console.error("Sync Task Error:", err)
    })
  }

  // Function to process a sync task
  function processSyncTask(user, callback) {
    const userId = user._id

    // Simulate some processing time
    setTimeout(() => {
      // Fetch user data from MongoDB
      userCollection.findOne({ _id: userId }, (err, fetchedUser) => {
        if (err) return callback(err)

        // Update user data in Redis
        redisClient.hmset(`user:${userId}`, fetchedUser, (redisErr) => {
          if (redisErr) return callback(redisErr)

          console.log(`User ${userId} synchronized successfully.`)
          callback()
        })
      })
    }, 1000) // Simulated delay of 1 second
  }
})
