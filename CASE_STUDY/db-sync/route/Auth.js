const AWS = require("aws-sdk")
const express = require(`express`)
const router = express.Router()

const { USER_NOT_FOUND, INTERNAL_SERVER_ERROR } = require("../constants")
const UserModel = require("../schema/User")

const s3 = new AWS.S3()
const sqs = new AWS.SQS()

const s3BucketName = "legacy-bucket-12092023"

const sqsQueueUrl =
  "https://sqs.us-east-1.amazonaws.com/581562052871/legacy-queue"

// GET ALL USERS

router.get(`/users`, async (req, res) => {
  try {
    const getAllUsers = await UserModel.find()
    const data = getAllUsers

    // Store data in S3
    const s3Params = {
      Bucket: s3BucketName,
      Key: "users.json",
      Body: JSON.stringify(data),
    }

    await s3.putObject(s3Params).promise()

    // Send data to SQS

    const sqsParams = {
      MessageBody: JSON.stringify(data),
      QueueUrl: sqsQueueUrl,
    }

    await sqs.sendMessage(sqsParams).promise()

    res.send(getAllUsers)
  } catch (error) {
    console.error("Error:", error)
    res.status(500).send("Error: " + error.message)
  }
})

// GET USER BY ID

router.get("/users/:userId", async (req, res) => {
  try {
    const userId = req.params.userId
    const user = await UserModel.findById(userId)
    if (!user) {
      return res.status(404).json({
        message: USER_NOT_FOUND,
      })
    }
    res.status(200).json(user)
  } catch (error) {
    res.status(500).json({
      error: INTERNAL_SERVER_ERROR,
    })
  }
})

module.exports = router
