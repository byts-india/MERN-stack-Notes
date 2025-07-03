# context api example.

## `main.jsx`

```jsx
import { createRoot } from "react-dom/client";
import "./index.css";
import App from "./App.jsx";
import { BrowserRouter } from "react-router";

createRoot(document.getElementById("root")).render(
  <BrowserRouter>
    <App />
  </BrowserRouter>
);
```

## `App.jsx`

```jsx
import { Routes, Route } from "react-router";
import Login from "./components/Login";
import Dashboard from "./components/Dashboard";
import { AuthProvider } from "./context/AuthContext";

export default function App() {
  return (
    <AuthProvider>
      <Routes>
        <Route path="/" element={<Login/>}></Route>
        <Route path="/dashboard" element={<Dashboard/>}></Route>
      </Routes>
    </AuthProvider>
  )
}
```

## `context/AuthContext.jsx`

```jsx
import { createContext, useContext, useState } from "react";

const AuthContext = createContext();

function AuthProvider({ children }) {
    const [isAuth, setIsAuth] = useState(true);

    return (
        <AuthContext.Provider value={{ isAuth, setIsAuth }}>
            {children}
        </AuthContext.Provider>
    );
}

function useAuth() {
    const context = useContext(AuthContext);
    if(!context) {
        throw new Exception("auth context not provided correctly.");
    }
    return context;
}

export default AuthContext;
export { AuthProvider, useAuth };
```

## `components/Dashboard.jsx`

```jsx
import { useEffect } from "react";
import { useAuth } from "../context/AuthContext"
import { useNavigate } from "react-router";

export default function Dashboard() {
  const { isAuth, setIsAuth } = useAuth();
  const navigate = useNavigate();

  useEffect(() => {
    if(!isAuth) {
        navigate('/');
    }
  },[isAuth]);
  
  return (
    <div>
        <button onClick={() => setIsAuth(false)}>logout</button>
        <h1>dashboard</h1>
    </div>
  )
}
```

## `Login.jsx`

```jsx
import { useState } from 'react'
import { useAuth } from '../context/AuthContext';
import { useNavigate } from 'react-router';

export default function Login() {
    const [username, setUsername] = useState("");
    const [password, setPassword] = useState("");
    const { setIsAuth } = useAuth();
    const navigate = useNavigate();

    function handleSubmit(event) {
        event.preventDefault();
        if(username =='root' && password=='root') {
            setIsAuth(true);
            navigate("/dashboard");
        }
    }
    return (
        <form onSubmit={handleSubmit}>
            <input type="text" placeholder="username" value={username} onChange={e => setUsername(e.target.value)}/><br/>
            <input type="password" placeholder="password" value={password} onChange={e => setPassword(e.target.value)}/><br/>
            <button type='submit'>submit</button>
        </form>
    )
}
```
