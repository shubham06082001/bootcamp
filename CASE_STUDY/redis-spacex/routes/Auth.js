const express = require("express")
const userController = require("../controller/UserController")

const router = express.Router()

router.post("/register", userController.save)
// router.get("/login", userController.show)
router.get("/users", userController.index)
// router.get("/admin", userController.index)

module.exports = router
