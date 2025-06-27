# middlewares

- Middleware in Express.js refers to functions that execute during the request-response cycle

## How to use a single middleware for all routes

- method 1 : using testRouter.use() method

```javascript
const express = require('express');

const testRouter = express.Router();

// consider mFunc is the middleware function
const mFunc = (req, res, next) => {
    console.log('Inside Middleware',data);
    next(); // Calling next handler
};

testRouter.use(mFunc);

testRouter.get('/r1', (req, res) => {
    console.log('⭐ : R1');
    res.send('from GET /r1');
});
testRouter.get('/r3', (req, res) => {
    console.log('⭐ : R3');
    res.send('from GET /r3');
});
testRouter.get('/r2',(req, res) => {
    console.log('⭐ : R2');
    res.send('from GET /r2');
});

module.exports = testRouter;
```
