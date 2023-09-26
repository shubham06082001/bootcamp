
BuggyCounter.js
 
import React from 'react';
//without error boundry
class BuggyCounter extends React.Component {
 state = {
 counter: 0,
  };

 handleClick = () => {
 this.setState({
 counter: this.state.counter + 1,
    });
  };

 render() {
 if (this.state.counter === 5) {
 // Simulate an error!
 throw new Error('Simulated error.');
    }
 return (
 <div>
 <h1>{this.state.counter}</h1>
 <button onClick={this.handleClick}>+</button>
 </div>
    );
  }
}

export default BuggyCounter;





 ErrorBoundry.js
import React from 'react';

class ErrorBoundry extends React.Component {
 state = {
 errorMessage: '',
  };

 static getDerivedStateFromError(error) {
 return { errorMessage: error.toString() };
  }

 componentDidCatch(error, info) {
 this.logErrorToServices(error.toString(), info.componentStack);
  }

 // A fake logging service.
 logErrorToServices = console.log;

 render() {
 if (this.state.errorMessage) {
 return <p>{this.state.errorMessage}</p>;
    }
 return this.props.children;
  }
}

export default ErrorBoundry;

BuggyCounter.js
 
import React from 'react';
//without error boundry
class BuggyCounter extends React.Component {
 state = {
 counter: 0,
  };

 handleClick = () => {
 this.setState({
 counter: this.state.counter + 1,
    });
  };

 render() {
 if (this.state.counter === 5) {
 // Simulate an error!
 throw new Error('Simulated error.');
    }
 return (
 <div>
 <h1>{this.state.counter}</h1>
 <button onClick={this.handleClick}>+</button>
 </div>
    );
  }
}

export default BuggyCounter;





 ErrorBoundry.js
import React from 'react';

class ErrorBoundry extends React.Component {
 state = {
 errorMessage: '',
  };

 static getDerivedStateFromError(error) {
 return { errorMessage: error.toString() };
  }

 componentDidCatch(error, info) {
 this.logErrorToServices(error.toString(), info.componentStack);
  }

 // A fake logging service.
 logErrorToServices = console.log;

 render() {
 if (this.state.errorMessage) {
 return <p>{this.state.errorMessage}</p>;
    }
 return this.props.children;
  }
}

export default ErrorBoundry;
