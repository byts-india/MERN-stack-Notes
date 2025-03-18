# useReducer

## `ReducerExample.jsx`

```javascript
import { useReducer } from "react";

function counterReducer(state, action) {
    switch (action.type) {
        case 'incr':
            return {
                count: state.count + 1
            }
        case 'decr':
            return {
                count: state.count - 1
            }
        case 'reset':
            return {
                count: 0
            }
        default:
            return state;
    }
}

export default function ReducerExample() {
    const [state, dispatch] = useReducer(counterReducer, { count: 0 });
    return (
        <>
            <p>the count is {state.count}</p>
            <button onClick={() => dispatch({ type: 'incr' })}>incr</button>
            <button onClick={() => dispatch({ type: 'decr' })}>decr</button>
            <button onClick={() => dispatch({ type: 'reset' })}>reset</button>
        </>
    );
}
```
