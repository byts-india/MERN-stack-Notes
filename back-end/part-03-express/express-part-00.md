# PROJECT setup

## steps

1. create a project folder `back-end-project`.
1. open your vscode inside above folder.
1. `npm init` command
1. Then just press enter till command gets completed.
1. `package.json` file will be created.

add code `"start": "nodemon index.js",` as shown in `package.json`.

```javascript
"scripts": {
    "start": "nodemon index.js",
    "test": "echo \"Error: no test specified\" && exit 1"
  },
```

### commands to install packages

- install nodemon as dev dependencies
  - command: `npm install nodemon --save-dev`
- install other packages as dependencies
  - command: `npm install express cors morgan body-parser`

---

follow below steps

- create a file `index.js` and write below sample code.

```javascript
// all import
const express = require("express");

// declaration
const app = express();
const PORT = 3344;

// listening server
app.listen(PORT, () => {
    console.log("my app is listening... " + PORT);
})

```
