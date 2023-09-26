import React, { useState } from "react"
import "./Counter.css"

function Counter() {
  const [count, setCount] = useState(0)

  const increment = () => {
    setCount(count + 1)
  }

  const decrement = () => {
    if (count > 0) {
      setCount(count - 1)
    }
  }

  const reset = () => {
    setCount(0)
  }

  return (
    <div className="counter-container">
      <img
        src="https://img.freepik.com/premium-vector/time-counter-hour-minute-measure-stopwatch-countdown-pink-isometric-3d-icon-realistic-vector_92753-13984.jpg?w=2000"
        className="counter-img"
        alt="counter-images"
      />
      <h1>COUNTER APP</h1>
      <div className="counter">
        <button
          onClick={decrement}
          className={`btn ${count === 0 ? "disabled" : ""}`}
        >
          -
        </button>
        <span className="count">{count}</span>
        <button className="btn" onClick={increment}>
          +
        </button>
      </div>
      <button className="reset-btn" onClick={reset}>
        Reset
      </button>
    </div>
  )
}

export default Counter
