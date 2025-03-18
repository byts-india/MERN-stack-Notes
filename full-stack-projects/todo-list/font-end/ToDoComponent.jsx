import { useEffect, useState } from "react";
import './custom-style.css';

// ---------------------------------------------------
//               MAIN REACT COMPONENT
// ---------------------------------------------------
function ToDoList({ userId, setPageTab }) {
    const [arr, setArr] = useState([]);
    const [inputValue, setInputValue] = useState("");

    useEffect(() => {
        const requestOptions = {
            method: "GET",
            redirect: "follow"
        };

        fetch("http://localhost:3434/user/items/" + userId, requestOptions)
            .then((response) => response.json())
            .then((result) => {
                if (result.status) {
                    setArr(result.data.items);
                } else {
                    alert(result.msg);
                }
            })
            .catch((error) => console.error(error));
    }, []);

    function handleSaveBtn() {
        const myHeaders = new Headers();
        myHeaders.append("Content-Type", "application/json");

        const raw = JSON.stringify({
            "_id": userId,
            "items": arr
        });

        const requestOptions = {
            method: "PUT",
            headers: myHeaders,
            body: raw,
            redirect: "follow"
        };

        fetch("http://localhost:3434/user/items", requestOptions)
            .then((response) => response.json())
            .then((result) => {
                if (result.status) {
                    alert(result.msg);
                } else {
                    alert(result.msg);
                }
            })
            .catch((error) => console.error(error));
    }

    function handleAddBtn() {
        // 🏷️ to handle add items in array.
        if (inputValue !== "") {
            // using destructuring to add items in the array
            setArr([...arr, inputValue]);
            setInputValue("");
        }
    }

    function handleDeleteItems(deleteIdx) {
        // 🏷️ to handle delete operation in array.
        // using filter concept to delete items in array
        //  LOGIC :
        //  1. here condition says. index !== deleteIdx.
        //  2. which means, return an array of items, which only matches this condition.
        //  3. for more specific, if current item index not equal to deleteIdx then add item to it.
        let result_arr = arr.filter((value, index) => {
            return index !== deleteIdx;
        });
        setArr(result_arr);
    }

    function handleEditItems(editIdx) {
        // 🏷️ to handle edit items in array
        // 1. getting value that need to be updated from prompt function.
        let updatedContent = prompt("your new content");
        if (updatedContent !== "") {
            arr[editIdx] = updatedContent;
            // 2. above case. I am updating the content.
            // 3. by using destructuring. I am updating the content.
            // NOTE: ⚠️ setArr(arr);  won't work.
            setArr([...arr]);
        }
    }
    return (
        <div className="to-do-app">
            <button onClick={() => setPageTab("welcome")}>log-out</button>
            <br />
            <button onClick={handleSaveBtn}>save</button>
            <br />
            <label>TODO items:</label>
            <input type="text" value={inputValue} onChange={(e) => setInputValue(e.target.value)} />
            <button onClick={handleAddBtn}>add</button>
            <ol>
                {
                    arr.map((value, index) => {
                        return (
                            <div className="items" key={index}>
                                <div className="flex">
                                    <div>
                                        <div className="content">{value}</div>
                                    </div>
                                    <div style={{ minWidth: '150px' }}>
                                        <button onClick={() => handleEditItems(index)}><i className="fa-solid fa-pen-to-square"></i></button>
                                        <button onClick={() => handleDeleteItems(index)}><i className="fa-solid fa-trash"></i></button>
                                    </div>
                                </div>
                            </div>
                        );
                    })
                }
            </ol>
        </div>
    );
}

export default ToDoList;