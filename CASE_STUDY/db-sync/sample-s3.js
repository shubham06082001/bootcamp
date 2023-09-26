// const AWS = require("aws-sdk")
// const MongoClient = require("mongodb").MongoClient

// const s3 = new AWS.S3()
// const mongoUrl = "mongodb://your-mongodb-uri"
// const s3BucketName = "your-s3-bucket-name"

// exports.handler = async (event, context) => {
//   try {
//     const client = await MongoClient.connect(mongoUrl, {
//       useNewUrlParser: true,
//     })
//     const db = client.db("your-database-name")
//     const collection = db.collection("your-collection-name")

//     const data = await collection.find().toArray()

//     const params = {
//       Bucket: s3BucketName,
//       Key: "output.json", // Specify the S3 key for your data
//       Body: JSON.stringify(data),
//     }

//     await s3.putObject(params).promise()

//     client.close()

//     return {
//       statusCode: 200,
//       body: JSON.stringify("Data uploaded to S3 successfully"),
//     }
//   } catch (error) {
//     return {
//       statusCode: 500,
//       body: JSON.stringify("Error: " + error),
//     }
//   }
// }

const AWS = require("aws-sdk")
const sqs = new AWS.SQS()

exports.handler = async (event) => {
  const s3 = event.Records[0].s3
  const bucketName = s3.bucket.name
  const objectKey = s3.object.key

  try {
    const s3Object = await getS3Object(bucketName, objectKey)
    const jsonContent = JSON.parse(s3Object.Body.toString())

    await sendToSQS(jsonContent)

    return {
      statusCode: 200,
      body: "Data sent to SQS successfully",
    }
  } catch (error) {
    console.error("Error:", error)
    return {
      statusCode: 500,
      body: "Error: " + error.message,
    }
  }
}

async function getS3Object(bucketName, objectKey) {
  const s3 = new AWS.S3()
  const params = {
    Bucket: bucketName,
    Key: objectKey,
  }
  return s3.getObject(params).promise()
}

async function sendToSQS(data) {
  const params = {
    MessageBody: JSON.stringify(data),
    QueueUrl: "YOUR_SQS_QUEUE_URL",
  }
  return sqs.sendMessage(params).promise()
}
