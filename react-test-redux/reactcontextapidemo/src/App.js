import React, { createContext, useContext } from 'react';

// Step 1: Create a context
const MyContext = createContext();

// Step 2: Provide the data
function App() {
  const data = "Hello, React Context!";

  return (
    <MyContext.Provider value={data}>
      <ChildComponent />
    </MyContext.Provider>
  );
}

// Step 3: Consume the data
function ChildComponent() {
  const value = useContext(MyContext);

  return <div>{value}</div>;
}

export default App;
