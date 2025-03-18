# Doing `ListItems.jsx` logic

## Logics

1. Creating prop types. where items will be an array.
2. create list rendering from props.
    - items is an array
    - key={index} is mandatory. To help react understand that, all rendered items will be uniquely identified by `key`.
3. `<ListItem items={[]} />` Make sure to send some sample value in Component props.

### `ListItems.jsx` 💡TEMPORARY💡

```jsx
import PropTypes from "prop-types";
import Card from "./Card";

export default function ListItems({ items }) { 

    return (
        <section className="list-items">
            {
                // #2 
                items.map((value, index) => {
                    <Card key={index} data={value} />
                })
            }
        </section>
    );
}

// #1
ListItems.propTypes = {
    items: PropTypes.array
};
```
