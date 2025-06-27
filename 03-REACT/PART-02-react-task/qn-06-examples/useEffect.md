# useEffect

## `EffectExample.jsx`

```javascript
import { useEffect, useState } from "react";

export default function EffectExample() {
    const [count, setCount] = useState(0);
    const [user, setUser] = useState("");

    function handleClick() {
        setCount(count + 1);
        setTimeout(() => {
            setUser("new user");
        }, 1000);
    }
    useEffect(() => {
        console.log('component creation');
        return () => {
            console.log("component deletion");
        }
    }, []);

    useEffect(() => {
        console.log("this code will be executed when ever there is re-rending happening with this component.");
    });

    useEffect(() => {
        console.log("this will execute only if count, user is changed", count, user);
    }, [count, user]);
    return (
        <>
            <p>the count is {count}</p>
            <button onClick={handleClick}>incr</button>
        </>
    );
}
```
