# Doing `Card.jsx` logic

## Logics

1. Keep you default value ( DEFAULT_VALUE )
2. Create state, which is going to store object. and keep DEFAULT_VALUE as default value.
3. In this component, we will include a props (data). and write our prop validation code.
4. Create a logic, which will execute when props value is changing. In our case our props is (data)
5. we will do data validation. which will make sure our application will run, even in unfortunate situation.
6. You know we can have more that one class name in a tag.
    - now by using concatenation we will add 2 strings based on ternary condition.
    - `(obj.important ? "selected" : "")` if important is true, then give "selected" or else Empty string.
7. You know we can have more that one class name in a tag.
    - now by using concatenation we will add 2 strings based on ternary condition.
    - `(obj.favorite ? "selected" : "")` if important is true, then give "selected" or else Empty string.
8. `<Card data={undefined} />`, make sure to pass sample props value.

### `Card.jsx` 💡TEMPORARY💡

```jsx
import PropTypes from "prop-types";
import { useState } from "react";
import { useEffect } from "react";

// #01
const DEFAULT_VALUE = {
    text: 'unknown',
    time: '00:00 AM',
    important: false,
    favorite: false,
    done: false
};

export default function Card({ data }) {
    const [obj, setObj] = useState(DEFAULT_VALUE); // #02

    useEffect(() => {
        // #04

        // execute the code 
        // when value (data) is changing.

        // validate the data 
        if (
            data?.text !== undefined &&
            data?.time !== undefined &&
            data?.important !== undefined &&
            data?.favorite !== undefined
        ) {
            // #05
            setObj(data);
        } else {
            setObj(DEFAULT_VALUE)
        }
    }, [data]);

    return (
        <div className="card">
            <p>
                {obj.text}
            </p>
            <div className="time">{obj.time}</div>
            <div className="misc">
                {/* #6  */}
                <span className={"tag " + (obj.important ? "selected" : "")}>🏷️</span>
                {/* #7  */}
                <span className={"tag" + (obj.favorite ? "selected" : "")}>⭐</span>
            </div>
        </div>
    );
}

// #3
// PROP VALIDATION
Card.propTypes = {
    data: PropTypes.object,
};
```
