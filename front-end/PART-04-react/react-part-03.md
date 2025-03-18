# little advance concepts

## 1️⃣ useEffect

useEffect is a React Hook that lets you synchronize a component with an external system.

1. do something when there is a change in dependencies
2. Execute a code during creation of a component. mostly to load data from back-end using APIs.
3. Execute a code during deletion of a component

### Do something when there is a change in dependencies

```javascript
import { useEffect, useState } from "react";
function ParentComp() {
    const [effectCount, setEffectCount] = useState(0);
    const [count, setCount] = useState(0);

    useEffect(() => {
        setEffectCount(count + 1);
        // ⚠️ 👆 this code will only run
        // 👇 if this dependent variable `count` changes. 
    }, [count]);

    function handleClick() {
        setTimeout(() => {
            // ⚠️ we are updating count like as shown below, as we are dealing with async code like setTimeout.
            setCount((prev) => prev + 1); // updating count, synchronously 
        }, 1000);
    }
    return (
        <div>
            <p> effect count : {effectCount} </p>
            <p> normal count : {count} </p>
            <button onClick={handleClick}> update </button>
        </div>
    );
}

function Sample() {
    return <ParentComp />;
}

export default Sample;
```

### Execute a code during creation of a component

<pre>
  useEffect(() => {
         console.log("API call code to get top 4 movies");
  }, []);
</pre>

- The above code will ***only execute once***. Even if we re-render.

### Execute a code during deletion of a component

<pre>
    useEffect(() => {
         console.log("executed on creation of component");
          return () => {
              console.log("executed on deletion of component");
          }
     }, []);
</pre>

## 2️⃣ useState

- while using state concept in react.
- By default when we update state value it will execute as asynchronous code.
- But sometimes. we need to perform synchronously task with states.
- For that we go for below strategy.
- eg:

```javascript

    const [count, setCount] = useState(0);
    setCount(count + 1)             // async
    setCount((prev) => prev + 1)   // sync

```

- In above case we use arrow function to update value in state.
- which will be executed synchronously.

## 3️⃣ useRef

**usage of useRef :**

1. when a variable should not get affected by re-rendering.
2. used to get reference of DOM elements

<https://react.dev/reference/react/useRef#manipulating-the-dom-with-a-ref> follow this link to see example

```javascript
import { useEffect, useRef, useState } from "react";

function ParentComp() {
    const [stop, setStop] = useState(false);
    const [count, setCount] = useState(10);
    // I have used useRef because for below reasons.
    // 1️⃣ my `interval` variable should be affected by re-rendering
    // 2️⃣ If I change any value in `interval`. I should reload the component. 
    const intervalRef = useRef();

    useEffect(() => {
        if (count <= 0) {
            clearInterval(intervalRef.current);
            setStop(false);
            setCount(10);
        } else if (stop) {
            clearInterval(intervalRef.current);
            setStop(false);
            setCount(10);
        }
        // 👆 Above code will run each and every time,
        // when below mentioned dependent values are changed.
        // 👇   👇  
    }, [count, stop]);

    function handleStart() {
        intervalRef.current = setInterval(() => {
            // we are updating count as we are dealing with async code like setInterval.
            setCount((prev) => prev - 1); // 👈 runs synchronously.
        }, 1000);
    }

    function handleStop() {
        setStop(true);
    }

    return (
        <div className="container">
            <h1> count down : {count} </h1>
            <p>
                Count starts from 10 it will<br /> decrease until it reaches 0.<br />
                Then again it will be set to zero
            </p>
            {/* this is to disable the button. 👇 once count started decreasing. */}
            <button onClick={handleStart} disabled={count < 10}> start </button>
            <button onClick={handleStop}>stop</button>
            <p> you can stop the count by pressing 'stop' button. </p>
        </div>
    );
}

function Sample() {
    return <ParentComp />;
}

export default Sample;
```
