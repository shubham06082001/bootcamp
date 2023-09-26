import axios from "axios"
import React, { useEffect, useState } from "react"
import { Link } from "react-router-dom"

const ShowProduct = () => {
  const [product, setproduct] = useState([])

  const getProductData = () => {
    axios.get("http://localhost:3000/productData").then((res) => {
      console.log(res)
      setproduct(res.data)
      console.log("DATA FETCHED...")
      console.log(product)
    })
  }

  let handleDelete = (id) => {
    axios.delete(`http://localhost:3000/${id}`).then(() => {
      getProductData()
    })
  }

  useEffect(() => {
    getProductData()
  }, [])

  return (
    <div>
      <h1>ShowProduct</h1>
      <table>
        <thead>
          <tr>
            <th>Product Name</th>
            <th>Product Description</th>
            <th>Product Image</th>
          </tr>
        </thead>
        <tbody>
          {product.map((item) => (
            <tr key={item.id}>
              <td>{item.productName}</td>
              <td>{item.productDec}</td>
              <td>
                <img
                  src={item.productImg}
                  alt="img"
                  width={"200px"}
                  height={"200px"}
                ></img>
              </td>
              <td>
                {/* REDIRECT TO UPDATE PAGE */}
                <button
                  onClick={() => (
                    <Link to={`/updateproduct/${item.id}`}>
                      Add New product
                    </Link>
                  )}
                >
                  Update Product
                </button>
              </td>
              <td>
                <button onClick={() => handleDelete(item.id)}>
                  Delete Product
                </button>
              </td>
            </tr>
          ))}
        </tbody>
      </table>
      <Link to={"/addProduct"}>Add New product</Link>
    </div>
  )
}

export default ShowProduct
