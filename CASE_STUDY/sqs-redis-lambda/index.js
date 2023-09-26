const AWS = require("aws-sdk")
const Redis = require("ioredis")

const sqs = new AWS.SQS()
const redis = new Redis({
  host: "redis.x9esla.clustercfg.use1.cache.amazonaws.com",
  port: 6379,
})

exports.handler = async (event) => {
  try {
    const queueUrl =
      "https://sqs.us-east-1.amazonaws.com/581562052871/legacy-queue"

    await redis.set("name", "ankit")
    await redis.set("age", "22")

    // Receive messages from SQS
    const { Messages } = await sqs
      .receiveMessage({
        QueueUrl: queueUrl,
        MaxNumberOfMessages: 1, // Adjust this as needed
      })
      .promise()

    if (Messages && Messages.length > 0) {
      const message = Messages[0]
      const payload = JSON.parse(message.Body)

      // Send data to ElastiCache
      await redis.set("your-key", JSON.stringify(payload))

    } else {
      console.log("No messages in the SQS queue.")
    }

    return {
      statusCode: 200,
      body: "Message processed and sent to Redis.",
    }
  } catch (error) {
    console.error("Error:", error)

    return {
      statusCode: 500,
      body: "Error processing message.",
    }
  }
}
