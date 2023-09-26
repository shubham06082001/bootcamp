import React, { useState } from "react"
const Listitem = ({ text }) => {
  return <li>{text}</li>
}
const List = ({ numberofitems }) => {
  const listitems = []
  for (let i = 0; i < numberofitems; i++) listitems.push(<Listitem text={i} />)
  return <ul>{listitems}</ul>
}
function ReactDev1() {
  const [name, setName] = useState("")
  return (
    <div>
      <h1>ReactDev1</h1>
      <input value={name} onChange={(e) => setName(e.target.value)} />
      <button onClick={() => alert("hey" + name)}>click me </button>
      <List numberofitems={10} />
    </div>
  )
}

export default ReactDev1
