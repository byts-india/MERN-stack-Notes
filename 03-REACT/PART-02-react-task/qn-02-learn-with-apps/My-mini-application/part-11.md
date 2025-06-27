# Header.jsx  🥳🙌 `<` FINAL WORKING CODE `>` 🎉🎉

```jsx
import { useState } from "react";
import PropTypes from "prop-types";

function getCurrentTime() {
    let now = new Date();
    let hours = now.getHours();
    let minutes = now.getMinutes();
    let ampm = hours >= 12 ? 'PM' : 'AM';

    // Convert hours to 12-hour format
    hours = hours % 12;
    hours = hours ? hours : 12; // Handle the case for "0" (midnight)

    // Add leading zero to minutes if necessary
    minutes = minutes < 10 ? '0' + minutes : minutes;

    // Return time in "10:00 AM" format
    return hours + ':' + minutes + ' ' + ampm;
}

export default function Header({ addItem }) {
    const [inputValue, setInputValue] = useState("");
    const handleClick = () => {
        // It is always recommended to check or validate you input before doing any operation.    
        if (inputValue.trim() !== "") {
            const newObj = {
                text: inputValue,
                time: getCurrentTime(),
                important: false,
                favorite: false,
                done: false
            };
            addItem(newObj);
            // once everything done, reset input field to empty input box.
            setInputValue("");
        } else {
            alert("invalid input");
            setInputValue("");
        }
    }
    return (
        <header>
            <input
                type="text"
                placeholder="Type your task to be added..."
                value={inputValue}
                onChange={(e) => setInputValue(e.target.value)}
            />
            <div className="plus" onClick={handleClick}>+</div>
        </header>
    );
}

Header.propTypes = {
    addItem: PropTypes.func
};
```
