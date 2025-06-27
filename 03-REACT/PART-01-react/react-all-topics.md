# ALL TOPICS

## Beginner

1. component
1. conditional rendering
1. list rendering
1. state
1. event handling
1. props ( parent to child )
1. hooks
    1. useState
    1. useEffect
1. using UI react-framework ( React-Material UI )

## intermediate

1. hooks
    1. [ context api ] createContext, useContext
    1. useReducer
    1. useRef
    1. useId
    1. React-router-dom ( library )

## advance

1. hooks
    1. custom hooks
    1. optimization
        1. useMemo
        1. useCallback
        1. Suspense
    1. state management
        1. react redux ( library )
        2. react redux toolkit
    1. writing service file ( api connection logic )
    1. lazy

## task

### part 01

<hr>
<h2> react task 01 </h2>
<div>
    <p> The count is 0 </p>
    <button>incr</button>
    <button>decr</button>
</div>
<hr>

<h2> react task 02 </h2>
<div>
    <p> the value is 10 and it is even </p>
    <button>incr</button>
    <button>decr</button>
</div>
<hr>

only allow positive values, No negative values

<h2> react task 03 </h2>
<div>
    <p> the value is 10 and it is even </p>
    <button>incr</button>
    <button>decr</button>
</div>
<hr>

<h2> react task 03 </h2>
<div>
    <p> the value is 10 and it is even </p>
    <button>incr</button>
    <button>decr</button>
</div>
<hr>

```javascript
import { useState } from "react";

function Heart({ count, setCount }) {
    const [like, setLike] = useState(false);
    function handleLike() {
        // false -> true     : like    +1
        // true  -> false    : unlike  -1
        if (like) {
            setCount(count - 1);
        }
        else {
            setCount(count + 1);
        }
        setLike(!like);
    }
    return (
        <span onClick={handleLike} style={{ color: 'red' }}>
            {
                like ? <i className="fa-solid fa-heart"></i> : <i className="fa-regular fa-heart"></i>
            }
        </span>
    );
}

export default function HeartIn() {
    // let count = 0;
    const [count, setCount] = useState(0);
    return (
        <>
            <p> the like count is {count} </p>
            <Heart count={count} setCount={setCount}></Heart>
            <Heart count={count} setCount={setCount}></Heart>
            <Heart count={count} setCount={setCount}></Heart>
            <Heart count={count} setCount={setCount}></Heart>
            <Heart count={count} setCount={setCount}></Heart>
            <Heart count={count} setCount={setCount}></Heart>
            <Heart count={count} setCount={setCount}></Heart>
            <Heart count={count} setCount={setCount}></Heart>
            <Heart count={count} setCount={setCount}></Heart>
            <Heart count={count} setCount={setCount}></Heart>
        </>
    )
}
```
