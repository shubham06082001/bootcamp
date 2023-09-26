import React, { useState } from "react"

const Calculator = () => {
  const [num1, setNum1] = useState(0)
  const [num2, setNum2] = useState(0)
  const [result, setresult] = useState(0)

  let add = (e) => {
    e.preventDefault()
    setresult(Number(num1) + Number(num2))
  }

  return (
    <>
      <h1>Calculator</h1>
      <form>
        <input
          type="number"
          value={num1}
          onChange={(e) => {
            setNum1(e.target.value)
          }}
          placeholder="Enter Number 1"
        ></input>
        <input
          type="number"
          value={num2}
          onChange={(e) => {
            setNum2(e.target.value)
          }}
          placeholder="Enter Number 1"
        ></input>
        <p>RESULT is: {result}</p>
        <button onClick={add}>ADD</button>
      </form>
    </>
  )
}

export default Calculator
