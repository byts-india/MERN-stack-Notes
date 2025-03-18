# ListItems.jsx  🥳🙌 `<` FINAL WORKING CODE `>` 🎉🎉

```jsx
import PropTypes from "prop-types";
import Card from "./Card";

export default function ListItem({
    items,
    isFavorite,
    isImportant,
    updateArr,
    removeItem
}) {
    return (
        <section className="list-items">
            {
        
                items.filter((val) => {
                    return (val?.favorite === isFavorite && val?.important === isImportant);
                }).map((value, index) => {
                    return (
                        <Card
                            key={index}
                            data={value}
                            index={index}
                            removeItem={removeItem}
                            updateArr={updateArr}
                        />
                    );
                })
            }
        </section>
    );
}

ListItem.propTypes = {
    items: PropTypes.array,
    isFavorite: PropTypes.bool,
    isImportant: PropTypes.bool,
    updateArr: PropTypes.func,
    removeItem: PropTypes.func,
};
```
