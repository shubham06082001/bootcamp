// src/store.js

import { createStore } from 'redux';
import rootReducer from './Reducers' // Your root reducer

const store = createStore(rootReducer);

export default store;
