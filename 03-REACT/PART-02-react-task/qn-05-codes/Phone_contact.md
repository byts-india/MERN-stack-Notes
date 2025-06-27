# phone contact saving project

##  `TODOlist.css`

```CSS
form {
    background-color: ghostwhite;
    width: fit-content;
}
```


## `TODOlist.jsx`

```javascript
import { useState } from "react";

import './TODOlist.css';

// My styling
const customStyle = {
    button: {
        backgroundColor: 'skyblue',
        marginLeft: '10px'
    },
    input: {
        marginTop: '2px',
        padding: '2px'
    },
    title: {
        color: 'salmon',
        fontWeight: '400'
    },
    card: {
        margin: '10px',
        padding: '10px',
        border: '2px solid black',
        width: 'fit-content'
    }
}

const CATEGORY = ["student", "staff", "family"];
const DEFAULT_CONTACT = {
    name: {
        firstName: "",
        lastName: "",
        prefix: ""
    },
    category: "",
    phoneNumber: ""
};

function Form({ addItems }) {
    const [firstName, setFirstName] = useState("");
    const [lastName, setLastName] = useState("");
    const [prefix, setPrefix] = useState("");
    const [category, setCategory] = useState("others");
    const [phoneNumber, setPhoneNumber] = useState("");

    function handleSubmit(event) {
        // 👇 in this code, It is mandatory to write   `event.preventDefault()`
        // 💡 Reason : by default submit action will open php page or another page for submission. 
        //  important ☠️ : Mostly asked interview question.
        event.preventDefault();
        // TODO: submit logic
        let obj = {
            name: {
                firstName: firstName,
                lastName: lastName,
                prefix: prefix
            },
            category: category,
            phoneNumber: phoneNumber
        }
        addItems(obj);
        // reset inputs
        setFirstName("");
        setLastName("");
        setPrefix("");
        setPhoneNumber("");
        setCategory("others");
    }

    return (
        <form onSubmit={handleSubmit}>
            <fieldset>
                <legend style={customStyle.title}>TODO list</legend>
                <fieldset>
                    <legend>NAME</legend>
                    <input
                        style={customStyle.input}
                        type="text"
                        placeholder="firstName"
                        value={firstName}
                        onChange={(e) => setFirstName(e.target.value)}
                        required
                    />
                    <br />
                    <input
                        style={customStyle.input}
                        type="text"
                        placeholder="lastName"
                        value={lastName}
                        onChange={(e) => setLastName(e.target.value)}
                        required
                    />
                    <br />
                    <input
                        style={customStyle.input}
                        type="text"
                        placeholder="prefix"
                        value={prefix}
                        onChange={(e) => setPrefix(e.target.value)}
                        required
                    />
                    <br />
                </fieldset>
                <label>category </label>
                <select
                    value={category}
                    onChange={(e) => setCategory(e.target.value)}
                    required
                >
                    <option value="others">default</option>
                    {
                        CATEGORY.map((value, index) => {
                            return <option key={index} value={value}>{value}</option>
                        })
                    }
                </select>
                <br />
                <label>Phone number </label>
                <input
                    style={customStyle.input}
                    type="text"
                    placeholder="phoneNumber"
                    value={phoneNumber}
                    onChange={(e) => setPhoneNumber(e.target.value)}
                    required
                />
                <br />
                <button style={customStyle.button} type="submit">submit</button>
            </fieldset>
        </form >
    );
}


function Card({ index, data, deleteItems, editItems }) {
    function handleEdit() {
        let firstName = prompt("Enter firstName field");
        let lastName = prompt("Enter lastName field");
        let prefix = prompt("Enter prefix field");
        let phoneNumber = prompt("Enter phoneNumber field");
        if (
            firstName.trim() !== '' &&
            lastName.trim() !== '' &&
            prefix.trim() !== '' &&
            phoneNumber.trim() !== ''
        ) {
            let tempObj = data;
            tempObj.name.firstName = firstName;
            tempObj.name.lastName = lastName;
            tempObj.name.prefix = prefix;
            tempObj.phoneNumber = phoneNumber;
            editItems(tempObj, index);
        } else {
            alert("empty input value cannot be updated.")
        }
    }
    // let data = DEFAULT_CONTACT;
    return (
        <div style={customStyle.card}>
            <ul>
                <li>
                    <strong>Name: </strong> {data.name.firstName} {data.name.lastName} - {data.name.prefix}
                </li>
                <li>
                    <strong>Category: </strong>{data.category}
                </li>
                <li>
                    <strong>Phone number: </strong> {data.phoneNumber}
                </li>
            </ul>
            <button style={customStyle.button} onClick={handleEdit}>edit</button>
            <button style={customStyle.button} onClick={() => deleteItems(index)}>delete</button>
            {/*                                         ☝️ here 
                                            ⚠️ ALways use arrow function, 
                                               If you want to send some arguments to function.

                                            🏷️ In our case, `deleteItems` function. 
                                               we are passing   `index` as arguments.
                                               Hence we have to use arrows function

                                            ☠️ If you write a code as below.
                                               It won't through any error or warning.
                                               It won't work properly.
                                            ❌ onClick={deleteItems(index)} ❌
                 
            */}
        </div>
    );
}

function TODOlist() {
    const [arr, setArr] = useState([]);

    function handleAddItems(newData) {
        setArr([...arr, newData]);
    }
    function handleDeleteItems(idx) {
        let result_arr = arr.filter((value, index) => {
            return index !== idx;
        });
        setArr(result_arr);
    }
    function handleEditItems(newData, idx) {
        arr[idx] = newData;
        setArr([...arr]);
    }
    return (
        <>
            <label>CONTACT LIST</label>
            <Form addItems={handleAddItems} />
            <div>
                {
                    arr.map((value, index) => {
                        return (
                            <Card
                                key={index}
                                // ☝️ here we must send key,
                                // Or else you will receive a warning. 
                                // And key should be unique to all items.
                                // Mostly all developers will pass index as key.
                                index={index}
                                data={value}
                                deleteItems={handleDeleteItems}
                                editItems={handleEditItems}
                            />
                        );
                    })
                }
            </div>
        </>
    );
}

export default TODOlist;
```
