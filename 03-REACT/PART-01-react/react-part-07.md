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

```jsx
import { useMemo, useState } from "react";
import "./App.css";
// USE MEMO EXAMPLE
export default function App() {
  const [count, setCount] = useState(0);
  const [value, setValue] = useState(1);

  function handleUpdate() {
    if (count % 10 == 0) {
      setValue(value + 1);
    }
    setCount(count + 1);
  }

  const expensiveEvenSumValue = useMemo(() => {
    console.log("👹 Calculating sum of heavy calc...");
    let sum = value * 10;
    return sum;
  }, [value]);

  return (
    <div style={{ padding: "20px" }}>
      <p>The sum: {expensiveEvenSumValue}</p>

      <button
        className="bg-black rounded-sm px-2 text-yellow-50"
        onClick={handleUpdate}
      >
        counter ({count})
      </button>
    </div>
  );
}
```

## `2. useCallback`

- it is hook,
- should be used inside the component.
- when to use ?

### syntax

const result = useCallback(fn,[deps]);

### Usage

- When you pass a func to ChildrenComponent as props.
- On each and every Parent component re-renders. func which you are passing as props will re-define, hence new func reference will be created.
- Your Memoized Child components think that,
  the func props is changed. To avoid this
  We use useCallback();

### conclusion.

- When you don't want to redefine a function inside a component, until a dependency changes. Use useCallback hook.

```jsx
import { memo, useCallback, useState } from "react";
import "./App.css";

// USE CALL BACK EXAMPLE
function ChildComponent({ handleClick, value }) {
  console.log("child component rerendering...");
  return (
    <div>
      <p>
        value is :
        <span onClick={handleClick} className="bg-black text-red-300">
          {value}{" "}
        </span>
      </p>
    </div>
  );
}
const MemoizedComp = memo(ChildComponent);

export default function App() {
  const [count, setCount] = useState(0);
  const [value, setValue] = useState(1);

  function handleCounterClick() {
    if ((count + 1) % 10 == 0) {
      setValue(value + 1);
    }
    setCount(count + 1);
  }

  const handleValueClick = useCallback(() => {
    setValue(value + 10);
  }, [value]);

  return (
    <div style={{ padding: "20px" }}>
      <button className="bg-red-500 text-white" onClick={handleCounterClick}>
        counter {count}
      </button>
      <br />
      <hr />
      <MemoizedComp value={value} handleClick={handleValueClick} />
    </div>
  );
}
```
