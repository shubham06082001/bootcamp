const express = require("express")
const bodyParser = require("body-parser")
const colors = require("colors")
const auth = require("./routes/auth")
const emp = require("./routes/employee")
const app = express()

app.use(bodyParser.json())

app.use("/api/auth", auth)
app.use("/api/emp", emp)

app.get("/", (req, res) => {
  res.json({ message: "Welcome to the application." })
})

const PORT = 3000

app.listen(PORT, () => {
  console.log(`App running on port ${PORT}.`.bgCyan.yellow.underline.bold)
})
