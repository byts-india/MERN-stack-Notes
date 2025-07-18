# REACT Advance core concepts:

## REACT OPTIMIZATION

1. memo

- Restrict unwanted child component redering.
- Use to memoize a component.

## syntax

const MemoizedComp = memo(ExistingComponent);

- Usage:
  Only renders if needed.
  during props changes and its own state changes.

```jsx
import { memo, useMemo, useState } from "react";
import "./App.css";

// MEMO EXAMPLE
function What() {
  const [value, setValue] = useState(0);
  console.log("what is rendering");
  return (
    <h1 className="bg-yellow-200 text-black rounded-sm px-5">
      <span onClick={() => setValue(value + 1)}>inside component {value}</span>
    </h1>
  );
}

const MemoizedComponent = memo(What);

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
        <MemoizedComponent />
      </div>
    </div>
  );
}
```
