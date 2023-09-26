import { BrowserRouter as Router, Route, Routes } from "react-router-dom"
import "./App.css"
import ShowProduct from "./pages/ShowProduct"
import CreateProduct from "./pages/CreateProduct"
import UpdateProduct from "./pages/UpdateProduct"

function App() {
  return (
    <div className="App">
      <Router>
        <Routes>
          <Route exact path="/" element={<h1>Home Page</h1>} />
          <Route  exact path="/showproduct" element={<ShowProduct />} />
          <Route default exact path="/addproduct" element={<CreateProduct />} />
          <Route exact path="/updateproduct/:id" element={<UpdateProduct />} />
        </Routes>
      </Router>
    </div>
  )
}

export default App
