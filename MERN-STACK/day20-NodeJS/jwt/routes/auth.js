const express = require("express")
const bodyParser = require("body-parser")
const jwt = require("jsonwebtoken")
const router = express.Router()

const app = express()

const users = [
  { id: 1, name: "ram", password: "ram123" },
  { id: 2, name: "ramu", password: "ramu123" },
]

router.post("/login", (req, res) => {
  const { username, password } = req.body

  const user = users.find(
    (user) => user.name === username
  )

  if (!user) {
    return res.status(400).send("User not found!")
  }

  if (user.password !== password) {
    return res.status(400).send("Invalid Credentials")
  }

  console.log("User logged in successfully!")
  let token = jwt.sign({ sub: user.id }, "my-secret-key")

  return res.json({
    username,
    message: "User logged in successfully!",
    token,
  })
})

module.exports = router
