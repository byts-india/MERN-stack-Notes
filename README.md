# Basic react concepts included in TODO project.
        
        - hooks
        	- useState    
        	- useEffect
        	- useContext
        	- useNavigate
        	- useRef
        	- createContext
        - react-router-dom
        	<BrowserRouter></BrowserRouter>
        	<HashRouter></HashRouter>
        	<Routes></Routes>
        	<Route path="/" element={}></Route>
        	<Link to=""></Link>
        	<Outlet/>
        - concepts
        	- controlled vs uncontrolled component
        	- e.preventDefault() usage.
        	- Private Route concept
        	- usage of {children} props. 

# project link is shared below 

Hi guys, 
As we discussed in class. The completed mini-project link is shared here.
http://github.com/byts-india/MERN-stack-Notes/blob/main/03-REACT/PART-03-Projects/mini-project-01.zip

Download the `.zip` file and do `npm install` and run. 
Complete your projects using this reference.


----------------------------------

## THE TEST MATERIAL

# Study Notes: JavaScript + Thymeleaf

---

# PART 1: JAVASCRIPT

## 1. Variables

Three ways to declare a variable: `var`, `let`, `const`.

| Feature | var | let | const |
|---|---|---|---|
| Scope | Function-scoped | Block-scoped | Block-scoped |
| Re-declaration | Allowed | Not allowed | Not allowed |
| Re-assignment | Allowed | Allowed | Not allowed |
| Hoisted | Yes (initialized as `undefined`) | Yes (in Temporal Dead Zone) | Yes (in Temporal Dead Zone) |

```js
var a = 10;      // function-scoped, avoid in modern JS
let b = 20;      // block-scoped, reassignable
const c = 30;    // block-scoped, cannot be reassigned
```

- `const` prevents reassignment of the variable binding, but if it holds an object/array, the contents can still be mutated.
- Prefer `const` by default, use `let` when reassignment is needed, avoid `var`.

## 2. Data Types

**Primitive types (7):** string, number, bigint, boolean, undefined, symbol, null.

**Non-primitive (reference) types:** object, array, function.

```js
typeof "hello"      // "string"
typeof 42            // "number"
typeof true           // "boolean"
typeof undefined      // "undefined"
typeof null           // "object"   <-- known JS quirk/bug
typeof {}              // "object"
typeof []               // "object"  (arrays are objects)
typeof function(){}      // "function"
```

- `null` = intentional absence of value (assigned by developer).
- `undefined` = variable declared but not yet assigned.
- Primitives are compared/copied by value; objects/arrays are compared/copied by reference.

## 3. document.getElementById

Used to select a single DOM element by its `id` attribute.

```html
<p id="msg">Hello</p>
```
```js
const el = document.getElementById("msg");
el.textContent = "Updated!";
el.style.color = "red";
```

- Returns `null` if no matching element is found — always check before using it.
- Returns a single element (not a collection), unlike `getElementsByClassName` or `querySelectorAll`.
- `querySelector("#msg")` is the modern equivalent (CSS-selector based, more flexible).

## 4. DOM (Document Object Model)

The DOM is a tree-like, in-memory representation of an HTML document. Each HTML tag becomes a "node" that JavaScript can read, add, remove, or modify.

Common DOM operations:
```js
document.getElementById("id")
document.querySelector(".class")
document.querySelectorAll("div")

el.innerHTML = "<b>Bold</b>";     // sets HTML content
el.textContent = "Plain text";     // sets text only
el.setAttribute("data-x", "1");
el.classList.add("active");
el.addEventListener("click", () => console.log("clicked"));

document.createElement("div");
parentEl.appendChild(newEl);
parentEl.removeChild(childEl);
```

- The DOM is not part of JavaScript itself — it's a Web API provided by the browser.
- Changes to the DOM trigger re-rendering (repaint/reflow) of the page.

## 5. Array Manipulation

```js
const arr = [1, 2, 3, 4, 5];

arr.push(6);           // add to end        -> [1,2,3,4,5,6]
arr.pop();              // remove from end    -> [1,2,3,4,5]
arr.unshift(0);          // add to start       -> [0,1,2,3,4,5]
arr.shift();               // remove from start  -> [1,2,3,4,5]

arr.map(x => x * 2);        // new array, transformed
arr.filter(x => x > 2);      // new array, matching condition
arr.reduce((sum, x) => sum + x, 0); // single accumulated value
arr.forEach(x => console.log(x));    // iterate, no return value

arr.slice(1, 3);   // returns a shallow copy of a portion, does NOT mutate original
arr.splice(1, 2);   // removes/inserts elements, MUTATES original

arr.includes(3);     // true/false
arr.indexOf(3);        // index or -1
arr.find(x => x > 3);    // first matching element
```

Key distinction: `map/filter/slice` return **new arrays** (non-mutating). `push/pop/splice/sort/reverse` **mutate** the original array.

## 6. Object Manipulation

```js
const user = { name: "Avi", age: 25 };

user.name;          // dot notation
user["name"];        // bracket notation (needed for dynamic keys)

user.city = "Chennai";       // add property
delete user.age;               // remove property

Object.keys(user);       // ["name", "city"]
Object.values(user);       // ["Avi", "Chennai"]
Object.entries(user);        // [["name","Avi"], ["city","Chennai"]]

const updated = { ...user, age: 26 };  // spread: creates a new object (immutable update pattern)

Object.assign({}, user, { age: 26 });   // alternative to spread
```

## 7. Function Basics

```js
// Function declaration - hoisted fully, callable before definition
function add(a, b) {
  return a + b;
}

// Function expression - not hoisted the same way
const subtract = function (a, b) {
  return a - b;
};

// Arrow function - shorter syntax, no own `this`
const multiply = (a, b) => a * b;

// Default parameters
function greet(name = "Guest") {
  return `Hello, ${name}`;
}

// Rest parameters
function sum(...nums) {
  return nums.reduce((a, b) => a + b, 0);
}
```

- Arrow functions do not bind their own `this` — they inherit `this` from the enclosing scope. Avoid them as object methods when `this` needs to refer to the object.
- Functions are first-class citizens in JS — they can be assigned to variables, passed as arguments, and returned from other functions.

## 8. Hoisting, JS Engine, Browser Engine

**Hoisting:** JavaScript moves variable and function *declarations* to the top of their scope during the compile phase (before execution).

```js
console.log(x);   // undefined (not an error)
var x = 5;

console.log(y);   // ReferenceError (Temporal Dead Zone)
let y = 10;

greet();            // works fine — function declarations are fully hoisted
function greet() { console.log("hi"); }
```

**JS Engine:** A program that parses and executes JavaScript code.
- Examples: V8 (Chrome, Node.js), SpiderMonkey (Firefox), JavaScriptCore (Safari).
- Typical pipeline: Parsing -> AST (Abstract Syntax Tree) -> Bytecode/Compilation (JIT) -> Execution.
- Uses a **Call Stack** (tracks function execution) and **Memory Heap** (stores objects).

**Browser Engine (Rendering Engine):** Separate from the JS engine — responsible for parsing HTML/CSS and painting pixels on screen.
- Examples: Blink (Chrome), Gecko (Firefox), WebKit (Safari).
- The browser also provides the **Event Loop**, **Web APIs** (DOM, setTimeout, fetch), and **Callback/Task Queues** that let JS handle asynchronous operations even though the JS engine itself is single-threaded.

Quick mental model:
```
JS Engine (executes JS) + Web APIs (DOM, timers, network)
        + Event Loop (coordinates async callbacks back into the call stack)
        = Browser Runtime Environment
```

---

# PART 2: THYMELEAF

Thymeleaf is a server-side Java template engine used with Spring Boot to render dynamic HTML. It works on "natural templates" — valid HTML files that also render correctly when opened directly in a browser.

## 1. Setup

```xml
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-thymeleaf</artifactId>
</dependency>
```

Templates go in `src/main/resources/templates/`, and are returned as view names from controllers (no `.html` extension needed in the return string).

```html
<html xmlns:th="http://www.thymeleaf.org">
```

## 2. Core Attributes

| Attribute | Purpose |
|---|---|
| `th:text` | Sets the text content of an element |
| `th:value` | Sets the `value` attribute of an input |
| `th:href` / `th:src` | Sets link/resource URLs, resolves context path |
| `th:if` / `th:unless` | Conditional rendering |
| `th:each` | Loop over a collection |
| `th:object` | Binds a form to a backing model object |
| `th:field` | Binds an individual input to a property of `th:object` |
| `th:action` | Sets the form submission URL |

```html
<p th:text="${message}">Placeholder</p>

<a th:href="@{/home}">Home</a>

<div th:if="${user != null}">Welcome, <span th:text="${user.name}"></span></div>

<ul>
  <li th:each="item : ${items}" th:text="${item.name}"></li>
</ul>
```

- `${...}` = variable expression (reads from the Model).
- `@{...}` = URL expression (context-path aware, used for links/actions).
- `*{...}` = selection expression (used inside `th:object`, refers to a property of the bound object).

## 3. Login Form Example (End-to-End)

**Controller:**
```java
@Controller
public class LoginController {

    @GetMapping("/login")
    public String showLoginForm(Model model) {
        model.addAttribute("loginRequest", new LoginRequest());
        return "login";       // resolves to templates/login.html
    }

    @PostMapping("/login")
    public String processLogin(@ModelAttribute("loginRequest") LoginRequest loginRequest,
                                 BindingResult result,
                                 Model model) {
        if (result.hasErrors()) {
            return "login";   // re-render form with validation errors
        }
        // authenticate user...
        boolean success = authService.authenticate(loginRequest);
        if (!success) {
            model.addAttribute("error", "Invalid username or password");
            return "login";
        }
        return "redirect:/dashboard";   // Post/Redirect/Get pattern
    }
}
```

**Model class:**
```java
public class LoginRequest {
    private String username;
    private String password;
    // getters and setters
}
```

**Template (login.html):**
```html
<form th:action="@{/login}" th:object="${loginRequest}" method="post">

    <label>Username:</label>
    <input type="text" th:field="*{username}" />
    <span th:if="${#fields.hasErrors('username')}" th:errors="*{username}"></span>

    <label>Password:</label>
    <input type="password" th:field="*{password}" />
    <span th:if="${#fields.hasErrors('password')}" th:errors="*{password}"></span>

    <p th:if="${error}" th:text="${error}" style="color:red;"></p>

    <button type="submit">Login</button>
</form>
```

## 4. Key Points to Remember

- Login forms should always use `method="post"` — credentials must not appear in the URL (as they would with GET).
- `th:object` must match the name used in `@ModelAttribute` / `model.addAttribute(...)` on the controller side.
- `th:field="*{property}"` automatically generates the correct `id`, `name`, and `value` attributes for the input, wired to the object's property.
- After a successful POST, use `return "redirect:/dashboard"` (Post/Redirect/Get) instead of directly returning a view name — this prevents duplicate submissions if the user refreshes the page.
- Use `#fields.hasErrors('propertyName')` combined with `th:errors` to show field-specific validation messages driven by `BindingResult`.
- `th:action="@{/login}"` ensures the URL is correctly built relative to the app's context path, instead of hardcoding it.

---

**End of notes.**
