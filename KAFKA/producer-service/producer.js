const express = require(`express`)
const kafka = require(`kafka-node`)

const app = express()

const Producer = kafka.Producer
const client = new kafka.KafkaClient({ kafkaHost: `localhost:9092` })
const producer = new Producer(client)

producer.on(`ready`, () => {
  console.log(`producer is ready to produce message`)
})
app.get(`/sendmessage`, (req, res) => {
  const producermessage = [
    {
      topic: "test-topic",
      message: "this is test message,from producer",
    },
  ]
  producer.send(producermessage, (err, data) => {
    if (err) {
      res.sendStatus(500).send(`internal server error`)
    } else {
      res.json({ message: `successfully message sent` })
    }
  })
})

const port = 3000
app.listen(port, () => {
  console.log(`PRODUCER server started on the port ${port}`)
})
