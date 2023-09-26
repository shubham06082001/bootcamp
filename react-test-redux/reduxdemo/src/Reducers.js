// src/reducers.js

import { combineReducers } from 'redux';

// Define your reducers here
function counterReducer(state = 0, action) {
  switch (action.type) {
    case 'INCREMENT':
      return state + 1;
    case 'DECREMENT':
      return state - 1;
    default:
      return state;
  }
}

// Combine all your reducers into one root reducer
const rootReducer = combineReducers({
  counter: counterReducer,
  // Add more reducers here
});

export default rootReducer;
