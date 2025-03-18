
# INTERMEDIATE
---

The `??` operator in JavaScript is known as the nullish coalescing operator. It returns the right-hand operand when the left-hand operand is `null` or `undefined`. Otherwise, it returns the left-hand operand.

This is useful when you want to provide a default value for something that might be `null` or `undefined`, without accidentally overriding other falsy values like `0`, `''`, or `false`.

## Syntax

- `let result = value1 ?? value2;`
- `value1`: The left-hand operand.
- `value2`: The right-hand operand (the default value if value1 is `null` or `undefined`).

```javascript
let userName = null;
let displayName = userName ?? "Guest";
console.log(displayName); // Output: "Guest"

let count = 0;
let displayCount = count ?? 10;
console.log(displayCount); // Output: 0
```

In the first example, `userName` is `null`, so displayName gets the value `"Guest"`. In the second example, count is `0`, which is a falsy value but not `null` or `undefined`, so displayCount gets the value `0`.

---

### type of

```javascript
console.log(typeof undefined);  // "undefined"
console.log(typeof 42);          // "number"
console.log(typeof 'hello');     // "string"
console.log(typeof true);        // "boolean"
console.log(typeof {a: 1});      // "object"
console.log(typeof [1, 2, 3]);   // "object" (arrays are also objects)
console.log(typeof null);        // "object" 
console.log(typeof function(){}); // "function"
console.log(typeof Symbol());    // "symbol"
console.log(typeof BigInt(123)); // "bigint"

```
### Exception handling

basic structure

```javascript
try {
    // Code that may throw an error
} catch (error) {
    // Code to handle the error
} finally {
    // Code that will run regardless of whether an error occurred or not
}

```
- `try Block`: This block contains code that might throw an exception. If an exception occurs, the control is passed to the catch block.
- `catch Block`: This block is executed if an error occurs in the try block. It receives an error object as a parameter, which contains information about the error.
- `finally Block (Optional)`: This block contains code that will execute after the try and catch blocks, regardless of whether an error was thrown or not. It’s often used for cleanup tasks.

```javascript
try {
    let result = riskyFunction(); // This function may throw an error
    console.log(result);
} catch (error) {
    console.error("An error occurred:", error.message);
} finally {
    console.log("This will run no matter what.");
}
```

throwing custom errors

```javascript
function checkAge(age) {
    if (age < 18) {
        throw new Error("You must be at least 18 years old.");
    }
    return "Access granted.";
}

try {
    let result = checkAge(15);
    console.log(result);
} catch (error) {
    console.error("Error:", error.message);
}

```
--- 
## ?.

The ?. operator in JavaScript is known as the optional chaining operator. It allows you to safely access deeply nested properties of an object without having to check each level manually for null or undefined.

#### How It Works

- The `?.` operator short-circuits and returns `undefined` if the value before it is `null` or `undefined`. This prevents errors when trying to access properties or methods on `null` or `undefined`.

```javascript
// below 👇 are basic structure 
// object?.property;
// object?.[expression];
// object?.method?.();

let user = {
    profile: {
        name: "Alice",
    }
};

let userName = user?.profile?.name;
console.log(userName); // Output: "Alice"

let userAge = user?.profile?.age;
console.log(userAge); // Output: undefined (since 'age' doesn't exist)

let userCity = user?.address?.city;
console.log(userCity); // Output: undefined (no error even though 'address' is undefined)

//-------------------------
let users = [{ name: "Alice" }, { name: "Bob" }];

console.log(users?.[1]?.name); // Output: "Bob"
console.log(users?.[2]?.name); // Output: undefined (no third element)

// 📂 Common Use Cases
/*
- Accessing deeply nested properties in objects where some properties might be missing or `null`.
- Safely calling methods on objects that might be `null` or `undefined`.
- Accessing elements in arrays or properties in objects without worrying about whether the index or key exists.

*/

``` 
---

## clean-coding

- debugging
  - fixing bugs and errors using debugger tools.
  - eg: using google developer tools.
- comments
  - single line docs
  - multi line docs
- coding style
  - using capital case for classes
  - using camel cases for variables and function and methods
    - using upper cases for constant variables
- mostly function are declared with verb ( which says about actions )

## ES6 features

- let and const
  - var vs let
  - let vs const
- arrow functions
- object destructuring
  - The `{a,b} =` Operator
- array destructuring
  - The `[a,b] =` Operator
- ... operator [ spread, rest ]
- 'for/of' : to iterate over iterables [ string, arr, object, Map ]
- Map Object
- Set Object
- class keyword
- Promises
- Symbol
- default parameters
- function rest parameters
- class keyword

## others JS Version features

- `foreach`, `map`, `filter`, `reduce` ( 2009 )
- Exponentiation ( ** ) [ 2016 ]
- async/ await (2017)
- BigInt ( 2020 )
- optional chaining operator ?. (2020)
- _ numeric separator (2021)

### DESTRUCTURING

- In simple words. Data are stored in some structure manner. To get those data from the structure, we can call it as destructuring.

```javascript
// array destructuring
let [a,b] = [0,"hello"];
console.log(a,b); //  0 hello

let [b,a] = [25,"hello"];
console.log(a,b); // hello 25

let [a,b] = [10,20,30,40];
console.log(a,b); // 10 20

let [a,...b] = [10,20,30,40,50]; // acts as ... rest operator, which collects rest of the values
console.log(a,b); // 10 [20,30,40,50]

// ---------------------------------------------------
let items_01 = [10,20,30];
let items_02 = [40,50,60];
let arr = [ item_01 , items_02 ];
console.log(arr); // [ [ 10,20,30 ], [40,50,60] ]

// But you want to store all items in single array. then do follow below code
let items_01 = [10,20,30];
let items_02 = [40,50,60];
let arr = [ ...item_01 , ...items_02 ]; // here ... acts as spread operator.
console.log(arr); // [ 10,20,30,40,50,60 ]
// ---------------------------------------------------

```

```javascript
// object destructuring
let { name, value } = { value : 123, name: 'roshan' };
console.log(name); // roshan
console.log(value); // 123

// object destructuring
let { age, value } = { value : 123, name: 'roshan' };
console.log(age); // undefined
console.log(value); // 123

// object destructuring
let { value, age } = { value : 123, name: 'roshan' }; // here values are selected based on key
console.log(age); // undefined
console.log(value); // 123

// object destructuring
let { name, ...props } = { value : 123, name: 'roshan', age: 19, height: 100, weight: 50 };
// in above code remaining all properties are being store in variable called props.
console.log(name); // roshan
console.log(props); // {value: 123, age: 19, height: 100, weight: 50}

// object destructuring
let general_data = { name: 'roshan', value: 123 };
let physical_data = { age: 19, height: 100, weight: 50 };
let data = { general_data, physical_data };
console.log(data);
/*
{
  "general_data": {"name":"roshan","value":123},
  "physical_data": {"age":19,"height":100,"weight":50}
}
*/

// object destructuring
let general_data = { name: 'roshan', value: 123 };
let physical_data = { age: 19, height: 100, weight: 50 };
let data = { ...general_data, ...physical_data };
console.log(data);
/*
{name: 'roshan', value: 123, age: 19, height: 100, weight: 50}
*/
```
