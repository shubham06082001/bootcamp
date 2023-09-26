const express = require("express")

const app = express()

let employees = [
  { id: 1, name: "John", age: 24 },
  { id: 2, name: "Jane", age: 22 },
  { id: 3, name: "Bob", age: 25 },
]

app.get("/", (req, res) => {
  res.send("Hello World")
})

app.get("/employee", (req, res) => {
  res.send(employees)
})

app.get("/employee/:id", (req, res) => {
  const id = req.params.id
  const employee = employees.find((employee) => employee.id === Number(id))
  if (employee === undefined) {
    return res.status(404).send("Employee not found")
  }
  res.send(employee)
})

app.delete("/employee", (req, res) => {
  res.send("Hello world ... this is delete method")
})
app.delete("/employee/:id", (req, res) => {
  const id = req.params.id
  employees = employees.filter((employee) => employee.id !== Number(id))
  res.send(employees)
})

const port = 3000
app.listen(port, () => {
  console.log(`Server is running on port ${port}`)
})
