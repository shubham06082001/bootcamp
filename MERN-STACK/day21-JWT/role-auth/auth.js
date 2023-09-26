const express = require(`express`)
const bodyparser = require(`body-parser`)
const jwt = require(`jsonwebtoken`)
const bcrypt = require(`bcrypt`)

const app = express()

app.use(bodyparser.json())

const users = [
  { id: 1, username: "john", password: "pass", role: "admin" },
  { id: 2, username: "manish", password: "pass", role: "user" },
]

// jwt authentication

function roleBasedAuthentication(role) {
  return (req, res, next) => {
    const token = req.headers("Authorization")

    if (!token) {
      return res
        .status(401)
        .json({ message: `Unauthorize, token is not present` })
    }

    try {
      const decode = jwt.verify(token, "mysecretkey")
      if (decode.role !== role) {
        return res.status(403).json({ message: `access denied` })
      }

      req.user = decode
      next()
    } catch (err) {
      res.status(400).json({ message: `Not a valid token` })
    }
  }
}

// Register a new user

app.post(`/register`, (req, res) => {
  const { username, password, role } = req.body
  const userarraylength = users.length

  const id = userarraylength + 1 //dummy id value

  bcrypt.hash(password, 10, (err, hashedPassword) => {
    if (err) {
      return res.status(500).json(`Internal server error while hashing`)
    }
    users.push({ id, username, password: hashedPassword, role })
    res.status(201).json({ message: `User added` })
  })
})

// Login a user

app.post(`/login`, (req, res) => {
  const { username, password } = req.body
  const user = users.find((u) => u.username === username)

  if (!user) {
    return res
      .status(401)
      .json({ message: `Invalid user, authentication failed` })
  }

  bcrypt.compare(password, user.password, (err, result) => {
    if (err || !result) {
      return res.status(401).json({ message: `Authentication failed` })
    }

    const token = jwt.sign({ id: user.id, role: user.role }, `mysecretkey`)
    res.json({ token })
  })
})

app.get(`/user`, roleBasedAuthentication(`user`), (req, res) => {
  res.json({ msg: "This is user access" })
})

app.get(`/admin`, roleBasedAuthentication(`admin`), (req, res) => {
  res.json({ msg: "This is admin access" })
})

const port = 3000

app.listen(port, () => {
  console.log(`Server started with the port ${port}`)
})
