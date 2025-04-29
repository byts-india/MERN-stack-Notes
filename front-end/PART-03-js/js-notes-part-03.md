# advance

## map / filter / reduce / for each `table`


|  |fn returns  |   callback arg | callback return type |
|---------|---------|---------|----------|
|map        | arr of same len     |val,idx,arr| any type |
|filter     | arr of same or less len  |val,idx,arr| boolean type |
|reduce    | single output (no array)  |prev,curr| any type | 
|foreach   | nothing gets returned | val,idx,arr | any type |


## TOPICS

- Event Loop in JS ? <https://www.youtube.com/watch?v=eiC58R16hb8&t=56s>
- Exponent operator (**) => used to do power operations eg; `let res = 2**3;`
- Hoisting <https://www.youtube.com/watch?v=Fnlnw8uY6jo>
  - the working of JS for declaration of variables and function before executing.
- closures <https://www.youtube.com/watch?v=qikxEIxsXco>
  - A functional programming concept where a function scoped inner function can remember its accessible scope variables even outside the function.
- trailing commas eg: [1,2,,,]
  - stores empty values
- optional chaining ?.
  - used to avoid errors
- import, export
  - to share functions or variable etc to other files.
[fetch]=> used to fetch data from api
[axios]=> used to get data from api

## additional

- callback

```javascript
function greet(name, callback) {
  console.log(`Hello, ${name}!`);
  callback(); // Execute the callback
}

function sayGoodbye() {
  console.log('Goodbye!');
}

greet('Alice', sayGoodbye);
// Output:
// Hello, Alice!
// Goodbye!
```

- synchronous callback
  - Executes immediately in sequence.
- asynchronous callback
  - Executes after some asynchronous operation completes.

- nested callback & callback hell

```Javascript
setTimeout(() => {
  console.log("1 executed");
  setTimeout(() => {
    console.log("2 executed");
    setTimeout(() => {
      console.log("3 executed");
    },1000);
  },1000);
},1000);
```

- Promise

```Javascript
function delay(ms, message) {
  return new Promise((resolve) => {
    setTimeout(() => {
      console.log(message);
      resolve();
    }, ms);
  });
}

delay(1000, "1 executed")
  .then(() => delay(1000, "2 executed"))
  .then(() => delay(1000, "3 executed"))
  .catch(err => console.error(err));
```

- async await

```Javascript
function delay(ms, message) {
  return new Promise((resolve) => {
    setTimeout(() => {
      console.log(message);
      resolve();
    }, ms);
  });
}

async function executeTasks() {
  try {
    await delay(1000, "1 executed");
    await delay(1000, "2 executed");
    await delay(1000, "3 executed");
  } catch (err) {
    console.error(err);
  }
}

executeTasks();
```


