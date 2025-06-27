# middlewares

## How to use a more than one middleware for individual routes

- You have make sure middleware is used only in r2 route.

### `method 1` : add middleware are previous arguments

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

testRouter.get("/r1", (req, res) => {
  console.log("⭐ : R1");
  res.send("from GET /r1");
});

// include middleware as below
testRouter.get("/r2", cm1, cm2, (req, res) => {
  console.log("⭐ : R2");
  res.send("from GET /r2");
});
testRouter.get("/r3", (req, res) => {
  console.log("⭐ : R3");
  res.send("from GET /r3");
});

module.exports = testRouter;
```

### `method 2` : array of middlewares

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

testRouter.get("/r1", (req, res) => {
  console.log("⭐ : R1");
  res.send("from GET /r1");
});

// include middleware as below
testRouter.get("/r2", [cm1, cm2], (req, res) => {
  console.log("⭐ : R2");
  res.send("from GET /r2");
});
testRouter.get("/r3", (req, res) => {
  console.log("⭐ : R3");
  res.send("from GET /r3");
});

module.exports = testRouter;
```

### `method 3` : using router.use()

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

testRouter.get("/r1", (req, res) => {
  console.log("⭐ : R1");
  res.send("from GET /r1");
});
testRouter.get("/r3", (req, res) => {
  console.log("⭐ : R3");
  res.send("from GET /r3");
});

// include middleware as below
testRouter.use([cm1, cm2]);

testRouter.get("/r2", (req, res) => {
  console.log("⭐ : R2");
  res.send("from GET /r2");
});

module.exports = testRouter;
```
