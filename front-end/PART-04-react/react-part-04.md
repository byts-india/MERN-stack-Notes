# more advance topics

## 1️⃣ context api

- How to handle data across multi layer of components
- to avoid prop drilling we use to create context API.
- we use below functions to create and use context API.
  - createContext
  - useContext

STEPS:

 1. **creating Context**  : `const SampleContext = createContext( defaultValue );`
 2. **Providing Context** : `<SampleContext.Provider value={}> </SampleContext.Provider>`
 3. **using context**     : `let sampleContext = useContext ( SampleContext )`

```javascript
// CountContext.jsx
import { createContext } from "react";

const CountContext = createContext(null);

export default CountContext;
```

```javascript
// ParentComp.jsx
import { useContext, useState } from "react";
import CountContext from "./CountContext";

function ChildComp() {
    let [count, setCount] = useContext(CountContext);
    function handleClick() {
        setCount(count + 1)
    }
    return (
        <>
            <p> this is child comp {count}</p>
            <button onClick={handleClick}>update data</button>
        </>
    );
}

function ParentComp() {
    const [count, setCount] = useState(1000);
    return (
        <>
            <button onClick={() => setCount(count + 1)}>click me</button>
            <CountContext.Provider value={[count, setCount]}>
                <ChildComp />
            </CountContext.Provider>
        </>
    );
}

export default ParentComp;
```
