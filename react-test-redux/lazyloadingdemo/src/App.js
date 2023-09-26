
import React,{Suspense} from "react";
const About = React.lazy(()=>import('./About'))   /* pls check this line*/
const Home = React.lazy(()=>import('./Home')) 

function App() {
  return (
    <div >
       <Suspense fallback ={<div> Pls wait for some values are loading are in progress....</div>}>

       <About></About>

       </Suspense>

   
    </div>
  );
}

export default App;
