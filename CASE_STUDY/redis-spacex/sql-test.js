const { createPool } = require("mysql2")

const pool = createPool({
  host: "localhost",
  port: "3306",
  user: "root",
  password: "Mysql123",
  database: "legacy_database",
  connectionLimit: 10,
})

pool.query("SELECT id, name FROM users", (err, result, fields) => {
  if (err) {
    return console.error(err.message)
  }

  return console.log(result)
})
