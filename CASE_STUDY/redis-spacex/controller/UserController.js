const Users = require("../models/User")

async function save(req, res) {
  const user = {
    id: req.body.id,
    name: req.body.name,
    email: req.body.email,
    password: req.body.password,
    // createdAt: new Date(),
    // updatedAt: new Date()
  }

  console.log(user)

  await Users.create(user)
    .then((result) => {
      res.status(201).json({
        message: "User created successfully",
        user: result,
      })
    })
    .catch((error) => {
      res.status(500).json({
        message: "Something went wrong",
        error: error,
      })
    })
}

function show(req, res) {
  const id = req.params.id

  Users.findByPk(id)
    .then((result) => {
      if (result) {
        res.status(200).json(result)
      } else {
        res.status(404).json({
          message: "Post not found",
        })
      }
    })
    .catch((error) => {
      res.status(500).json({
        message: "Something went wrong",
      })
    })
}

function index(req, res) {
  Users.findAll()
    .then((result) => {
      res.status(200).json(result)
    })
    .catch((error) => {
      res.status(500).json({
        message: "Something went wrong",
      })
    })
}

module.exports = {
  save: save,
  show: show,
  index: index,
}
