# Doing `index.jsx` logic

## Logics

1. Creating prop types. where items will be an array.

### `MyMiniApp.jsx` 💡TEMPORARY💡

```jsx
import { useState } from "react";
import FilterSection from "./FilterSection";
import Header from "./Header";
import ListItems from "./ListItems";

const DEFAULT_VALUE = [
    { text: 'buy ice cream 🍧', time: '10:00 AM', important: false, favorite: true, done: false },
    { text: 'buy ice cream 🍧', time: '10:00 AM', important: false, favorite: true, done: false },
];

function MyMiniApp() {
    const [arr, setArr] = useState(DEFAULT_VALUE);
    const [isFavorite, setIsFavorite] = useState(false);
    const [isImportant, setIsImportant] = useState(false);

    const addItem = (newObj) => { }
    const removeItem = (index) => { }
    const updateArr = (index, updatedObj) => { }
    const filterItems = (favorite, important) => { }

    return (
        <div className="container">
            <div id="app">
                <div className="title">MY TODO LIST</div>
                <Header addItem={addItem} />
                <FilterSection filterItems={filterItems} />
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
