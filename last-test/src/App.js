import React, { useState, useEffect } from "react"
import { data } from "./data"
import "./App.css"

function App() {
  const [callLogs, setCallLogs] = useState([])
  const [filteredLogs, setFilteredLogs] = useState([])
  const [filterOptions, setFilterOptions] = useState({
    callType: "all",
    callersName: "",
    receiversName: "",
  })
  const initialCallLogs = data

  useEffect(() => {
    const interval = setInterval(() => {
      setCallLogs([...initialCallLogs])
    }, 1000)
    return () => clearInterval(interval)
  }, [])

  useEffect(() => {
    const filtered = callLogs.filter((log) => {
      const { callType, callersName, receiversName } = filterOptions
      return (
        (callType === "all" || log.callType === callType) &&
        (callersName === "" ||
          log.callersName.toLowerCase().includes(callersName.toLowerCase())) &&
        (receiversName === "" ||
          log.receiversName.toLowerCase().includes(receiversName.toLowerCase()))
      )
    })

    setFilteredLogs(filtered)
  }, [callLogs, filterOptions])

  const handleFilterChange = (e) => {
    const { name, value } = e.target
    setFilterOptions({ ...filterOptions, [name]: value })
  }

  return (
    <div className="App container pt-4 pb-2">
      <h1 className="mb-4">Call Log Filter App</h1>
      <div className="row mb-4">
        <div className="col-4">
          <label>Call Type:</label>
          <select
            className="form-select"
            name="callType"
            onChange={handleFilterChange}
            value={filterOptions.callType}
          >
            <option value="all">All</option>
            <option value="incoming">Incoming</option>
            <option value="outgoing">Outgoing</option>
          </select>
        </div>
        <div className="col-4">
          <label>Caller Name:</label>
          <input
            type="text"
            className="form-control"
            name="callersName"
            onChange={handleFilterChange}
            value={filterOptions.callersName}
          />
        </div>
        <div className="col-4">
          <label>Receiver Name:</label>
          <input
            type="text"
            className="form-control"
            name="receiversName"
            onChange={handleFilterChange}
            value={filterOptions.receiversName}
          />
        </div>
      </div>
      <table className="table table-bordered table-dark table-hover table-responsive">
        <thead className="thead-dark">
          <tr class="table-primary">
            <th>ID</th>
            <th>Call Type </th>
            <th>Callers Name</th>
            <th>Receivers Name</th>
            <th>Senders Number</th>
            <th>Receivers Number</th>
            <th>Duration</th>
            <th>Timestamp</th>
          </tr>
        </thead>
        <tbody>
          {filteredLogs.map((log) => (
            <tr key={log.id}>
              <td>{log.id}</td>
              {/* <td>{log.callType}</td> */}
              {log.callType === "outgoing" && (
                <td>
                  <button className="btn btn-warning">Outgoing</button>
                </td>
              )}
              {log.callType === "incoming" && (
                <td>
                  <button className="btn btn-success">Outgoing</button>
                </td>
              )}
              <td>{log.callersName}</td>
              <td>{log.receiversName}</td>
              <td>{log.sendersNumber}</td>
              <td>{log.receiversNumber}</td>
              <td>
                <button className="btn btn-info">{log.duration}</button>
              </td>
              <td>{log.timestamp}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  )
}

export default App
