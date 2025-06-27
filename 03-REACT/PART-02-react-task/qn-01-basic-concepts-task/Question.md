# All react task questions are here

## ARRAY TASK

- 1 component
- 1 state, where default value is `[]`. 💡 state of array type.
- 1 function named `handleClick()`
  - `🏷️ todo:` add a string `new item` in above array state
- output should look like below.

![image](https://github.com/user-attachments/assets/e6c9e965-ca26-452a-bead-2b917dec3f99)

---

## input task

- 1 component
- 2 state, where default value is `""`. 💡 state of string type.
- return statement has 2 input tags.
- below is html code for one input tag.
- where u have use `onChange=` event to update the state.

```js
 <input type="text" value={password} onChange={(e) => setPassword(e.target.value)} />
```

- output should look like below.
![image](https://github.com/user-attachments/assets/506cbdaf-a21a-4416-ad5a-7bb9f51622c1)

---

## login task

- 2 components
  1. `HomePage`, which will return only `<h1>HomePage</h1>`
  2. `LoginPage`,
- your work is to create a login page.
- where if username is `admin`
- and its password is `admin` then only render homepage.
- else display alert message `wrong credentials`

💡 notes:
        3 states,
           - username `string`, password `string`, auth `boolean`
        1 function `handleSubmit`
            - check if both input is `admin` if so.
            - set auth state to `true`
            - else. alert `wrong credentials`
        in `LoginPage` component.
        you have to return based on condition.

```javascript

if(auth) {
    return <HomePage />; 
}else{
    return (<></>);
}
```

![image](https://github.com/user-attachments/assets/62f2ca34-0500-4ae0-80fa-1f14255b340a)

---

## array 02 task

![image](https://github.com/user-attachments/assets/508e0ed0-af30-4fbf-9cee-c102266f55ab)


## todo list

- 1 component
- 2 state, `arr` to store items, `inputValue` to get input.
- 3 event handling function.
- `handleClick()` ,  
- `handleDeleteItems(idx)`,
- `handleEditItems(idx)`

```javascript
import { useState } from "react";

export default function TodoList() {
    // arr             state
    // inputValue      state
    function handleClick() {
        if (inputValue !== "") {
            // add inputValue to arr
            // reset inputValue to empty string.
        }
    }
    
    function handleDeleteItems(idx) {
        // remove item with idx passed in parameter.
        // update new array in state
    }

    function handleEditItems(idx) {
        let updatedContent = prompt("your new content");
        if (updatedContent !== "") {
            // update array item with given index.
            // update the state.
        }
    }
    // html should be written by you.
    return ();
}


```

![image](https://github.com/user-attachments/assets/3a4136b7-a263-4039-8441-fe6ba8702eb1)

