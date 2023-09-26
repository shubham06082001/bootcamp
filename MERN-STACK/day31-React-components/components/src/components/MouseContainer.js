import React, { useState } from "react"
import AfterEffect from "./AfterEffect"

function MouseContainer() {
  const [display, setDisplay] = useState(true)
  return (
    <div>
      <h1>MouseContainer</h1>
      <button onClick={() => setDisplay(!display)}>Toggle display</button>
      {display && <AfterEffect />}
    </div>
  )
}

export default MouseContainer
