const express = require("express")
const jwt = require ("jsonwebtoken")
const router = express.Router()

function authenticator(req, res, next) {
  const authHeader = req.headers["authorization"]

  const token = authHeader && authHeader.split(" ")[1]

  console.log(token)

  if (!token) {
    return res.status(401).json({
      message: "Access Denied, Unauthorized token!",
    })
  }

  jwt.verify(token, "my-secret-key", (err, user) => {
    if (err) {
      return res.status(403).json({
        message: "Invalid token!",
      })
    }

    req.user = user
    next()
  })
}

const employees = [
  { id: 1, name: "ram", dept: "hr", salary: 10000 },
  { id: 2, name: "ramu", dept: "people", salary: 20000 },
  { id: 3, name: "John Doe", dept: "finance", salary: 30000 },
  { id: 4, name: "Sam Doe", dept: "hr", salary: 60000 },
  { id: 5, name: "Sam Alan", dept: "hr", salary: 66000 },
]

router.get("/", authenticator, (req, res) => {
  console.log("Employee list fetched successfully!".magenta.bold.underline)
  return res.json({
    message: "Employee list fetched successfully!",
    employees,
  })
})

module.exports = router
