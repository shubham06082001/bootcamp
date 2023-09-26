const express = require("express")
const jwt = require("jsonwebtoken")
const bcrypt = require("bcrypt")
const bodyParser = require("body-parser")
const app = express()

const users = [
  {
    username: "admin",
    password: "admin123",
    role: "admin",
  },
  {
    username: "user",
    password: "user123",
    role: "user",
  },
]

function roleBasedAuthentication(role) {
  return (req, res, next) => {
    const token = req.headers["authorization"]
    if (!token) {
      return res.status(401).json({ message: "No token provided" })
    }

    try {
      const decode = jwt.verify(token, "my-secret-key")
      if (decode.role !== role) {
        return res.status(401).json({ message: "Unauthorized" })
      }
      next()
    } catch (error) {
      res.status(404).json({ message: "Something went wrong" })
    }
  }
}

app.use(bodyParser.json())

app.get("/user", (req, res) => {
  return res.json("this is user")
})

app.get("/admin", (req, res) => {
  return res.json("this is admin")
})

app.post("/register", async (req, res) => {
  const { username, password } = req.body

  try {
    const hashedPassword = await bcrypt.hash(password, 10)
    const user = { username: username, password: hashedPassword }

    users.push(user)
    res.status(201).json({ message: "User created" })
  } catch {
    res.status(500).json({ message: "Error creating user" })
  }
})

app.post("/login", (req, res) => {
  const { username, password } = req.body
  const user = users.find((user) => {
    return user.username === username
  })

  if (!user) {
    res.status(401).json({ message: "User does not exist" })
  }

  bcrypt.compare(password, user.password).then((match) => {
    if (!match) {
      res.status(401).json({ message: "Incorrect password" })
    }

    const accessToken = jwt.sign(
      { username: user.username, id: user.id },
      process.env.ACCESS_TOKEN_SECRET
    )

    return res.json({ accessToken: accessToken })
  })
})

const PORT = 3000

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`)
})
