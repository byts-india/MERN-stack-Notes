# TODO LIST PROJECT

```javascript
import { useState } from "react";

function ParentComp() {
    const [arr, setArr] = useState([]);
    const [inputValue, setInputValue] = useState("");
    function handleAddItems() {
        if (inputValue !== "") {
            setArr([...arr, inputValue]);
            setInputValue("")
        }
    }
    function handleDeleteItems(idx) {
        let result_arr = arr.filter((value, index) => {
            return index !== idx;
        });
        setArr(result_arr);
    }
    function handleEditItems(idx) {
        let updatedContent = prompt("your new content");
        if (updatedContent.trim() !== "") {
            arr[idx] = updatedContent;
            setArr([...arr]);
        }
    }
    return (
        <>
            <label>TODO items:</label>
            <input type="text" value={inputValue} onChange={(e) => setInputValue(e.target.value)} />
            <button onClick={handleAddItems}>add</button>
            <ol>
                {
                    arr.map((value, index) => {
                        return (
                            <div key={index}>
                                <li>{value}</li>
                                <button onClick={() => handleDeleteItems(index)}>delete</button>
                                <button onClick={() => handleEditItems(index)}>edit</button>
                            </div>
                        );
                    })
                }
            </ol>
        </>
    );
}

export default ParentComp;
```
