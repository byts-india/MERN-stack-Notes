# REACT-REDUX                                 COPY THE NOTES

- redux ?
  - is a JS library used for global state management.
  - provides centralized store to manage app state 
    and update state with action and reducer
- react-redux ?
  - library used to integrate redux with react.
- React RTK ?  ( redux-tool-kit )
  - Modern way to implement redux in react.
  - less boilerplate codes.
  - simplify the developement
  - provided with built-in utilities.
- alternates for react-redux
  - zustand
  - jotai

NOTES:
  - state are immutable
  - But in RTK states are mutable becz of immer.js
  - immer.js is a tiny package that allows you to work with immutable state in a more convenient way.

- Store
  - is a centralized container that holds 
    the entire state of a redux application.
- Slice
  - is a section of redux state along with the reducer logic
    and generated actions that manage the state.
- Reducer
  - is a pure function that updates the state based on the
    dispatched action.
- Action
  - is a plain object that describes an event that tirgger
    a state change
- Dispatch
  - is a function used to send actions to the redux store to 
    update the state.
- Selector
  - is a function used to read specific data from the redux
    store.
- action creator
  - an action creator is a func that returns a action object.

- props drilling
  - parent to child state can be shared using props.
  - lets assume following structure
    - Parent ( state )
      - Child1
        - Child2
          - Child3
            - Child4
  - Now I want to share state available in parent component
    to lowest level of Child component ( Child4 ).
  - by sending state from Parent -> Child1 -> Child2 -> Child3 -> Child4
    sending state using props
  - Props drilling is a process of passing data from a
    parent component to a deeply nested child component through
    multiple intermediate components using props.
    even if those intermediate components do not need the data.

- context api
  - Is a concept in react, by which we can share states accross multiple
    components. 
  - process:
    - create a context
    - declare the provider
    - use the context

# EXAMPLE for AUTHCONTEXT  
  - 2 state
    - isLoggedIn  true, false
    - user        details(name, role) 
  - share these state to all components

- context  
- provider : used to declare whom you are going to share the data.

# HOW TO USE

npm i @reduxjs/toolkit react-redux

# WHAT IS THUNK ?

In Redux Toolkit (RTK), a thunk is a function that contains logic to perform asynchronous tasks, such as fetching data from an API

# STEPS TO FOLLOW 

01. CREATE SLICES (eg: authSlice.js )

import { createSlice } from "@reduxjs/toolkit";

const authSlice = createSlice({
  name: "auth",
  initialState: { isLoggedIn: false, user: null },
  reducers: {
     login: (state, action) => {
        state.isLoggedIn = true;
        state.user = action.payload;
     },
     logout: (state) => {
        state.isLoggedIn = false;
        state.user = null;
     }
  }
});

// below are actionCreators
export const { login, logout } = authSlice.actions;
export default authSlice.reducer;

02. CREATE STORE ( store.js )

import authReducer from '../features/auth/authSlice';
const { configureStore } = require("@reduxjs/toolkit");

const store = configureStore({
    reducer:{
        auth: authReducer,
    }
});

export default store;

03. PASS STORE TO PROVIDER (main.jsx) (TOP LEVEL)

import { createRoot } from 'react-dom/client';
import { Provider } from 'react-redux';
import store from './app/store';
import './index.css';
import App from './App.jsx';

createRoot(document.getElementById('root')).render(
  <Provider store={store}>
    <App />
  </Provider>,
);

03. USE DIPATCH AND STATES

import { useDispatch, useSelector } from 'react-redux'
import { login, logout } from './features/auth/authSlice'

... BELOW ARE INSIDE COMPONENT

const dispatch = useDispatch();
const { isLoggedIn, user } = useSelector((state) => state.auth);

- Usage of dipatch eg:

function handleSubmit(e) {
    e.preventDefault();
    dispatch( login({ username, password }) );
}


