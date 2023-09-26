const AWS = require("aws-sdk")
const mongoose = require("mongoose")
const Message = require("./message-model")
const express = require("express")
const serverless = require("serverless-http")

const app = express()
const port = 3000

app.use(express.json())

AWS.config.update({
  accessKeyId: "AKIA2KOPSPMVZOJH5MUU",
  secretAccessKey: "1UIXxbjbHLwRt6K+OSoKf30cdkXA7niY/FC4I1DJ",
  region: "us-east-1",
})

const SQS_QUEUE_URL = "your_sqs_queue_url"
const MONGODB_URI =
  "mongodb+srv://shubhamkmr06082001:jl6RXqidtv3Eg1ET@database.mk1kzpb.mongodb.net/cache-legacy"

exports.handler = async (event, context) => {
  const sqs = new AWS.SQS({ region: "us-east-1" })
  mongoose.connect(MONGODB_URI, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
  })

  try {
    const db = mongoose.connection
    db.on("error", console.error.bind(console, "MongoDB connection error:"))
    db.once("open", async () => {
      console.log("Connected to MongoDB")

      const receiveParams = {
        QueueUrl: SQS_QUEUE_URL,
        MaxNumberOfMessages: 10,
        VisibilityTimeout: 30,
        WaitTimeSeconds: 0,
      }

      await Message.deleteMany({})

      sqs.receiveMessage(receiveParams, async (err, sqsData) => {
        if (err) {
          console.error("Error receiving messages from SQS:", err)
          return
        }

        if (sqsData.Messages) {
          for (const message of sqsData.Messages) {
            const body = JSON.parse(message.Body)
            const newMessage = new Message({
              messageId: message.MessageId,
              messageBody: JSON.stringify(body),
            })

            try {
              await newMessage.save()
            } catch (saveErr) {
              console.error("Error saving message to MongoDB:", saveErr)
            }

            sqs.deleteMessage(
              {
                QueueUrl: SQS_QUEUE_URL,
                ReceiptHandle: message.ReceiptHandle,
              },
              (deleteErr) => {
                if (deleteErr) {
                  console.error("Error deleting message from SQS:", deleteErr)
                }
              }
            )
          }
        }
      })
    })
  } catch (error) {
    console.error("Error:", error)
  }
}
