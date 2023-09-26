const express = require("express")
const kafka = require("kafka-node")

const app = express()
const PORT = 3001

const Consumer = kafka.Consumer
const client = new kafka.KafkaClient({
  kafkaHost: `localhost:9092`,
})

const consumer = new Consumer(client, [{ topic: `test-topic`, partition: 0 }], {
  autoCommit: false,
})

consumer.on(`message`, (message) => {
  console.log(`received message : ${message.value}`)
})

consumer.on(`error`, (err) => {
  console.log(`error in consumer ${err}`)
})

app.listen(PORT, () => {
  console.log(`CONSUMER service started at port: ${PORT}`)
})
