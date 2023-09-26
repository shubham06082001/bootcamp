const fs = require("fs")

// let value = localStorage.setItem("count", 1);
let value = 1

fs.readFile("./abc.txt", "utf-8", (err, data) => {
  if (err) {
    return console.log("Something went wrong...")
  } else {
    value += 1;
    return console.log(data + " " + value++)
  }
})

fs.appendFile("./abc.txt", `Hello World\n Thanks ${value}\n`, (err) => {
  if (err) {
    return console.log("Something went wrong...")
  } else {
    return console.log("File saved successfully...")
  }
})
