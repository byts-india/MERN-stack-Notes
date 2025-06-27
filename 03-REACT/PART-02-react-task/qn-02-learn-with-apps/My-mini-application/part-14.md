# Card.jsx  🥳🙌 `<` FINAL WORKING CODE `>` 🎉🎉

-
-

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

export default function Card({ data, index, removeItem, updateArr }) {
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

    function updateCard(key, value) {
        const updated_obj = {
            ...obj
        };
        updated_obj[key] = value;
        updateArr(index, updated_obj);
    }


    return (
        <div className="card" style={obj?.done ? myStyle.done : myStyle.undone}>
            <p>
                {obj.text}
            </p>
            <div className="time">created at : {obj.time}</div>
            <div className="misc">
                {/* #6  */}
                <span
                    className={"tag " + (obj.important ? "selected" : "")}
                    onClick={() => updateCard("important", !obj.important)}
                >🏷️</span>
                {/* #7  */}
                <span
                    className={"tag" + (obj.favorite ? "selected" : "")}
                    onClick={() => updateCard("favorite", !obj.favorite)}
                >⭐</span>
                <button style={myStyle.btn} onClick={() => updateCard("done", true)}>done</button>
                <button style={myStyle.btn} onClick={() => removeItem(index)}>remove</button>
            </div>
        </div>
    );
}

// #3
// PROP VALIDATION
Card.propTypes = {
    data: PropTypes.object,
    index: PropTypes.number,
    removeItem: PropTypes.func,
    updateArr: PropTypes.func
};

// styles
const myStyle = {
    btn: {
        float: 'right'
    },
    done: {
        opacity: "50%"
    },
    undone: {
        opacity: "100%"
    }
};
```
