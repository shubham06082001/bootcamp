const express = require("express")
const bodyParser = require("body-parser")
const MongoClient = require("mongodb").MongoClient
const port = 3000
const app = express()

const url = "mongodb://localhost:27017"
const dbName = "vidly"

app.use(bodyParser.json())
