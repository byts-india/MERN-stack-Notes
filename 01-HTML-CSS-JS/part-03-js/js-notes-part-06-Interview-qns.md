Here are **50 hard/tough JavaScript interview questions** tailored for **freshers or junior developers**, but focusing on **challenging concepts**, **edge cases**, and **tricky logic** to test strong foundational understanding.

---

### 🧠 **Core JavaScript Concepts**

1. 1. 1. What is the difference between `==` and `===` in JavaScript?
2. 1. 2. Explain how JavaScript handles **hoisting**. What gets hoisted: `var`, `let`, `const`, functions?
3. 1. 3. What is the **temporal dead zone** in JavaScript?
4. 1. 4. What are the differences between `undefined`, `null`, and `NaN`?
5. 1. 5. What is **closure**? Give an example.
6. 1. 6. What are **first-class functions** in JavaScript?
7. 1. 7. Explain the concept of **currying** in JavaScript.
8. 1. 8. What does `"use strict"` do in JavaScript?
9. 1. 9. Why is JavaScript **single-threaded**? What is the **event loop**?
10. 1. 10. How does **JavaScript garbage collection** work?

---

### 🧩 **Advanced Functions & Scope**

1. 2. 1. What is the difference between a function declaration and a function expression?
2. 2. 2. What are **arrow functions**, and how do they differ from regular functions?
3. 2. 3. What is the output of:

```js
let a = 10;
(function () {
    console.log(a);
    var a = 20;
})();
```

2. 2. 5. What is a **pure function**? Why is it important?
3. 2. 6. How does **this** behave inside arrow functions vs regular functions?
4. 2. 7. What is the purpose of **IIFE** (Immediately Invoked Function Expression)?

---

### 🕰️ **Asynchronous JavaScript**

1. 3. 1. What is the difference between **synchronous** and **asynchronous** code?
2. 3. 2. How do **promises** work? What are `.then()`, `.catch()`, and `.finally()`?
4. 3. 4. What is a **callback hell**, and how can it be avoided?
5. 3. 5. Explain the **event loop** and **microtask queue**.
6. 3. 6. What is the output?

```js
console.log('Start');
setTimeout(() => console.log('Timeout'), 0);
Promise.resolve().then(() => console.log('Promise'));
console.log('End');
```

---

### 🧾 **Objects, Arrays, and Memory**

3. 4. 3. How does **object destructuring** work?
4. 4. 4. How do you flatten nested array?
5. 4. 5. How can you remove duplicate values from an array?
7. 4. 7. What’s the difference between `map()`, `forEach()`, `filter()` and `reduce()`?

---

### 🧮 **Tricky Logical or Output-Based Questions**

1. 5. 2. What is the output of this?

```js
let x = 1;
x = x++ + ++x;
console.log(x); // ?
```

1. 5. 3. What will be logged here?

```js
const obj = {
  name: 'JS',
  getName: function () {
    return this.name;
  }
};
const get = obj.getName;
console.log(get()); // ?
```

1. 5. 4. What is the output?

```js
let obj = { a: 1 };
const obj2 = obj;
obj = { a: 2 };
console.log(obj2); // ?
```

1. 5. 5. Output of:

```js
console.log(typeof null); // ?
console.log(typeof NaN);  // ?
```

---

### 🧱 **DOM and Browser API**

=5. 6. 5. How do you check if a variable is an array or object?

---

### 🧷 **Miscellaneous & Edge Case Scenarios**

1. 7. 1. Why is `typeof NaN` equal to `'number'`?
2. 7. 2. What are the different ways to clone an object?
4. 7. 4. What are falsy values in JavaScript?

---

Would you like me to provide **answers** or **explanations** for any of the above? I can also convert them into a **PDF** or **MCQ format** if needed.
