import axios from "axios"
import React, { useState } from "react"
import { Link, redirect, useNavigate } from "react-router-dom"

const UpdateProduct = () => {
  const redirect = useNavigate()
  let data = {
    productName: "",
    productDec: "",
    productImg: "",
  }
  const [InputData, setinputData] = useState(data)

  const validator = () => {
    return Boolean(
      !InputData.productDec || !InputData.productImg || !InputData.productName
    )
  }

  const handleData = (e) => {
    setinputData({ ...InputData, [e.target.name]: e.target.value })
    console.log(InputData)
  }
  const handleUpdate = (event) => {
    event.preventDefault()
    if (validator()) {
      alert("All fields are mandatory")
    } else {
      axios
        .post("http://localhost:3000/productData", InputData)
        .then(() => {
          console.log("Product added!!")
        })
        .catch((err) => {
          console.log(err)
        })
      redirect("/showproduct")
    }
  }
  return (
    <div>
      <h1>Update Product</h1>
      <form onSubmit={handleUpdate}>
        <label htmlFor="productName">Product Name</label>
        <input
          type="text"
          name="productName"
          id="productName"
          value={InputData.productName}
          onChange={handleData}
        />

        <label htmlFor="productDec">Product Description</label>
        <textarea
          name="productDec"
          id="productDec"
          rows={10}
          col={40}
          value={InputData.productDec}
          onChange={handleData}
        />
        <label htmlFor="productImg">Product Image</label>
        <input
          type="text"
          name="productImg"
          id="productImg"
          value={InputData.productImg}
          onChange={handleData}
        />
        <input type="submit" value={"Add Product"} />
      </form>
      <Link to={"/showProduct"}>Show New product</Link>
    </div>
  )
}

export default UpdateProduct
