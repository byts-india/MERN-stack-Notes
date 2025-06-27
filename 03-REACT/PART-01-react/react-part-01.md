# REACT NOTES

- [React official documentation](https://react.dev/learn)
- [Study react all concepts in Typescript.](https://youtube.com/watch?v=SqcY0GlETPk&t=17s)
- [Beginner REACT in udemy](https://www.udemy.com/course/react-tutorial/)
- [learn react with good projects for your placements.](https://www.youtube.com/watch?v=XuFDcZABiDQ&list=PLillGF-RfqbY3c2r0htQyVbDJJoBFE6Rb)
- [Very clear, deep JS concepts. Full advance level](https://www.youtube.com/watch?v=pN6jk0uUrD8&list=PLlasXeu85E9cQ32gLCvAvr9vNaUccPVNP)
- [Doing big complete project in MERN stack.](https://www.youtube.com/watch?v=R_OERlafbmw&list=PL-J2q3Ga50oMQa1JdSJxYoZELwOJAXExP)

- [Free express node js (BACK END) ](https://www.udemy.com/course/expressjs-mastery/)
- [complete MERN stack](https://www.youtube.com/watch?v=Vi9bxu-M-ag&list=PLDzeHZWIZsTo0wSBcg4-NMIbC0L8evLrD)
- [learn git for begineers.](https://www.youtube.com/watch?v=vwj89i2FmG0)
- [telusko youtube chanel link. All in one](https://www.youtube.com/@Telusko/playlists)
- [host a webpage in github pages.](https://www.youtube.com/watch?v=BT4WzyT2g8k)
- [Do react portifolio](https://www.youtube.com/watch?v=hYv6BM2fWd8&list=PLd0qRSEDFQI7DgB5BKHQrryFlR02n1bK-)
- [Do portifolio with only HTML, CSS and Vanilla JS.](https://www.youtube.com/watch?v=sF0vW0GgL3U&list=PL07efmqYWHZ_rVeQ1ws0ER9eL6cxo-d5V)

    prerequisite:
        - download and install node js in your computer.
        - Need VScode.

## 🏷️  STEPS TO CREATE REACT PROJECT using `create-react-app`

1. open any folder 📁
2. open command prompt 💻 within the folder
3. use following command
 `npx create-react-app my-app`.
   In above example my-app is your application name.
4. If above command is not working. Then follow below steps:
 `npm i create-react-app -g`
 then again repeat the previous command. like given here 👉
 `npx create-react-app my-app`

### Steps to run react project

- Within VS-Code open terminal. by using any of given steps.
     1. `view > terminal`
- Give command `npm install` if you have to install the packages.
- Give command `npm start`, to run the react project.
- Then your project will be started. If not wait for few minutes.

---

### FAQ while running your REACT project

If you face any issue while running your project. check below points.

1. Make sure, your changes have been saved properly.
2. Check your spellings.
    - eg: ✅ className  | ❌ classname
    - eg: ✅ onClick  | ❌ onclick
3. Stop your running project by using `ctrl + C` within in terminal. Again start react project using `npm start`.
4. But still not working properly. Then close your VS-Code project and open it again. It will work.

#### below is the folder structure

---
       📂 node_modules       👈 Important packages to run REACT will be here.
       📂 public
        | 
        `--- 🗒️ index.html   👈 Don't change anything here, untill it is neccessary.
        `---  other files.
       📂 src
        | 
        `--- 🗒️ App.js       👈 Your main application starting code will be here. Like we have main function in other languages.
        `--- 🗒️ App.css      👈 Your main application css codes will be here.
       
---

## 🏷️ STEPS TO CREATE REACT PROJECT using `VITE`

1. open any folder 📁
2. open command prompt 💻 within the folder
3. use following command
 `npm create vite@latest my-app`.
   In above example my-app is your application name.
4. If above command is asking your permission to install vite for first time. Press `y` to proceed.
5. Then choose, 'react' framework and 'Javascript' as language.

### Steps to run VITE+ react project

- Within VS-Code open terminal. by using any of given steps.
     1. `view > terminal`
- Give command `npm install` if you have to install the packages.
- Give command `npm run dev`, to run the react project.
- Then your project will be started. If not wait for few minutes.

---

### FAQ while running your vite+REACT project

If you face any issue while running your project. check below points.

1. Make sure, your changes have been saved properly.
2. Check your spellings.

        - eg: ✅ className  | ❌ classname
        - eg: ✅ onClick    | ❌ onclick

1. Stop your running project by using `ctrl + C` within in terminal. Again start react project using `npm run dev`.
1. But still not working properly. Then close your VS-Code project and open it again. It will work.

#### folder structure in vite+react

---
       📂 node_modules       👈 Important packages to run REACT will be here.
       📂 public
        | 
        `--- 🗒️ index.html   👈 Don't change anything here, untill it is neccessary.
        `---  other files.
       📂 src
        | 
        `--- 🗒️ App.jsx      👈 Your main application starting code will be here. Like we have main function in other languages.
        `--- 🗒️ App.css      👈 Your main application css codes will be here.
        `--- 🗒️ Main.jsx      👈 Your Don't touch this code. We will go here, only when we have to deal with `<StrictMode>`
       
---

## Node JS

- To use React in production, you need npm which is included with Node.js.
- npx ( **N**ode **P**ackage e**X**ecute ):
  - Execute package without any prior installing of packages.
- npm ( **N**ode **P**ackage **M**anager ):
  - Use to manage, install and remove packages for Node JS.

## React

- React is a `JavaScript` library for building user interfaces.
- Created by Facebook / Meta.
- React is used to build `single-page` applications.
- React is a tool for building UI components.
- **NOTE:** React follows a component based architecture.

---

## React coding started

### Remove few things

- If you want to start with new start. where you don't want to include any already created styles then do as follows. 🗑️ Remove all content inside `App.css` and `index.css` file. Don't remove the file. only remove the content.
- Then remember always The `App.jsx` is the first component which will execute in react.
- So remove all code and you can as fresh.
- Below is sample starting code.

```javascript
export default function App() {
    return (
        <>
            <p>Hello world!</p>
        </>    
    );
}
```

### opening src/App.js

- Usually in react a file which save as `.js` or `.jsx` both will be valid by react.
- But it is preferred to write `.jsx`.
- In react when javascript files are saved as below extension.
Following properties are enabled.

 1. `.js`  => emmet abbreviation shortcuts won't work.
 2. `.jsx` => emmet abbreviation shortcuts will work.

---

## ⭐ ALL topics in react ⭐

## React History

**version 16** has major changes
Current React latest version **18**

## React Docs

legacy : <https://legacy.reactjs.org/>  
modern : <https://react.dev/>

## How React works ?

- Here All our component jsx files are converted to pure js files.
This file is named as bundle.js file. and included in `<head>` tag.
- Mainly all our Components are loaded inside `<div id="root">`

## 0️⃣ JSX in React

JSX vs JS
`HTML -> XML -> XHTML  -> JS -> JSX`

### HTML

  used to create webpage using markups.

### XML

used to store values in HTML format
and it follows rules.

RULES:

- always tag name should be **smaller**.
- always if there is **open tag** then **close tag** should be there.
- **self close tag** must be closed `<br/>`

      <address>
      <city>coimbatore</city>
      <pincode>641007</pincode>
      <city>chennai</city>
      <pincode>6000009</pincode>
      </address>

### XHTML

- A normal HTML page which follow XML rules.
  
### xml vs xhtml

- **XML :** Can create our own tag name.
- **XHMTL :** Cannot create our own tag name.

`JSX -> JS XML`

- IN REACT WE CAN CREATE COMPONENTS INSIDE BOTH .js and .jsx file.
- BECAUSE React consider .js as .jsx file only.

- In react we can have html tags within javascript file.
- In pure JS or vanilla javascript we cannot have html tags within javascript file. It will through error.

---

## Other Front end frameworks or libraries

1. Angular
2. Vue JS
3. Svelte

## TO check if node js is installed

1. open command prompt
2. check below commands are working

`node --version`
`npm --version`
`npx --version`

---

## 1️⃣ COMPONENTS

- In react a function is a component only if It has Name start with Capital letter.
- React components are JavaScript functions **that return markup**
- React apps are made out of components.
- A component is a piece of the UI (user interface)
 that has its own **logic and appearance**.
- A component can be as small as a button,
  or as large as an entire page.

## 2️⃣ diff between components and other tags

- `<SampleComp>` Components has names start with Capital letters
- `<p></p>` Always in small letters

## 3️⃣ VIRTUAL DOM

[react virtual dom reference](https://legacy.reactjs.org/docs/faq-internals.html)

*React creates a VIRTUAL DOM in memory.*
*Instead of manipulating the browser's DOM directly, React creates a virtual DOM in memory, where it does all the necessary manipulating, before making the changes in the browser DOM.*

- If there is any change to be kept in output, then first it will update in virtual DOM.
- Then it will compare VIRTUAL DOM with real browser DOM.
- Then, React only changes Real DOM what needs to be changed.
- Manipulating DOM is slow, but manipulating Virtual DOM is fast as nothing gets drawn on the screen. So each time there is a change in the state of our application, the virtual DOM gets updated first instead of the real DOM.

---

- very very important
- **NOTE:**
- JSX follows new rules to write HTML and CSS codes.
- **eg:**
- **HTML example:**
- `<div class="container"></div>`
- **JSX example:**
- `<div className="container"></div>`

**NOTE:** we use className because in JS already a keyword named **class** is used by javascript.

### 4️⃣ Rules to create JSX Files

- File name must be started with Capital letter
- Must have one function with same name as File name
- apply `export default`  on above function.
- That component is default component

```javascript
// Counter.jsx 👈 file name.
import { useState } from 'react';
export default function Counter() {
    const [count, setCount] = useState(0);
    return (
        <div>
            <button>count : {count}</button>
        </div>
    );
}
```

## 5️⃣ Expressions in JSX

use curly braces {}
 eg: `<p> I love { 1000 * 3} </p>`

## Inserting a single Line of code

if single line, there is not need of brackets ()

```javascript
// App.jsx
export default function App() {
    return <button>click me</button>;
    // in above you we are not using (), as it has only one tag.
} 
```

## 6️⃣ Inserting a Large Line of HTML

You need enclose with `( )`

```javascript
// App.jsx
export default function App() {
    return (
        <form>
            <input type="text" />
            <button type="submit">submit</button>
        </form>
    );
    // in above you we are using (), as it has many tags.
} 
```

## 7️⃣ One Top Level Element

- Must have one parent element.
- **NOTE:** JSX will throw an error if the HTML is not correct, or if the HTML misses a parent element.
- The HTML code must be wrapped in ONE top level element or we can use `<></>`
- you can use a "fragment" to wrap multiple lines.
- [NOTE]: JSX will throw an error if the HTML is not properly closed.

```javascript
export default function App() {
    return (
        <button> add </button>
        <button> delete </button>
    );
}
// The above code will through error, becz no parent tag there to enclose its children tags.

// in this case we can use Fragments as shown below.
export default function App() {
    return (
        <>
            <button> add </button>
            <button> delete </button>
        </>    
    );
}
```

---

## 2 types of components in REACT 🕔 `2nd revision`

### class components ( old )

- uses javascript class to create components
- is a state-full component
- it is state-full because by default all class components has state.

### function components ( new )

- uses javascript function to create components.
- is a stateless component.
- because by default function component don't have state. we will include using `useState()` hooks.
- we will achieve all class component features in functional component using hooks.

---
