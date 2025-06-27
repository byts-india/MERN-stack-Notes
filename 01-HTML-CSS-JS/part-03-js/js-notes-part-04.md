# Advance js topics

## function currying

Currying is used in JavaScript to break down complex function calls into smaller, more manageable steps.

```javascript
// Regular function
function add(a, b, c) {
  return a + b + c;
}

// Curried version
function curriedAdd(a) {
  return function(b) {
    return function(c) {
      return a + b + c;
    };
  };
}

console.log(add(1, 2, 3));       // 6
console.log(curriedAdd(1)(2)(3)); // 6
```

```javascript
function multiply(a) {
  return function(b) {
    return a * b;
  };
}

const multipleof2 = multiply(2);
const multipleof3 = multiply(3);

console.log(multipleof2(5)); // 10
console.log(multipleof2(6)); // 12
console.log(multipleof3(5)); // 15
console.log(multipleof3(10)); // 30
```

- execute following operation `sum(2)(3)(4)()` ans should be 9.

```javascript   
function sum(x) {
    let total = x;
    function update(y) {
        if(y !== undefined)
        {
            total += y;
            return update;
        }  
        return total;
    }
    return update;
}
const result = sum(2)(3)(4)(5)();
console.log(result); // 14
```
