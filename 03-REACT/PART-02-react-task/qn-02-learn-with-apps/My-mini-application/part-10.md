# `index.jsx` 🥳🙌 `<` FINAL WORKING CODE `>` 🎉🎉

## CODE

```jsx
import { useState } from "react";
import FilterSection from "./FilterSection";
import Header from "./Header";
import ListItems from "./ListItems";

const DEFAULT_VALUE = [
    { text: 'buy ice cream 🍧', time: '10:00 AM', important: false, favorite: false, done: false },
    { text: 'buy chocolates 🍫', time: '10:00 AM', important: false, favorite: false, done: false },
];

function MyMiniApp() {
    const [arr, setArr] = useState(DEFAULT_VALUE);
    const [isFavorite, setIsFavorite] = useState(false);
    const [isImportant, setIsImportant] = useState(false);

    const addItem = (newObj) => {
        const updated_arr = [...arr, newObj];
        setArr(updated_arr);
    }
    const removeItem = (remove_index) => {
        const updated_arr = arr.filter((val, idx) => {
            return idx != remove_index;
        });
        setArr(updated_arr);
    }
    const updateArr = (index, updatedObj) => {
        arr[index] = updatedObj;
        const updated_arr = [...arr]; // creating new array.
        setArr(updated_arr);
    }
    const filterItems = (favorite, important) => {
        setIsFavorite(favorite);
        setIsImportant(important);
    }

    return (
        <div className="container">
            <div id="app">
                <div className="title">MY MINI APPLICATION</div>
                <Header addItem={addItem} />
                <FilterSection
                    isFavorite={isFavorite}
                    isImportant={isImportant}
                    filterItems={filterItems}
                />
                <ListItems
                    isFavorite={isFavorite}
                    isImportant={isImportant}
                    updateArr={updateArr}
                    removeItem={removeItem}
                    items={arr}
                />
            </div>
        </div>
    );
}

export default MyMiniApp;
```

## Function logic explanation

```jsx
import { useState } from "react";
import FilterSection from "./FilterSection";
import Header from "./Header";
import ListItems from "./ListItems";

const DEFAULT_VALUE = [
    { text: 'buy ice cream 🍧', time: '10:00 AM', important: false, favorite: false, done: false },
    { text: 'buy chocolates 🍫', time: '10:00 AM', important: false, favorite: false, done: false },
];

function MyMiniApp() {
    const [arr, setArr] = useState(DEFAULT_VALUE);             // 👈 to store your items.
    const [isFavorite, setIsFavorite] = useState(false);      // 👈 to filter in items
    const [isImportant, setIsImportant] = useState(false);   // 👈 to filter in items

    const addItem = (newObj) => {
        // create a new array using "Array destructuring" concept.
        // why can't we use arr.push(), because, in react we won't perform mutation.
        const new_arr = [...arr, newObj];
        // then set our `Arr` state.
        setArr(new_arr);
    }
    const removeItem = (remove_index) => {
        // we are removing using filter concept
        const updated_arr = arr.filter((val, idx) => {
            return idx != remove_index;
        });
        // update the arr state.
        setArr(updated_arr);
    }
    const updateArr = (index, updatedObj) => {
        arr[index] = updatedObj;      // updated in same array, which is called as mutation.
        const updated_arr = [...arr]; // creating new array with array destructuring, because in react, we avoid mutation.
        setArr(updated_arr);
    }
    const filterItems = (favorite, important) => {
        setIsFavorite(favorite);
        setIsImportant(important);
    }

    return (
        <div className="container">
            <div id="app">
                <div className="title">MY MINI APPLICATION</div>
                <Header addItem={addItem} />
                { /* 
                    In below code. we kept single line of code as [ wrap it in next line. ].
                    🤔 why. Because for more readability. This is how all developers will do.
                    Even when you go to companies. You will do this.
                 */}
                <FilterSection
                    isFavorite={isFavorite}
                    isImportant={isImportant}
                    filterItems={filterItems}
                />
                <ListItems
                    isFavorite={isFavorite}
                    isImportant={isImportant}
                    updateArr={updateArr}
                    removeItem={removeItem}
                    items={arr}
                />
            </div>
        </div>
    );
}

export default MyMiniApp;
```

## JS concepts explanation use in above code

### `arr destructuring concept`

```javascript
const arr = [
    { text: 'buy ice cream 🍧', time: '10:00 AM', important: false, favorite: false, done: false },
    { text: 'buy chocolates 🍫', time: '10:00 AM', important: false, favorite: false, done: false },
];
const newObj =     { text: 'Complete my home-work', time: '11:00 AM', important: false, favorite: false, done: false };
const new_arr = [...arr, newObj];
```

### `arrow function`

```javascript
// FUNCTION DEFINITION
// normal function
function fn1() {
    console.log("hello world! from fn1");
}

// function expression
const fn2 = function () {
    console.log("hello world! from fn2");
}

// arrow function
const fn3 = () => {
    console.log("hello world! from fn3");
}

// FUNCTION CALL
fn1(); 
fn2();
fn3();
```

### `understand filter concept`

```javascript
// filter is method, which will be available inside array object.
const arr = [
    { text: 'buy ice cream 🍧', time: '10:00 AM', important: false, favorite: false, done: false },
    { text: 'buy chocolates 🍫', time: '10:00 AM', important: false, favorite: false, done: false },
];

const indexToFind = 1;

function sampleFunction(value, index) {
    // when dealing with filter, for now you can think like.
    // it accepts. two parameter, ( value, index )

    // Here we are going to pass this to filter method.
    // always remember 💭 we have to return a boolean when passing to filter function.
    return index === indexToFind;
}

// what is happening below 🤔 
// we are passing a function ( sampleFunction ) to another function ( filter ) like a arguments.
const result1 = arr.filter(sampleFunction);

// how is this filter function exactly working.

console.log(result1);

// 🎉 same story we can do with arrow function. 🎉
// why particularly using arrow function.
//  Because, it will easier for us   
```
