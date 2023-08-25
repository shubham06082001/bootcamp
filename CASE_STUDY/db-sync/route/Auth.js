const jwt = require(`jsonwebtoken`)
const bcrypt = require(`bcrypt`)
const express = require(`express`)
const router = express.Router()

const UserModel = require("../schema/User")

//register a user

router.post(`/register`, async (req, res) => {
  const { name, email, password, role } = req.body
  const userArrayLength = 100
  const id = userArrayLength + 1

  try {
    const hashedPassword = await bcrypt.hash(password, 10)

    // Create a new user instance
    const newUser = new UserModel({
      id,
      name,
      email,
      password: hashedPassword,
      role,
    })

    // Save the user to the database
    await newUser.save()

    res.status(201).json({ message: `user added` })
  } catch (err) {
    res.status(500).json(`internal server error: ${err.message}`)
  }
})

router.get(`/users`, async (req, res) => {
  const getAllUsers = await UserModel.find()
  res.send(getAllUsers)
})

//login

router.post(`/login`, async (req, res) => {
  const { email, password } = req.body

  try {
    // Fetch the user data from MongoDB
    const user = await UserModel.findOne({ email: email })

    if (!user) {
      return res
        .status(401)
        .json({ message: `invalid user, authentication failed` })
    }

    const isPasswordValid = await bcrypt.compare(password, user.password)

    if (!isPasswordValid) {
      return res.status(401).json({ message: `authentication failed` })
    }

    const token = jwt.sign({ id: user.id, role: user.role }, `mysecretkey`)
    res.json({ token })
  } catch (err) {
    res.status(500).json({ message: `internal server error: ${err.message}` })
  }
})

//jwt authentication

function roleBasedAuthentication(role) {
  return (req, res, next) => {
    const authHeader = req.headers["authorization"]

    const token = authHeader && authHeader.split(" ")[1]

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
router.get("/user", roleBasedAuthentication("user"), (req, res) => {
  res.json({ message: "welcome to user login" })
})

router.get("/admin", roleBasedAuthentication("admin"), async (req, res) => {
  const getAllUsers = await UserModel.find()
  res.json(getAllUsers)
  res.json({ message: "welcome to admin login" })
})

module.exports = router
