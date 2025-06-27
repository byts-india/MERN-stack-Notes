# useRef

## usage 1: to ref to html elements

### `UseRefExample.jsx`

```javascript
import { useEffect, useRef, useState } from 'react';

function UseRefExample() {
    const [user, setUser] = useState("");
    const [pass, setPass] = useState("");
    const btnRef = useRef(null);

    useEffect(() => {
        // run code on component creation
        btnRef.current.disabled = true;
    }, []);


    function handleChange(event) {
        const text = event.target.value;
        if (text.length < 10) {
            btnRef.current.disabled = true;
        } else {
            btnRef.current.disabled = false;
        }
        setPass(text);
    }

    return (
        <>
            <h1>an example</h1>
            <input type="text" placeholder='user' value={user} onChange={e => setUser(e.target.value)} />
            <br />
            <input type="text" placeholder='password' value={pass} onChange={handleChange} />
            <br />
            <button className="btn" ref={btnRef}>submit</button>
        </>
    );
}

export default UseRefExample;
```

## usage 2

- to make a variable which should not act like state.
- which mean. if i update its value, it should not trigger rendering on such component.
- on rerender the value of such things should not get affected.

### `RefTimer.jsx`

```javascript
import { useEffect, useState, useRef } from "react";

function RefTimer() {
    const [count, setCount] = useState(0);
    const intervalRef = useRef(null);
    useEffect(() => {
        // execute on component creation
        start();
        return () => {
            // execute on component deletion
            stop();
        }
    }, []);
    function start() {
        intervalRef.current = setInterval(() => {
            setCount(prev => prev + 1); // runs code synchronously
        }, 1000);
    }
    function stop() {
        clearInterval(intervalRef.current);
        setTimeout(() => {
            setCount(0);
        }, 1000);
    }
    function reset() {
        clearInterval(intervalRef.current);
        setCount(0);
    }
    return (
        <>
            <p>the count is {count}</p>
            <button onClick={start} disabled={count > 0}> start </button>
            <button onClick={stop} disabled={count === 0}> stop </button>
            <button onClick={reset} disabled={count === 0}> reset</button>
        </>
    );
}

export default RefTimer;
```
