# middlewares

## How to use a more than one middleware for all routes

### method 1 : using testRouter.use() method

```javascript
const express = require("express");

const testRouter = express.Router();

// common middleware 1
const cm1 = (req, res, next) => {
  console.log("🤍 : CM1 ");
  next();
};

// common middleware 2
const cm2 = (req, res, next) => {
  console.log("🤍 : CM2 ");
  next();
};

testRouter.use(cm1); // using both middleware using .use method
testRouter.use(cm2);

testRouter.get("/r1", (req, res) => {
  console.log("⭐ : R1");
  res.send("from GET /r1");
});
testRouter.get("/r3", (req, res) => {
  console.log("⭐ : R3");
  res.send("from GET /r3");
});
testRouter.get("/r2", (req, res) => {
  console.log("⭐ : R2");
  res.send("from GET /r2");
});

module.exports = testRouter;
```

### `method 2` : using testRouter.use() with array of middlewares \

```javascript
const express = require("express");

const testRouter = express.Router();

// common middleware 1
const cm1 = (req, res, next) => {
  console.log("🤍 : CM1 ");
  next();
};

// common middleware 2
const cm2 = (req, res, next) => {
  console.log("🤍 : CM2 ");
  next();
};

testRouter.use([cm1,cm2]);

testRouter.get("/r1", (req, res) => {
  console.log("⭐ : R1");
  res.send("from GET /r1");
});
testRouter.get("/r3", (req, res) => {
  console.log("⭐ : R3");
  res.send("from GET /r3");
});
testRouter.get("/r2", (req, res) => {
  console.log("⭐ : R2");
  res.send("from GET /r2");
});

module.exports = testRouter;
```
