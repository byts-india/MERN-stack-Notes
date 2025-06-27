# All components code in VITE + react project

## things we are doing

- we copy html code and paste in the component code.
- Same output what you saw in html.
- Same output you should see in react also.
- Not even a single change.
- For now, we just copied our html code and pasted inside each components.

### `📜 App.jsx`

```jsx
import MyMiniApp from "./components/MyMiniApp";
import './App.css';

function App() {
  return (
    <>
      <MyMiniApp />
    </>
  );
}
export default App;
```

### `📄 components/MyMiniApp/index.jsx` 💡TEMPORARY💡

```jsx
import FilterSection from "./FilterSection";
import Header from "./Header";
import ListItems from "./ListItems";

function MyMiniApp() {
    return (
        <div className="container">
            <div id="app">
                <div className="title">MY TODO LIST</div>
                <Header />
                <FilterSection />
                <ListItems />
            </div>
        </div>
    );
}

export default MyMiniApp;
```

### `📄 components/MyMiniApp/Header.jsx`

```jsx
export default function Header() {
    return (
        <header>
            <input type="text" placeholder="Type your task to be added..." />
            <div className="plus">+</div>
        </header>
    );
}
```

### `📄 components/MyMiniApp/FilterSection.jsx`

```jsx
export default function FilterSection() {
    return (
        <section className="filter">
            <div className="tag selected">Favorite ⭐</div>
            <div className="tag">Important 🏷️</div>
        </section>
    );
}
```

### `📄 components/MyMiniApp/ListItems.jsx`

```jsx
import Card from "./Card";

export default function ListItems() {
    return (
        <section className="list-items">
            <Card />
            <Card />
        </section>
    );
}
```

### `📄 components/MyMiniApp/Card.jsx`

```jsx
export default function Card() {
    return (
        <div className="card">
            <p>
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolor
                reiciendis minus vitae porro aliquid. Magni mollitia blanditiis porro,
                consequatur, eius autem libero iure laudantium nulla ullam aperiam
                animi ad explicabo?
            </p>
            <div className="time">10:00 AM</div>
            <div className="misc">
                <span className="tag selected">🏷️</span>
                <span className="tag">⭐</span>
            </div>
        </div>
    );
}
```
