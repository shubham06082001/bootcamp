
import {useState,useEffect} from 'react'

const UseCounter = (forwards=true) => {
 const [counter, setCounter] = useState(0);
 
 useEffect(() => {
 const interval = setInterval(() => {
 if(forwards)
 setCounter((prevCounter) => prevCounter + 1);
 else{
 setCounter((prevCounter) => prevCounter -1);
            }
      }, 1000);
 
 return () => clearInterval(interval);
    }, [forwards]);
 
 return counter;
  };
 
 export default UseCounter;
 
 FordwardCounter.js
 
import { useState, useEffect } from 'react';
import Card from './Card';
import UseCounter from './UseCounter';

const FordwardCounter = () => {
 const counter=UseCounter()
 return <Card>{counter}</Card>
 
};

export default FordwardCounter;

BackwardCounter.js
 
import { useState, useEffect } from 'react';
import Card from './Card';
import UseCounter from './UseCounter';

const BackwardCounter = () => {
 const counter=UseCounter(false)
 return <Card>{counter}</Card>
 
 };
 
export default BackwardCounter;