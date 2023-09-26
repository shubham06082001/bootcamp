const express = require(`express`)
const bodyparser = require(`body-parser`)
const jwt = require(`jsonwebtoken`)
const bcrypt = require(`bcrypt`)

const app = express()

port = 3000
app.listen(3000, () => {
  console.log(`server started with port ${port}`)
})

app.use(bodyparser.json())

const users = [
  { id: 1, username: "john", password: "pass", role: "admin" },
  { id: 2, username: "nick", password: "pass", role: "user" },
]

const Auth = require("./routes/Auth")
app.use("/", Auth)

//register a user

// app.post(`/register`, (req, res) => {
//   const { username, password, role } = req.body
//   const userArrayLength = users.length

//   const id = userArrayLength + 1 //dummy id value
//   bcrypt.hash(password, 10, (err, hashedPassword) => {
//     if (err) {
//       return res.status(500).json(`internal server error while hashing`)
//     }

//     users.push({ id, username, password: hashedPassword, role })
//     // PUSH THE DATA TO MYSQL DB

//     res.status(201).json({ message: `user added` })
//   })
// })

// app.get(`/users`, (req, res) => {
//   res.send(users)
// })

//login

app.post(`/login`, (req, res) => {
  const { username, password } = req.body

  // FETCH THE DATA FRPOM MYSQL DB
  const user = users.find((user) => user.username === username)
  if (!user) {
    return res
      .status(401)
      .json({ message: `invalid user,authentication failed` })
  }
  bcrypt.compare(password, user.password, (err, result) => {
    if (err || !result) {
      return res.status(401).json({ message: `authentication failed` })
    }
    const token = jwt.sign({ id: user.id, role: user.role }, `mysecretkey`)
    res.json({ token })
  })
})

//jwt authentication

function roleBasedAuthentication(role) {
  return (req, res, next) => {
    const token = req.header("authorization")
    if (!token) {
      return res
        .status(401)
        .json({ message: `unauthorized, token is not present` })
    }

    try {
      const decode = jwt.verify(token, "mysecretkey")
      if (decode.role !== role) {
        return res.status(403).json({ message: "access denied!" })
      }
      req.user = decode
      next()
    } catch (err) {
      res.status(400).json({ message: "not a valid token" })
    }
  }
}
app.get("/user", roleBasedAuthentication("user"), (req, res) => {
  res.json({ message: "welcome to user login" })
})

app.get("/admin", roleBasedAuthentication("admin"), (req, res) => {
  res.json({ message: "welcome to admin login" })
})
