# HOOKS

- function name started with use is called hooks

### BELOW TOPICS ARE COVERED

1. `call backs` ***JS*** : a arrow function is passed to setInterval which act as ***callback***
2. `setInterval` ***JS*** : which is used to call function which is being passed as callback, every interval of `1000` second.
3. `useRef` ***REACT*** : is a hook used, so that it won't get affect by re-rendering.
4. `useState()` ***REACT***
5. `event` ***JS*** | ***REACT***

```javascript
// A SAMPLE CODE FOR: CONDITIONAL RENDERING using ?:
import { useState, useRef } from "react";

function CounterComp() {
    const [count, setCount] = useState(0);
    let intervalRef = useRef(null);

    function handleStartBtn() {
        clearInterval(intervalRef.current);
        intervalRef.current = setInterval(() => {
            // setCount(count + 1); // async 
            // if you use above code it won't work as it is executed asynchronously 
            setCount((prev) => prev + 1) // sync 
            // we used sync code because to prevent issues
        }, 1000);
    }

    function handleStopBtn() {
        clearInterval(intervalRef.current);
    }

    function handleResetBtn() {
        clearInterval(intervalRef.current);
        setCount(0);
    }

    return (
        <>
            <p>count : {count}</p>
            <button onClick={handleStartBtn}>start</button>
            <button onClick={handleStopBtn}>stop</button>
            <button onClick={handleResetBtn}>reset</button>
        </>
    );
}

export default CounterComp;
```



![image](https://github.com/user-attachments/assets/35811e58-9d76-4e28-87b2-1175a3464a7f)
