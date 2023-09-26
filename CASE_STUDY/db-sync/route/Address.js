const express = require(`express`)
const router = express.Router()
const uuid = require("uuid")

const UserModel = require("../schema/User")

// bulk update of addresses

router.put("/users/:userId/addresses", async (req, res) => {
  const { userId } = req.params
  const { addresses } = req.body

  try {
    const user = await UserModel.findById(userId)

    if (!user) {
      return res.status(404).json({ message: "User not found" })
    }
    addresses.forEach((newAddress) => {
      newAddress.addressId = uuid.v4()
      user.addresses.push(addresses)
    })

    await user.save()

    res.status(200).json({ message: "Addresses updated successfully" })
  } catch (err) {
    res
      .status(500)
      .json({ message: "Internal server error", error: err.message })
  }
})

// update particular address

router.put("/users/:userId/addresses/:addressId", async (req, res) => {
  const { userId, addressId } = req.params
  const updatedAddress = req.body

  try {
    const user = await UserModel.findById(userId)

    if (!user) {
      return res.status(404).json({ message: "User not found" })
    }

    const addressIndex = user.addresses.findIndex(
      (address) => address.addressId === addressId
    )

    if (addressIndex === -1) {
      return res.status(404).json({ message: "Address not found" })
    }

    // Update the specific address
    user.addresses[addressIndex] = {
      ...user.addresses[addressIndex],
      ...updatedAddress,
    }

    await user.save()

    res.status(200).json({ message: "Address updated successfully" })
  } catch (err) {
    res
      .status(500)
      .json({ message: "Internal server error", error: err.message })
  }
})

// adding one or more addresses

router.post("/users/:userId/addresses", async (req, res) => {
  const { userId } = req.params
  const newAddresses = req.body

  try {
    const user = await UserModel.findById(userId)

    if (!user) {
      return res.status(404).json({ message: "User not found" })
    }

    newAddresses.forEach((newAddress) => {
      newAddress.addressId = uuid.v4()
      user.addresses.push(newAddress)
    })

    await user.save()

    res.status(201).json({ message: "Addresses added successfully" })
  } catch (err) {
    res
      .status(500)
      .json({ message: "Internal server error", error: err.message })
  }
})

// retreive address for a particular user--
router.get("/users/:userId/addresses", async (req, res) => {
  const { userId } = req.params

  try {
    const user = await UserModel.findById(userId)

    if (!user) {
      return res.status(404).json({ message: "User not found" })
    }

    const addresses = user.addresses

    res.status(200).json({ addresses })
  } catch (err) {
    res
      .status(500)
      .json({ message: "Internal server error", error: err.message })
  }
})

module.exports = router
