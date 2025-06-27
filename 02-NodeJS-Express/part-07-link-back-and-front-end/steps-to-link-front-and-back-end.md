# steps to follow to link `BACK-END` `nodeJS` with `FRONT-END` `react`

## pre requisite

- basic HTTP methods and its usage.
  - GET
  - POST
  - PUT
  - DELETE

## FOR EACH HTTP METHODS, details are given as below

For this example I have consider user-router.js as example.

- which includes below routes
  - post: `http://localhost:3434/user/sign-up`
  - post: `http://localhost:3434/user/sign-in`
  - put: `http://localhost:3434/user/`
  - delete: `http://localhost:3434/user/`

## STEPS TO FOLLOW

### `STEP 01: make your response as javascript object if needed.`

- First copy the fetch code from postman.
- Paste it in react code, where ever you want.
- change `response.text()` to `response.json()`
  - we will if we want our result to be in Javascript object. not as string.
- `(result) => console.log(result)` we will convert this code to like as shown below.

```javascript
// BEFORE CHANGE 😥
fetch("http://localhost:3434/user/", requestOptions)
  .then((response) => response.text())     // 👈 FIRST CHANGE 
  .then((result) => console.log(result))   // 👈 SECOND CHANGE 
  .catch((error) => console.error(error));

// AFTER CHANGE  😍
fetch("http://localhost:3434/user/", requestOptions)
  .then((response) => response.json())     // 👈 FIRST CHANGE : text() to json()
  .then((result) => {    // 👈 SECOND CHANGE
    // get your result store in any state or you can do anything.
    setUserId(result._id);                   
  }).catch((error) => console.error(error));
```

### `STEP 02: If you want to send any data as payload, then you have to pass it.`

```javascript
const myHeaders = new Headers();
myHeaders.append("Content-Type", "application/json");

// ------------------------------------------------
// BEFORE CHANGE 😥
const raw = JSON.stringify({
  "username": "abc",
  "password": "abc"
});

// AFTER CHANGE  😍
const raw = JSON.stringify({
  "username": username,   // 👈 this is coming from username state
  "password": password    // 👈 this is coming from password state
});
// ------------------------------------------------

const requestOptions = {
  method: "POST",
  headers: myHeaders,
  body: raw,
  redirect: "follow"
};

fetch("http://localhost:3434/user/sign-up", requestOptions)
  .then((response) => response.text())
  .then((result) => console.log(result))
  .catch((error) => console.error(error));
```
