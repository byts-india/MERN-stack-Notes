import { useState } from "react";

function ParentComp() {
    const [arr, setArr] = useState([]);
    function handleClick() {
        setArr([...arr, "new item"]);
    }
    return (
        <>
            <button onClick={handleClick}>add item</button>
            <ol>
                {
                    arr.map((value, index) => {
                        return <li key={index}>{value + (index + 1)}</li>
                    })
                }
            </ol>
        </>
    );
}

export default ParentComp;