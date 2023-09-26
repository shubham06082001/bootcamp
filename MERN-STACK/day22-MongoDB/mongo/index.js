const { MongoClient } = require("mongodb")

async function main() {
  const client = new MongoClient("mongodb://localhost:27017")

  try {
    await client.connect()
    console.log("Connected to MongoDB")

    const db = client.db("vidly")
    const collection = db.collection("Persons")

    const document = { name: "John Doe", age: 30, email: "johndoe@example.com" }
    const result = await collection.insertOne(document)

    console.log("Document inserted successfully", result)

    // Insert multiple

    await collection.insertOne({ id: 1, firstName: "Steve", lastName: "Jobs" })
    await collection.insertOne({ id: 2, firstName: "Bill", lastName: "Gates" })
    await collection.insertOne({ id: 3, firstName: "James", lastName: "Bond" })

    // QUERY DB

    const docs = await collection.find({}).toArray()
    console.log(docs)

    // QUERY DB with filter

    const docs2 = await collection.find({ id: 1 }).toArray()

    // UPDATE DB
    const updateResult = await collection.updateOne(
      { id: 1 },
      { $set: { firstName: "Steve", lastName: "Wozniak" } }
    )
    console.log(updateResult)

    // DELETE DB
    const deleteResult = await collection.deleteOne({ id: 1 })
    console.log(deleteResult)

    // DELETE ALL
    // const deleteAllResult = await collection.deleteMany({ name: "John" })
    // console.log(deleteAllResult)
  } catch (err) {
    console.error("Error:", err)
  }
  // finally {
  //   await client.close()
  //   console.log("Connection closed")
  // }
}

main()
