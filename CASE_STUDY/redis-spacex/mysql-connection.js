const mysql = require("mysql2")

// MySQL Connection
const connection = mysql.createPool({
  host: "localhost",
  port: "3306",
  user: "root",
  password: "Mysql123",
  database: "legacy_database",
  connectionLimit: 10,
})

module.exports = connection;
