# js for react

tutorialpoints
w3schools

<https://javascript.info/>

mozilla

## jS version

----------

- what is ECMA script
- why ES6 ?

## basics

- java vs js
- story of js
- node js vs js
- scripting langrage
- vanilla js

## introduction

- synchronous single threaded language

## javascript fundamentals

- hello world
- Document DOM
- operators
  - <https://www.w3schools.com/js/js_operators.asp>
- basic data types
  - <https://www.w3schools.com/js/js_datatypes.asp>

```javascript
// 26/07/24 
// all types of console
console.log("hello world! 1");
console.info("my info");
console.warn("my warning");
console.error("my error");
console.table([0, 1, 2, 3]);

// document object in JS
document.getElementById("college");
document.getElementsByClassName("city");
document.querySelector

// objects
cat = {
    legs: 4,
    ears: 2,
    name: 'tom'
};
// // access    .    [string] 
console.log(cat.legs); // 4
console.log(cat["name"]); // 'tom'
// // update
cat.name = "kio1";
console.log(cat.name); // kio1
cat["name"] = "kio2";
console.log(cat.name); // kio2
// add new values
cat.color = "black";
cat["age"] = 5;
console.log(`my cat who's name is ${cat.name} and its color is ${cat.color}`);
console.log(cat);

// array
let a = [1, 2, 3, 4] // creation of array
console.log(a);
console.log(a[0]); // access using index
a.push(20);
a.push(20);
console.log(a);

// nested array
a = [[1, 2], [3, 4], [5, 6]];
console.log(a[0]); // [1, 2]
console.log(a[0][0]); // 1
a = [
    { name: 'nobita', height: 120 },
    { name: 'doremon', height: 113 },
    { name: 'geon', height: 150 }
];
console.log(a[0]); // { name: 'nobita', height: 120 }
console.log(a[0].name); // nobita

// nested object
obj = {
    address: {
        vehicles: ['honda bike', 'audi car'],
        city: {
            district: 'salem',
            town: 'sankari',
            pincode: 60012
        }
    }
};
// // correct 
console.log(obj.address.vehicles); // 123
console.log(obj.address.city.district); // salem
console.log(obj.address.city.town); // sankari
console.log(obj.address.city.pincode); // 60012
console.log(obj.address.city.street); // undefined
console.log(obj.address.sity.street); // error


// semicolon is option in javascript.
// but we must keep semicolon at end of the javascript.

```

- type conversion
  - Easy way is
    - Number("234")
    - String(123)
  - Alternate way 
    - (123).toString()
    - parseInt("123")
- == and ===
- conditional and loops and switch
  - if, if else, if else ladder
  - switch
  - ?:
  - while, do while
  - for
- variables
  - var, let, const
- function
- functional expression
- arrow function
- alert, prompt, confirm
- Objects
- check for values using chaining ?.
- typeof
- Exception handling

## clean coding

- debugging
- comments
- coding style

  - arr map
  - arr filter

```javascript

// conditional
// if
a = 10;
b = 20;
if (a > b) {
    console.log("a is greater");
} else if (true) {
    console.log("b is greater");
}

// while / do while is same as java
for (i = 0; i < 5; i++) {
    console.log(i);
}
// switch is same as java

//---------------------------------------------------------

a = 10;
var a = 10;
// below cases only should be used in JS
let a = 10;
const a = 10;


if (true) {
    a = 200; // declaring without any keyword. global scope.
    var a = 300;// declaring with 'var' keyword. global scope.
    const a = 400; // declaring with 'let' keyword. block scope.
    const a = 500; // block scope
    a = 500;
    console.log("inside if block ", a);

// // //     // in const, below code will through error
// // //     // const a;
// // //     // a = 100;
// // //     // console.log(a);

// // //     // in let, below code will not through error
// // //     // let a;
// // //     // console.log(a); // undefined
// // //     // a = 100;
// // //     // console.log(a);


// // // }
// // // // console.log(a);

// // // // function definition
// // // // function call

// // // // function foo() { // function definition
// // // //     console.log("hello from function foo");
// // // // }

// // // // let res = foo(); // function call
// // // // console.log(res); // undefined

// // // // if a function not return anything,
// // // // by default it will return undefined.


// // // // function 3 types 
// // // // 1. normal function
// // // // 2. function expression
// // // // 3. arrow function

// // // // Example:
// // // function add(a, b) { // normal function
// // //     return a + b;
// // // }
// // // const add = function (a, b) { // function expression
// // //     return a + b;
// // // }
// // // const add = (a, b) => { // arrow expression
// // //     return a + b;
// // // }

// // // // Arrow function combination
// // // // usage: to write a function logic within single line
// // // // NOW convert below functions into arrow functions.
// // // function fn() {
// // //     return 100;
// // // }
// // // const fn = () => 100; // arrow function

// // // function fn(a,b) {
// // //     return a*b;
// // // }
// // // const fn = (a, b) => a * b; // arrow function
// // // const fn = (a, b) => {
// // //     return a * b; 
// // // }// arrow function


// // // function fn() {
// // //     console.log("hello world");
// // // }
// // // const fn = () => console.log("hello world"); // arrow function
// // // const fn = () => {
// // //     console.log("hello world");
// // // } // arrow function

// // // let res = fn();
// // // console.log(res); // undefined



// // // alert used to display output message
// // alert("oh my god...!!!");

// // // confirm used to get boolean value as input. true or false.
// // let result = confirm("did you had your lunch ?");
// // console.log(result);

// // // prompt used to get input from user, by default it will return string 
// // // if no input is given and ok button is clicked. it will return empty string
// // // if cancel button is clicked, it will return null.
// // let value = prompt("give me a number");
// // console.log(value);


// let obj = {
//     data: {
//         name: {
//             first: "hrithik",
//             last: "roshan"
//         }
//     }
// };
// console.log(obj?.data?.name?.last);

// javascript has first class function.

// function callBack() {
//     console.log("I will be call after some time.");
//     console.log("so my name is call back function.");
// }

let a = 100;
let b = a;
```



## REact code

```javascript
// component basic example
function List() {
  return <li>item</li>;
}

function Box() {  // component
  return (
    <ul>
      <List></List>
      <List></List>
      <List></List>
      <List></List>
    </ul>
  );
}

function App() {
  return (
    <>
      <Box></Box>
    </>
  );
}

export default App;

```


####

- optional chaining
- Destructuring
- map
- filter
- setTimeout
- setInterval

