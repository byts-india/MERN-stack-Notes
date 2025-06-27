// https://meet.google.com/ena-fint-wmb

import { useState } from 'react';
import myStyle from './todo-style.module.css';

// we can have multiple components in a single file.
// but make sure you have one default component.
function Card({ value, index, handleDeleteBtn, handleEditBtn }) {
    return (
        <div>
            <div className={myStyle.para}>
                {value}
            </div>
            <div className={myStyle.btnSection}>
                <button
                    className={myStyle.btn}
                    onClick={() => handleEditBtn(index)}
                >✏️</button>
                <button
                    className={myStyle.btn}
                    onClick={() => handleDeleteBtn(index)}
                >🗑️</button>
            </div>
        </div>
    );
}

export default function ToDo() {
    const [inputValue, setInputValue] = useState("");
    const [arr, setArr] = useState([]);

    const handleAddBtn = () => {
        if (inputValue.trim() !== "") {
            setArr([...arr, inputValue]);
            setInputValue("");
        } else {
            setInputValue("");
        }
    }

    const handleDeleteBtn = (delete_index) => {
        let newArr = arr.filter((val, idx) => {
            return idx !== delete_index;
        });
        setArr(newArr);
    }

    const handleEditBtn = (edit_index) => {
        const edit_value = prompt("enter new value :");
        if (edit_value.trim() != "") {
            arr[edit_index] = edit_value;
            const newArr = [...arr];
            setArr(newArr);
        } else {
            alert("invalid input");
        }
    }

    return (
        <div className={myStyle.container}>
            <div className={myStyle.toDoApp}>
                <div className={myStyle.inputSection}>
                    <input
                        value={inputValue}
                        onChange={(e) => setInputValue(e.target.value)}
                        type="text"
                    />
                    <button
                        className={myStyle.btn}
                        onClick={handleAddBtn}
                    >
                        add
                    </button>
                </div>
                <div className={myStyle.listOfItems}>
                    {
                        arr.map((value, index) => {
                            return (
                                <Card
                                    value={value}
                                    key={index}
                                    index={index}
                                    handleEditBtn={handleEditBtn}
                                    handleDeleteBtn={handleDeleteBtn}
                                />
                            );
                        })
                    }
                </div>
            </div>
        </div>
    );
}