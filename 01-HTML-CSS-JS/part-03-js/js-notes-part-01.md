# JAVASCRIPT BASICS

<!-- 

|   ` TOPIC `              |  explanation  | example  |
|--------------------------|---------------|----------|
|what is this ?            |               |          |
|why are we using this ?   |               |          |
|when do we use this ?     |               |          | 

-->

## Learning

0. tutorialpoints
1. w3schools
2. <https://javascript.info/>
3. (MDN) mozillaJavascript

## Browser Engine

|   `BROWSER ENGINE`       |  explanation  |
|--------------------------|---------------|
|what is this ?            |  **layout engine** or **rendering engine**, is a `core` component of ***web browsers***.             |

    engine : browser
    -----------------------
    Blink  : google
    Gecko  : firefox
    WebKit : Apple safari

## JavaScript Engine

|   ` JS Engine `          |  explanation  |
|--------------------------|---------------|
|what is this ?            | responsible to run javascript in browser.              |

- V8    - chrome
- Spider Monkey - Firefox
- Chakra    - Edge

## JS is Dynamic type language

- We can't mention what datatype during declaration.
- JS will decide datatype on go.

```javascript
    let value = 100; 
    console.log(typeof value); // number
    value = "hello world!";
    console.log(typeof value); // string
```

## JS

- Initially developed for `dynamic web pages`
- Add interactivity to webpage.
- Programs are called scripts
- JS is `both interpreter and compiled` language.
  - `Interpreter` line by line execution.
    - interpreted languages :
      - python
      - go lang
      - R lang
  - `Compiled` not line by line execution.
    - c, c++
    - C#
- `First Class Function`:
  - **Treating** function as **normal variable** is called first class function.
- `Higher-order-functions`:
  - **passing function as arguments** and **receiving function from another** function is called higher order function.

## single threaded

| `THREAD`|SINGLE THREAD| MULTI THREAD  |
|---------|---------|---------|
|Explanation   | there is only `one execution thread` for a process or program.        |      `multiple threads` of execution `run concurrently` within the same process or program.   |
|Example  |   person can write `one exam` with `only one hand`       |  `eg` writing exam in `both right` and `left hand` at a same time.    |

## sync vs async

|  |sync   |async  |
|---------|---------|---------|
| example     | completing the `physics assignment first` then `writing chemistry assignment`         | writing `half of the physics assignment` and then `started writing chemistry assignment`. once chemistry assignment completed. `coming back to physics assignment` and completed the remaining         |

### multi-paradigm

- below are paradigm supported by javascript
- ***object oriented programming*** - real time object based programming
- ***functional programming*** - lambda calculus based programming
- ***imperative programming*** - simple imperative statement like code.

### JS version

JS versions are as follows, ES6, ES7... etc

- where ES means, ES - ECMA script
- **ECMA :** European Computer Manufacturers Association
- why ES6 is so important ?
  - Major modern js concepts are introduced.
  - E - ECMA
  - S - Script
  - 6 - version 6

|   ` ES6 `              |  explanation  | example  |
|--------------------------|---------------|----------|
|what is this ?            | javascript version              |   ES2, ES4 and other versions     |
|why are we using this ?   |  resolve older version issues             | `var` **don't have block** scope. now in `ES6` `let` and `const` introduced with **block scope**.          |
|when do we use this ?     |   to make our code more meaning full and clean.            | we use destructuring and `map,filter,reduce` concept to avoid long lines of code.          |

# basics

- java vs js : no similarities
- js - created only to run in browser
- node js - is a software used to run JS in operating system.
- js is scripting language
- vanilla js : writing code using pure js.
- js is a `synchronous` `single threaded language`

## Javascript Can and Can't

- `can't` do any cpu related task
- `can` deal with browser.

## javascript fundamentals

- where to write
  - `01` : in separate script file. eg: file.js
      - eg:  `<script src="./file.js"></script>`
  - `02` : inside `<script></script>` tag
- Mostly Include javascript at the end of document
  - because, first html body elements should load first.
- output
  - `console.log()`
  - hello world eg code
    - syntax: `console.log("Hello World!");`
- comments
  - single -> `// my single line comment. `
  - multiple -> `/* multi line comment. */`
- statements
  - a line of code can be called as statements

```javascript
   console.log("hello world");
   console.log(100 + 200);
    // single line comment
    /*
        multi
        line
        comment
    */    
```

|   ` COMMENTS `              |  explanation  | example  |
|--------------------------|---------------|----------|
|what is this ?            |   this helps to documentation our code.            |     above eg     |
|why are we using this ?   |     sometimes to make our code non executable.           | above eg         |
|when do we use this ?     |      for documentation          | above eg         |

    NOTE ⚠️: always use semicolon at end of statement

|   ` ; SEMICOLON `              |  explanation  | example  |
|--------------------------|---------------|----------|
|what is this ?            |  is a token. which has its purpose to terminate statement.             |  `let a = 12;`        |
|why are we using this ?   |used to mention that particular statement is ended. |          |
|when do we use this ?     | it is optional. But to avoid bugs. we use semicolon.              |          |

    In JavaScript, "keywords" and "tokens" are related concepts, but they refer to different things.
    
    Keywords: 
        Keywords are reserved words in JavaScript that have special meaning and are part of the 
        language syntax. These words cannot be used as identifiers ( such as variable names 
        or function names) because they are already predefined in the language. 
        Examples of keywords in JavaScript include 
        var, let, const, function, if, else, for, 
        while, return, break, continue, etc.
    
    Tokens: 
        Tokens are the smallest individual units of a program written in a programming language. 
        In JavaScript, tokens can include keywords, identifiers, literals, operators, 
        and punctuation symbols. So, semicolons (;), parentheses (()), curly braces ({}), 
        and other symbols are considered tokens. Tokens are the building blocks of JavaScript 
        code and are used to form expressions, statements, and other syntactic structures.

variable declaration

```javascript
    a = 100; // we can directly declare and assign without any keyword.
    var b;  // declaring a variable b
    let a;  // declaring a variable a
    const PI = 3.14; // declaring a variable PI and assigning 3.14 value
```

## `var` keyword

|   `var` keyword              |  explanation  | example  |
|--------------------------|---------------|----------|
|what is this ?            |  used to declare variable. if don't mention any keyword like `var,let,const`. by default it act as var is given.              |     below     `eg-01`     |
|why are we using this ?   |   in modern JS no one suggest using var keyword. because of it `default behavior of global scope`.            |          |
|when do we use this ?     |  same as above             |          |

```javascript
// Example: eg-01

    if(true) {
      var a = 123; // var keyword used to declaration
    }
    console.log(a); 
    // will give output as 123
```

## declaring `without` any keyword

```javascript
// Example: eg-01

    if(true) {
      a = 123; // no keyword used to declaration
    }
    console.log(a); 
    // will give output as 123
    // because, if no keyword mentioned. then it is using var keyword.
```

## common table

|                           |var      |let      |const     |
|---------------------------|---------|---------|----------|
|Stored in Global Scope     |  ✅     |   ❌   |  ❌     |
|Function Scope             |    ✅   |  ✅    | ✅      |
|Block Scope                |    ❌   |   ✅   |    ✅   |
|Can Be Reassigned?         |    ✅   |    ✅  |    ❌   |
|Can Be Redeclare ?         |  ✅     |   ❌   |   ❌    |
|Can Be hoisted             |   ✅    |    ❌  |    ❌   |

---

|   ` assingment operators = `              |  explanation  | example  |
|--------------------------|---------------|----------|
|what is this ?            | is an operator.              | let a = 100;         |
|why are we using this ?   | used to assign value to variable.              | let a = [ 1,2 ]         |
|when do we use this ?     | But actually used to reference.              | let obj = { a: 12, b: 234 }         |

assignment used to referencing variable can be found in below link

![source](https://dmitripavlutin.com/static/21075d0959751add1730239d141bbe87/78c87/references-2.png)

- operators
  - `=` Assignment Operators `used to assign value to variable.`
  - Arithmetic Operators
    - `[ can be used as short hand operator ]` `+` Addition
    - `[ can be used as short hand operator ]` `-` Subtraction
    - `-`   unary minus
    - `+`   unary plus
    - `[ can be used as short hand operator ]` `*` Multiplication
    - `[ can be used as short hand operator ]` `/` Division ( front slash )
    - `[ can be used as short hand operator ]` `%` Modulus (Division Remainder)
    - `[ can be used as short hand operator ]` `**` Exponentiation (ES2016)
    - `++` Increment `pre Increment` and `post Increment`
    - `--` Decrement `pre Increment` and `post Increment`
  - Comparison Operators : always return boolean type.
    - `==` equal to
    - `===` equal value and equal type
    - `!=` not equal
    - `!==` not equal value or not equal type
    - `>` greater than
    - `<` less than
    - `>=` greater than or equal to
    - `<=` less than or equal to
  - Logical Operators : **mostly its operands are comparison operators**
    - `[ can be used as short hand operator ]` `&&` logical and
    - `[ can be used as short hand operator ]` `||` logical or
    - `[ can be used as short hand operator ]` `!`  logical not
  - Bitwise Operators
    - This is to deal with binary values.
    - `[ can be used as short hand operator ]` `&` AND
    - `[ can be used as short hand operator ]` `|` OR
    - `~` NOT
    - `[ can be used as short hand operator ]` `^` XOR
    - `[ can be used as short hand operator ]` `<<` left shift
    - `[ can be used as short hand operator ]` `>>` right shift
    - `[ can be used as short hand operator ]` `>>>` unsigned right shift
  - Ternary Operators
    - `?:`
      - syntax: `var res = expression ? truth result : failure result;`
  - Type Operators
    - `typeof` eg: `console.log( typeof 100 )`
    - `instanceof`
      - used when dealing with classes and objects

```javascript
// instanceof 
class Animal { }
let tiger = new Animal();
console.log( tiger instanceof Animal); // true
```

```javascript
// ternary operator example
var a = 10;
var b = 20;
var res = (a > b) ? "good boy" : "bad boy";
```

In above code, res is stored with "bad boy"

## String Operators ( + )

- when using + with strings. It will join two strings.
- Adding strings and Numbers
- example:

```javascript
      console.log( 10 + 10 + "100" ); // 20100
      console.log( "100" + 10 + 10 ); // 1001010
```

TOPICS

- `DOM` - Document Object Model
- used to 
```javascript
        const element = document.getElementById('root');
        const elements = document.getElementsByClassName('btn');
```

---

## BASIC DATA TYPES

OFFICIAL DOCUMENTATION 👇

<https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures>

`primitive data type`

- `String`
  - `single quotes` : used to so that I can include double quotes
  - `double quotes` : used to so that I can include single quotes
  - `back tick` : to include both single and double quotes. <https://www.w3schools.com/js/js_string_templates.asp>
  - string methods : <https://w3schools.com/js/js_string_methods.asp>

```javascript
let values = `
You can store a string in multi line using
a back tick.
`;

console.log(`And also you can use javascript expression ${ 1 + 23 } within this.`);
// This back tick string is also called as template string.

// Another example is as shown below
let a = 10;
let b = 20;
let value = `the sum of a : ${a} and b : ${b} is ${a+b}`;
console.log(value); // the sum of a : 10 and b : 20 is 30
```

- `Number` : <https://www.w3schools.com/js/js_number_methods.asp>
- Bigint
- `Boolean` : <https://www.w3schools.com/js/js_booleans.asp>
- `undefined` : by default if a variable is declared by not defined. it will be assigned with `undefined`.
- `Symbol`
- `null` : is a type object.
`Object` : reference <https://www.w3schools.com/js/js_objects.asp>

|   ` OBJECT `              |  explanation  | example  |
|--------------------------|---------------|----------|
|what is this ?            |    is a javascript datatype           |          |
|why are we using this ?   |     used to store data like realtime object          |          |
|when do we use this ?     |    to store values in `key:value` format           |          |

object reference
<https://www.w3schools.com/js/js_objects.asp>

---
`Non primitive type`

`An array` : methods reference <https://www.w3schools.com/js/js_array_methods.asp>

|   ` ARRAY `              |  explanation  | example  |
|--------------------------|---------------|----------|
|what is this ?            |  is one of JS data types              |          |
|why are we using this ?   |  to store multiple values of same or diff data types            |          |
|when do we use this ?     |  like in `react`, we used to store list of movie details             |          |

Other data types:

- Date : <https://www.w3schools.com/js/js_dates.asp>

```javascript

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
```

---

## Operators and Operands

- Operators :
  - Each operators has different no of operands
  - eg;  `++` use 1 operands eg: `a++`
  - use 2 operands eg: `a*b`
- Type Conversion :
  - used to convert from one datatype to another
  - eg: number to string
    - `.toString()`
  - eg: string to number
    - `parseInt()`

```javascript
// conversion using class
console.log( Number("123") ); // 123
console.log( Number("123.43") ); // 123.43
console.log( Number("123.34") ); // 123.34
console.log( String(123.34) ); // '123.
console.log( String(123) );  // '123'
console.log( String(12e2) ); // '1200'
Boolean(123); // true
```

```javascript
parseInt(2133.123); // 2133
parseFloat("12.21"); // 12.21
(234.2342342).toPrecision(7); // '234.2342'
(213).toString(); // '123'
```

### == vs === double equal vs triple equal

- `==` and `===`
- `==` used for compare values
- `===` used for compare its data types and values

---

### console.log variations

```javascript
// all types of console
console.log("hello world! 1");
console.info("my info");
console.warn("my warning");
console.error("my error");
console.table([0, 1, 2, 3]);
```

## control flow statements

|   ` if `                 |  explanation  | example  |
|--------------------------|---------------|----------|
|what is this ?            | is a keyword  |          |
|why are we using this ?   | to execute a code based on condition|          |
|when do we use this ?     | to execute a code if condition is true |          |

```javascript
    var x = 10;
    
    if (x > 5) {
        console.log("x is greater than 5");
    }
```

|   `if else`              |  explanation  | example  |
|--------------------------|---------------|----------|
|what is this ?            | `if` and `else` is a keyword |          |
|why are we using this ?   | to execute on 2 state either condition is true or false.             |          |
|when do we use this ?     | as mentioned above               |          |

```javascript
    var x = 3;
    
    if (x > 5) {
        console.log("x is greater than 5");
    } else {
        console.log("x is not greater than 5");
    }
```

|   `nested if`            |  explanation  | example  |
|--------------------------|---------------|----------|
|what is this ?            |  using `if` inside another `if`, or inside `else` |          |
|why are we using this ?   |  some times you have apply multiple condition. once after another.             |          |
|when do we use this ?     | same as above              |          |

```javascript
    var x = 10;
    var y = 5;
    
    if (x > 5) {
        if (y > 2) {
            console.log("Both x and y are greater than their respective thresholds");
        }
    }
```

|   `if else ladder`       |  explanation  | example  |
|--------------------------|---------------|----------|
|what is this ?            | writing code continuously like  `else if( true )` |          |
|why are we using this ?   |               |          |
|when do we use this ?     |               |          |

```javascript
    var score = 75;
    
    if ( score >= 90 ) {
        console.log("Grade: A");
    } else if (score >= 80) {
        console.log("Grade: B");
    } else if (score >= 70) {
        console.log("Grade: C");
    } else if (score >= 60) {
        console.log("Grade: D");
    } else {
        console.log("Grade: F");
    }
```

        In this example, we have a variable score representing a student's exam score. We're using an if-else ladder to determine the grade based on the score:
        
        If the score is 90 or higher, the student gets an "A" grade.
        If the score is between 80 and 89, the student gets a "B" grade.
        If the score is between 70 and 79, the student gets a "C" grade.
        If the score is between 60 and 69, the student gets a "D" grade.
        If the score is below 60, the student gets an "F" grade.
        The if-else ladder structure ensures that only one condition is evaluated and executed based on the score. If the score meets the condition in one of the if or else if blocks, the corresponding grade is logged, and the rest of the ladder is skipped. If none of the conditions are met, the final else block logs a failing grade.

|   `switch`               |  explanation  | example  |
|--------------------------|---------------|----------|
|what is this ?            | Is a alternate solution to if else ladder |          |
|why are we using this ?   | to handle diff cases  ladder              |          |
|when do we use this ?     | like to switch tab in `React`             |          |

```javascript

let day = 3;
let dayName;

switch (day) {
    case 1:
        dayName = "Monday";
        break;
    case 2:
        dayName = "Tuesday";
        break;
    case 3:
        dayName = "Wednesday";
        break;
    case 4:
        dayName = "Thursday";
        break;
    case 5:
        dayName = "Friday";
        break;
    case 6:
        dayName = "Saturday";
        break;
    case 7:
        dayName = "Sunday";
        break;
    default:
        dayName = "Invalid day";
}

console.log("Today is " + dayName);
```

### loops

for in, for of

- With the introduction of **ES6** (ECMAScript 2015), functional programming features such as `map, filter, and reduce` have become more prevalent in JavaScript code bases, especially for working with arrays and collections. These methods provide a more concise and expressive way to perform common operations on arrays, compared to traditional loops like `for...of` and `for...in`.

|   ` for vs while `       |  for                       | while                 |
|--------------------------|------------------------------|--------------------------|
|what is this ?            |          is a keyword                     |  is a keyword          |
|why are we using this ?   |   The for loop is typically used when you know in advance how many times you want to iterate over a block of code.            |     The while loop is used when you want to execute a block of code repeatedly as long as a specified condition is true.      |

|   ` while vs do while `       |  while                       | do while                 |
|--------------------------|------------------------------|--------------------------|
|what is this ?            |          is called as entry check loop |  is called as exit check loop          |
|why are we using this ?   |   to check condition at entry point.            |     to check condition at exit point      |
|when do we use this ?     |   run loop only after executing the condition.            |     to execute a code at least once before checking the condition      |

### `break`

    The break statement is used to immediately terminate the execution of a loop when a certain condition is met. It exits the loop entirely, regardless of the loop's condition.

```javascript
// Example:
for (let i = 0; i < 10; i++) {
    if (i === 5) {
        break; // exit the loop when i equals 5
    }
    console.log(i);
}
// Output: 0, 1, 2, 3, 4
```

    In this example, the loop stops executing as soon as i becomes 5, and the remaining iterations are skipped.

## `continue`

The continue statement is used to skip the current iteration of a loop and proceed to the next iteration. It doesn't exit the loop entirely but rather jumps to the next iteration.

```javascript

// Example:
for (let i = 0; i < 5; i++) {
    if (i === 2) {
        continue; // skip iteration when i equals 2
    }
    console.log(i);
}
// Output: 0, 1, 3, 4
```

    In this example, when i equals 2, the continue statement is encountered, causing the loop to skip the current iteration and move to the next one.

---

      NOTE : break and continue will only works under loops and switch
---

## FUNCTIONS

    don't forget to cover below topics
    - arguments vs parameters
    - passing function as arguments
    - return a function from a

```javascript
function 

```

### Normal Function Declaration

    A normal function declaration defines a function using the function keyword followed by a name and a function body.

    Normal functions are hoisted, meaning they can be called before they are declared in the code.

```javascript
// Example:
function fn(a,b,c) {
  // the above is function definition
  // the values a,b,c is parameters
  console.log(a,b,c);
}

fn()  // undefined undefined undefined
fn(1) // 1 undefined undefined
fn(1,2) // 1 2 undefined
fn(1,2,3) // 1 2 3 
fn(1,2,3,4) // 1 2 3
// the above values 1,2,3,4 are the arguments
```

```javascript
function fn(a,b,c=12) {
  console.log(a,b,c);
}

fn()  // undefined undefined 12
fn(1) // 1  undefined 12
fn(1,2) // 1 2 12
fn(1,2,3) // 1 2 3
fn(1,2,3,4) // 1 2 3
```

```javascript
function fn(a,b=10,...c) {
    // here ... triple dot used to represent rest parameter.
    console.log(a,b,c);
}

fn()  // undefined 10 []
fn(1) // 1 10 []
fn(1,2) // 1 2 []
fn(1,2,3) // 1 2 [ 3 ]
fn(1,2,3,4) // 1 2 [ 3, 4 ]
```

```javascript
function fn(a,b=10,...c) {
  // the above is function definition
  // the values a,b,c is parameters

  console.log(a,b,c);
}

fn(...[1,2,3]); // 1 2 [3]
fn(...[1,2,3,3,4,55]); // 1 2 [ 3, 3, 4, 55 ]
```

---

### Function Expression

    A function expression defines a function as part of an expression. It can be assigned to a variable or passed as an argument to another function.

```javascript
// Example:
const multiply = function(a, b) {
    return a * b;
};
```

    Function expressions are not hoisted, so they cannot be called before they are defined
---

### Arrow Function (Introduced in ES6)

    Arrow functions provide a concise syntax for defining functions. They use the => syntax and have implicit return.

```javascript

// Example:
const square = (x) => x * x;
```

```javascript
// different combination of javascript arrow function
const fn = () => 100; // () bracket is mandatory when you don't have any parameter
const fn = x => x*10; // () bracket is optional when you have only one parameter
const fn = (x) => x*10;
const fn = (a,b) => a+b;

// In all above case you can write with curly braces {} as shown below
const fn = (a,b) => {
    return a+b; // but if you are using {} then 
    // you have give return keyword to return something.
}

// Very exceptional case / rare case 
const fn = () => {}; // you might be wondering it will return a empty object.
fn(); // but above code will return undefined.
// 🙄 that's because, In javascript {} curly braces has 2 work.
//    One to enclose function logics. The other one to create object.
// Here in above case. It used to enclose function logic.

// if you want to return empty object 
// then write below code.
const fn = () => { 
    return {};
}
fn(); // return {} empty object.
```

### `CONCEPTS IN FUNCTIONS`

- anonymous function
  - A function without name is called `anonymous function`

```javascript
function fn() {
    return 100;
}
console.log(fn); // ƒ fn() { return 100; }

console.log(function () { return 100; }); // fn () { return 100; }
//  in last example. this is anonymous function.
// A function is directly passed to console.log 
// Hence you will get a output as function without any name.
```

---

some function used to display and get user input data in javascript

- alert
- prompt
- confirm

## In JavaScript, variable declaration rules govern how variables can be declared, named, and used within a program. Here are the key rules for declaring variables in JavaScript

### Variable Declaration Keywords

- Variables are declared using the var, let, or const keywords.
- var was historically used for variable declaration in JavaScript, but let and const were introduced in ES6 (ECMAScript 2015) and are preferred in modern JavaScript development.

### Naming Rules

- Variable names must begin with a letter (a to z or A to Z), an underscore (_), or a dollar sign ($).
- Subsequent characters can be letters, digits (0 to 9), underscores, or dollar signs.
- Variable names are case-sensitive (myVar, MyVar, and MYVAR are distinct variables).
- Certain words are reserved as keywords and cannot be used as variable names (e.g., if, while, function, etc.).

### Reserved Keywords

- JavaScript has a set of reserved keywords that cannot be used as variable names. These keywords are used for language constructs like control flow (if, else, while, for, etc.), function declaration (function), and others.

### Scope

- Variables declared with var have function scope. They are visible throughout the entire function in which they are declared.
- Variables declared with let and const have block scope. They are visible only within the block ({}) in which they are declared.

## Re-declaration

- Variables declared with var can be re-declared within the same scope without generating an error.
- Variables declared with let and const cannot be re-declared within the same scope. Attempting to do so results in a SyntaxError.
- Following these rules ensures that variables are declared and used correctly in JavaScript programs, helping to avoid errors and maintain code readability and consistency.

## ES6 features

You can find list of items introduced in ES6 in this link <https://www.w3schools.com/js/js_es6.asp>

- *where below are some important concepts that you need to know*
- let
- const
- arrow functions
- default parameters
- function rest parameters
- ... operator [ rest, spread ]
- destructuring

most the above topics would have been already covered. And some will be covered in next part.
