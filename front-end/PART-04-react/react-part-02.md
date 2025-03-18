
# IMPORTANT TOPICS IN REACT

## 1️⃣ steps to follow to create new component in new file

1. Lets decide to create a component name `Sample`.
2. First create a file named `Sample.jsx`
3. Open `Sample.jsx`.

```javascript
// Sample.jsx
export default function Sample() { // default comp...
    return <p> Sample Component </p>;
}
```

## 2️⃣ Importing and exporting components

```javascript
// Cartoon.jsx
function Cartoon() { // default component
    return ( 
        <p>Cartoon component</p>
     );
}

function Ben10() {
    return (
        <p>Ben10 component</p>
    );
}

function Ben10AlienForce() {
    return (
        <p>Ben10 component</p>
    );
}

export default Cartoon; // this is how you have to export default component.
export { Ben10, Ben10AlienForce }; // this is how you have to export non default components.
```

```javascript
// App.jsx
import Cartoon from './Cartoon.jsx';
import { Ben10, Ben10AlienForce } from './Cartoon.jsx';

function App() {
    return (
        <div>
            <Cartoon />
            <Ben10 />
            <Ben10AlienForce />
        </div>
    );
}

export default App;
```

### export

1. export default | eg: `export default Cartoon;`
2. export multiple items | eg: `export { Ben10, Ben10AlienForce };`
3. `export`, `export default` in function declaration are 2 different things. But doing export operation only.

- The export default keywords specify the main component in the file.
- 🔔`only one export default can be written in a file.` 🔔

### `import`

1. import default | eg: `import Cartoon from './Cartoon.jsx';`
2. import multiple items | eg: `import { Ben10, Ben10AlienForce } from './Cartoon.jsx';`
3. import both in single line | eg: `import Cartoon, { Ben10, Ben10AlienForce } from './Cartoon.jsx';`

---

## 3️⃣ Displaying data

- using `{ }` we can display data inside markups

eg:

```javascript
// App.jsx

export function LeaveLetter() {
    // We can have more than one component in single file.
// Like here LeaveLetter is another component inside App.jsx file.
// where App is the default component.
  let name = "roshan";
  let problem = "cold and Cough";
  let value1 = undefined;
  let value2 = null;
  let value3 = true;
  let arr = ["apple", "orange"]; // by default in output, it will concat without any spaces.
  return (
    <div>
      <div>name : {name}</div>
      <div>problem : {problem}</div>
      <div>value1 : {value1}</div>
      <div>value2 : {value2}</div>
      <div>value3 : {value3}</div>
      <div>value4 : {value4}</div>
      <div>arr : {arr}</div>
    </div>
  );
}

function App() {
  return (
    <>
      <LeaveLetter />
    </>
  );
}
export default App;
```

- undefined and null will show nothing in webpage.
- Boolean will only show after using toString method.
- array with strings will be joined without any space.

![image](https://github.com/user-attachments/assets/a75c5910-538b-428a-91b1-91b8293361d3)

## 4️⃣ Adding styles

<!-- ### Adding styles inside public/index.html file

- using link tag. we can add our custom styles sheet
- using link tag. we can add CDN like bootstrap.
- using link tag. we can add CDN for icons like. Font Awesome. -->

### `1. Write only one css, simple approach`

- Keep your general css in `index.css`
- Keep other css in `app.css`
- This css will be applied to all components.

### Adding styles as internal style within the components

- Create a separate css files like `card.css` or `table.css` etc.
- then importing them in components as shown.

```css
/*  button-style.css */
.btn {
    background-color: black;
    color: white;
    padding: 10px;
}
```

```javascript
// 📄 Counter.jsx
import { useState} from 'react';
import 'button-style.css';

// below is another way to keep export default.
export default function Counter() {
    const [count, setCount] = useState(0);
    return (
        <button onClick={() => setCount(count + 1)}> count: {count} </button>
    );
}
```

### other ways to write css in react

- below are some advance concepts.
- By using a package called styled component.
- using inline styling, example shown in 2nd example of `list rendering concept` discussed below.
- The last option is using css frameworks created specially for react like, `Tail-wind` css, `Bootstrap`, `Material UI` for react etc.
- By adding CDN in index.html `Not preferred but possible`

## 5️⃣ OTHER POINTS IN REACT

- we can use both close tag or self close tag in react components.
- eg: `<SampleComp/>`
- eg: `<SampleComp></SampleComp>`
- You can store Markup in a variable also.

## 6️⃣ Conditional rendering

Ways to write conditional rendering:

- using `if`
- using `switch`
- using ternary operator `?:`

```javascript
import React from 'react';

const IfElseExample = () => {
    const isLoggedIn = false;

    if (isLoggedIn) {
        return <h1>Welcome back!</h1>;
    } else {
        return <h1>Please log in.</h1>;
    }
};

export default IfElseExample;

```

```javascript
import React from 'react';

const SwitchExample = () => {
    const userRole = 'admin'; // Can be 'admin', 'user', or 'guest'

    let content;
    switch (userRole) {
        case 'admin':
            content = <h1>Welcome, Admin!</h1>; // this is valid, where you can store html code in a variable also. this is only possible in react. Not possible in vanilla javascript.
            break;
        case 'user':
            content = <h1>Welcome, User!</h1>;
            break;
        default:
            content = <h1>Welcome, Guest!</h1>;
    }

    return <div>{content}</div>;
};

export default SwitchExample;

```

```javascript
import React from 'react';

const TernaryExample = () => {
    const isLoggedIn = true;

    return (
        <div>
            {isLoggedIn ? <h1>Welcome back!</h1> : <h1>Please log in.</h1>}
        </div>
    );
};

export default TernaryExample;

```

## 7️⃣ Rendering lists

- It is about displaying items within the array.
- To display, we use map concept.

### steps

1. you need a array to render list.
2. use below syntax.

        {
              arr.map( ( value, index ) => {
                 return <li key={index} > { value } </li>;
              })
        }
        

3. You can replace above markup with **component** also.

Here's a very simple example of rendering a list using an unordered list (`<ul>`) in React.

### **Rendering a List (ListExample.jsx)**

```jsx
import React from 'react';

const ListExample = () => {
    const fruits = ['Apple', 'Banana', 'Cherry', 'Grapes'];

    return (
        <div>
            <h1>Fruit List</h1>
            <ul>
                {
                    fruits.map((value, index) => {
                        return <li key={index}>{fruit}</li>
                    })
                }
            </ul>
        </div>
    );
};

export default ListExample;
```

### Explanation

- **Array**: `fruits` is a simple array of fruit names.
- **Rendering**: The `.map()` function is used to loop through the `fruits` array and render each fruit as a list item (`<li>`).
- **Key**: A `key` is added to each `<li>` for uniqueness, which is important when rendering lists in React. Or Else you will get a ⚠️ warning in your console.

This will output a list of fruits in an unordered list on the page.

---

Here's how you can create a custom **Card** component in React, which you can then use to render any list of items. We'll create a reusable `Card` component and then render a list using it.

### **CustomCard.js** (Reusable Card Component)

```jsx
import React from 'react';
import './CustomCard.css'; // Optional: You can style the card in a CSS file

const CustomCard = ({ title, description }) => {
    return (
        <div className="custom-card" style={styles.card}>
            <h2 style={styles.title}>{title}</h2>
            <p style={styles.description}>{description}</p>
        </div>
    );
};

// another way to do styling in react component.
// this is how inline style is achieved
const styles = {
    card: {
        border: '1px solid #ccc',
        borderRadius: '8px',
        padding: '16px',
        margin: '10px',
        width: '250px',
        boxShadow: '0 4px 8px rgba(0, 0, 0, 0.1)',
        textAlign: 'center',
    },
    title: {
        fontSize: '18px',
        marginBottom: '10px',
    },
    description: {
        fontSize: '14px',
        color: '#555',
    }
};

export default CustomCard;
```

---

### **CardListExample.js** (Using CustomCard Component)

```jsx
import React from 'react';
import CustomCard from './CustomCard'; // Import your custom card component

const CardListExample = () => {
    const products = [
        { id: 1, name: 'Product 1', description: 'This is product 1' },
        { id: 2, name: 'Product 2', description: 'This is product 2' },
        { id: 3, name: 'Product 3', description: 'This is product 3' },
    ];

    return (
        <div style={styles.container}>
            <h1>Product List</h1>
            <div style={styles.cardContainer}>
                {products.map((product) => (
                    <CustomCard
                        key={product.id}
                        title={product.name}
                        description={product.description}
                    />
                ))}
            </div>
        </div>
    );
};

const styles = {
    container: {
        textAlign: 'center',
    },
    cardContainer: {
        display: 'flex',
        justifyContent: 'center',
        flexWrap: 'wrap',
    },
};

export default CardListExample;
```

### **Explanation**

1. **CustomCard Component**:
   - This component takes two props, `title` and `description`, and renders them in a card-like layout. It has inline styles for simplicity.
2. **CardListExample Component**:
   - This component renders a list of products using the `CustomCard` component. The list is looped through with `.map()`, and each product’s `name` and `description` are passed to the `CustomCard`.
3. **Styles**:
   - Both the `CustomCard` and `CardListExample` components use inline styles to simplify layout and card presentation.

You can further enhance the card design with external CSS if needed by linking to a `.css` file (as shown in `CustomCard.js`)

---

## 8️⃣ Responding to events

- used to handle events like button click.

### steps to write events

- You need any function, can be
  - normal function,
  - function expression,
  - arrow function
- pass your function to handle events

`function handleClick() { }`

- `onClick = { handleClick }`

- by default handleClick will accept a parameter named event

- Some times you have to send data in handleClick

`onClick={()=> handleClick(1)}`

- event mostly used for below purpose.

- Events are achieved using JS callback concept.

```jsx
// App.jsx

export default function App() {
    const [inputValue, setInputValue] = useState("default");

    function handleClick() {
        console.log("btn clicked");
    }    

    function handleClickWithParam(x) {
        console.log("btn clicked : ",x);
    }

    return (
        <div>
            <input type='text' value={inputValue} onChange={(e) => setInputValue(e.target.value)}>
            <button onClick={handleClick}>click me</button>
            <button onClick={() => handleClickWithParam(1)}> num 01 </button>
            <button onClick={() => handleClickWithParam(2)}> num 02 </button>
        </div>
    );
}
```

### how to get input value from input tag

```javascript
import { useState } from "react";
function ParentComp() {
    // 🏷️ we are using below state to store input value.
    const [value, setValue] = useState("");
    // In below code. 
    // ⚠️ we must follow onChange syntax as shown below ⚠️ 
    // then only we will able to store our input value in state.
    // eg: onChange={(e) => setValue(e.target.value)}

    // we mostly use these kind of code. 
    // in get username and password.
    return (
        <div>
            <input
                type="text"
                placeholder="input value"
                value={value} 
                onChange={(e) => setValue(e.target.value)}
            /><br />
            <p> component has this value : {value} </p>
        </div>
    );
}

function Sample() {
    return <ParentComp />;
}

export default Sample;
```

## ⏲️ preventDefault `2nd revision`

eg: `event.preventDefault();`

The `preventDefault( )` method cancels the event if it is cancelable, meaning that the default action that belongs to the event will not occur.

For example, this can be useful when:

Clicking on a "`Submit`" button, prevent it from submitting a form

Clicking on a link, prevent the link from following the URL

## 9️⃣ Using Hooks

- Functions starting with use are called Hooks. **useState** is a built-in Hook provided by React.

- Hooks are more restrictive than other functions. You can only call Hooks at the top of your components (or other Hooks).

### Updating the screen ( states )

#### what is state in react ?

The state is where you store property values that belong to the component.

When the state changes, the component re-renders.

#### why to use useState

Often, you’ll want your component to “**remember**” some information and display it. For example, maybe you want to count the number of times a button is clicked. To do this, add state to your component.

|   ` useState `              |  explanation  | example  |
|--------------------------|---------------|----------|
|what is this ?            |  The state is where you store property values that belong to the component.             |          |
|why are we using this ?   |    Often, you’ll want your component to “**remember**” some information and display it.           |          |
|when do we use this ?     |    For example, maybe you want to count the number of times a button is clicked. To do this, add state to your component.           |          |

#### syntax

    const [ variable , setVariable ] = useState( initialValue );

#### example

    const [ count, setCount ] = useState(10);
    function handleLike() {    
            setCount(count + 1);
    }

```javascript
// using state to make like 
import { useState } from "react";

function Sample() {
    const [count, setCount] = useState(0);
    const [isLiked, setIsLiked] = useState(false);
    function handleClick() {
        if (isLiked) {
            setCount(count + 1);
        } else {
            setCount(count - 1);
        }
        setIsLiked(!isLiked);
    }
    return (
        <div className="container">
            
            <button onClick={handleClick}> like: {count} {isLiked ? "❤️" : "🤍" } </button>
        </div>
    );
}

export default Sample;
```

### rules to follow for states

- The variable which need to updated on screen should be keep as state.

**NOTE:** react follows one-way binding.

But we can achieve two-way binding like concept using events.

- **One-way** means that the binding happens in one direction.
- In this case, changes in the data automatically update the UI.
- but changes in the UI do not automatically update the data.
- That’s why it is referred to as one-way data binding.
- React achieves one-way data binding by using state and props.

- But we can achieve two way binding using events. eg: onChange

---

class components don't use hooks concept.

where as functional components supports hooks concepts.

**NOTE** Each component has its own state.

## 1️⃣0️⃣ Sharing data between components ( props )

- Props is used to share data between components

### PARENT to CHILD

- passing values down to children component using props

```jsx

function Card({ name, id }) {
    return (
        <div>
            {id} : {name}
        </div>    
    );
}

export default function Parent() {
    return (
        <ul>
            <Card id={112} name={"doremon"} />
            <Card id={123} name={"doremi"} />
        </ul>
    );
}
```

### CHILD TO PARENT

        you can pass values from a child component to a parent component in React, but since data flow in
         React is unidirectional (from parent to child), you'll need to pass a callback function from the
         parent to the child as a prop. 
        The child component can then use this callback function to send data back to the parent.

- passing values up to parent component using function ( call back function ) as props
- But mostly people will not use this. instead they will go to useContext concept.

- `<ComponentName  setCount={setCount}  handleClick={handleClick}/>`

- `function ComponentName({ setCount, handleClick })`

```javascript
import { useState } from "react";

function ChildComp({ count, setCount }) {
    // but using this function 👆
    // we are able to state value which in PARENT component
    function handleIncrBtn() {
        setCount(count + 1);
    }
    function handleDecrBtn() {
        setCount(count - 1);
    }
    return (
        <>
            <button onClick={handleIncrBtn}> incr </button>
            <button onClick={handleDecrBtn}> decr </button>
        </>
    );
}
function ParentComp() {
    const [count, setCount] = useState(0);
    return (
        <>
            <p> my count : {count} </p>
            {/*          👇 here count state is being passed PARENT to CHILD component from  */}
            <ChildComp count={count} setCount={setCount} />
            {/* We are passing our setCount function 👆 here. 
                so that I can update my count state which is in PARENT component, 
                inside CHILD component.
                
                This is literally like passing value from CHILD to PARENT component.
            */}
        </>
    );
}

function Sample() {
    return <ParentComp />;
}

export default Sample;
```

## 1️⃣1️⃣ React Dev Tools

A browser extension used to debug react application.

- we can view structure of React components and its hierarchy.

- we can watch over states and props.

## 1️⃣2️⃣ Remove React.StrictMode

- to avoid loading ☠️ twice ☠️
- If you don't want to render your component twice
- then remove it.
- this `<React.StrictMode>` will be available in `index.js`

`<React.StrictMode>` lets you find common bugs in your components early during development.

### `index.js`

```javascript
import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import App from './App';
import reportWebVitals from './reportWebVitals';

const root = ReactDOM.createRoot(document.getElementById('root'));
// here in below case. we have used. 
root.render(
  <React.StrictMode>  
    <App />
  </React.StrictMode>
);

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();

```

### 1️⃣3️⃣ Strict Mode enables the following development-only behaviors

- Your components will re-render an extra time to find bugs caused by impure rendering.

- Your components will re-run Effects an extra time to find bugs caused by missing Effect cleanup.

- Your components will be checked for usage of deprecated APIs.

## 1️⃣4️⃣ rendering

- First time React display the content in webpage by reading components.
- First time displaying content is called rendering.

## 1️⃣5️⃣ re-rendering

- On any change in `props`, `state` or `useEffect` will reload the component.
- This is called re-rendering

## 1️⃣6️⃣ re-conciliation

- The process of displaying page using virtual DOM and diff algorithm.

## all types of event handling ⏲️`2nd revision`

Here's an example of a React component that demonstrates handling the most common types of events, such as clicks, form submissions, changes, keyboard inputs, and mouse events.

### **EventHandlingExample.js**

```jsx
import React, { useState } from 'react';

const EventHandlingExample = () => {
    // State to track input field and mouse position
    const [inputValue, setInputValue] = useState('');
    const [keyPressed, setKeyPressed] = useState('');
    const [mousePosition, setMousePosition] = useState({ x: 0, y: 0 });
    const [isClicked, setIsClicked] = useState(false);

    // Handle form input changes
    const handleInputChange = (e) => {
        setInputValue(e.target.value);
    };

    // Handle form submission
    const handleSubmit = (e) => {
        e.preventDefault(); // Prevent the page from refreshing
        alert(`Form submitted with input: ${inputValue}`);
    };

    // Handle button clicks
    const handleClick = () => {
        setIsClicked(!isClicked);
        alert('Button clicked!');
    };

    // Handle keyboard key press
    const handleKeyPress = (e) => {
        setKeyPressed(e.key);
    };

    // Handle mouse move event
    const handleMouseMove = (e) => {
        setMousePosition({ x: e.clientX, y: e.clientY });
    };

    return (
        <div style={styles.container} onMouseMove={handleMouseMove}>
            <h1>React Event Handling Example</h1>

            {/* Form Submission */}
            <form onSubmit={handleSubmit} style={styles.form}>
                <label>
                    Input Field:
                    <input 
                        type="text" 
                        value={inputValue} 
                        onChange={handleInputChange}
                        onKeyDown={handleKeyPress} // Key press event
                        placeholder="Type something..."
                    />
                </label>
                <button type="submit">Submit</button>
            </form>

            {/* Button Click */}
            <button onClick={handleClick} style={styles.button}>
                {isClicked ? "Clicked!" : "Click Me"}
            </button>

            {/* Display key pressed */}
            <p>Key pressed: {keyPressed || 'None'}</p>

            {/* Display mouse position */}
            <p>Mouse position: {mousePosition.x}, {mousePosition.y}</p>
        </div>
    );
};

const styles = {
    container: {
        padding: '20px',
        textAlign: 'center',
        fontFamily: 'Arial, sans-serif',
    },
    form: {
        marginBottom: '20px',
    },
    button: {
        padding: '10px 20px',
        margin: '10px',
        fontSize: '16px',
        cursor: 'pointer',
    },
};

export default EventHandlingExample;
```

### Explanation of the Events Handled

1. **Input Change Event (`onChange`)**:
   - The input field captures the value entered by the user and updates the `inputValue` state.

2. **Form Submit Event (`onSubmit`)**:
   - When the form is submitted, it prevents the default behavior (page refresh) and shows an alert with the current input value.

3. **Button Click Event (`onClick`)**:
   - The button handles a click event and toggles the `isClicked` state, changing the button text and triggering an alert.

4. **Keyboard Key Press Event (`onKeyDown`)**:
   - Captures the key pressed in the input field and displays the key in real time.

5. **Mouse Move Event (`onMouseMove`)**:
   - Tracks the mouse position and updates the coordinates on the screen as you move the mouse within the `div`.

### How to Use

- The input field will show the key pressed and update as you type.
- The form will submit and display the input value in an alert.
- The button will change its text on click and show an alert.
- The mouse position will update dynamically as you move the mouse within the container.

This covers the basics of handling events in React!
