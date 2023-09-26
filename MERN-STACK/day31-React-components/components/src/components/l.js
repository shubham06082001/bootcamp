App.js
 
import logo from './logo.svg';
import './App.css';
import React from 'react';
//import React from 'react'
import UserInput from './UserInput';
function App() {
 const[name,bindName,resetName]=UserInput("")
 return(
 <div>
 <p>{name}</p>
 <input {...bindName} type="text" name="" id=""></input>
 <p></p>
 <input type="text"></input>
 <button onClick={resetName}>reset</button>
 </div>
  )
 
}

export default App;


UserInput.js
 
import React,{useState} from 'react'

const UserInput=(initialState=undefined)=>
{
 const[value,setValue]=useState(initialState)
 const bind={ value,onChange:(e)=>setValue(e.target.value),
    }
 const resetValue=()=>setValue("")
 return [value,bind,resetValue] 
}

export default UserInput