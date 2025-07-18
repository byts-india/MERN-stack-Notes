# REACT Advance core concepts ( REACT OPTIMIZATION ):

## `1. memo`

- Restrict unwanted child component redering.
- Use to memoize a component.

### syntax

const MemoizedComp = memo(ExistingComponent);

- Usage:
  Only renders if needed.
  during props changes and its own state changes.

```jsx
import { memo, useMemo, useState } from "react";
import "./App.css";

// MEMO EXAMPLE
function ChildComponent() {
  const [value, setValue] = useState(0);
  console.log("ChildComponent is rendering");
  return (
    <h1 className="bg-yellow-200 text-black rounded-sm px-5">
      <span onClick={() => setValue(value + 1)}>inside component {value}</span>
    </h1>
  );
}

const MemoizedComponent = memo(ChildComponent);

export default function App() {
  const [count, setCount] = useState(0);

  return (
    <div className="w-screen h-screen flex justify-center align-middle items-center">
      <div className="h-1/2 w-1/2 bg-black text-white p-5 font-medium">
        <h1>hello world</h1>
        <button
          className="bg-blue-300 rounded-sm px-2 text-red"
          onClick={() => setCount(count + 1)}
        >
          {" "}
          click me : {count}
        </button>
        {/* <ChildComponent /> */}
        <MemoizedComponent />
      </div>
    </div>
  );
}
```

## `2. useMemo`

- it is hook,
- should be used inside the component.
- when to use ?
  - When ever you want to memoize a
    heavy func calculation.
  - To avoid execution of heavy func call,
    On each re-renders.

### syntax for useMemo

const memoizedValue = useMemo(funcRef,[deps]);
-> useMemo will return memoized result
of a function.
