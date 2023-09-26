import React, { useState, useEffect } from "react"

function AfterEffect() {
  const [x, setX] = useState(0)
  const [y, setY] = useState(0)
  const logMousePosition = (e) => {
    console.log("Mouse Movement")
    setX(e.clientX)
    setY(e.clientY)
  }

  useEffect(() => {
    console.log("Use Effect called")
    window.addEventListener("mousemove", logMousePosition)
  })

  return (
    <div>
      <h1>AfterEffect</h1>
      Hooks X-{x} Y-{y}
    </div>
  )
}

export default AfterEffect
