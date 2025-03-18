# simple routing code

`package.json`

```json
   "scripts": {
      "start": "nodemon index.js",
      "main": "node index.js",
      "test": "echo \"Error: no test specified\" && exit 1"
   }

```

`index.js`

```javascript
const app = require('./app');

const PORT = 3434;
app.listen(PORT, () => {
    console.log("my app is listening in PORT no : " + PORT);
});
```

`app.js`

```javascript
// import
const express = require("express");
const logger = require('morgan');
const bodyParser = require('body-parser');
const cors = require('cors');

const movieRouter = require("./routes/movie");

// declaration
const app = express();

// middle ware
app.use(logger("short"));
app.use(bodyParser.json());
app.use(cors());
// routing
app.use('/movie', movieRouter);

// export
module.exports = app;

```

`routes\movie.js`

```javascript
const express = require('express');

const movieRouter = express.Router();

const db = {
    movies_list: ["godzilla", "king kong"]
};

// movie routing
// CRUD : READ
movieRouter.get('/', (req, res) => {
    res.json({
        msg: 'data coming from server',
        data: db
    });
});

// CRUD : CREATE
movieRouter.post('/', (req, res) => {
    const obj = req.body;
    db.movies_list.push(obj.name);
    res.json({
        msg: 'new item added in db'
    });
});

// CRUD : UPDATE
movieRouter.put('/:id', (req, res) => {
    const idx = req.params.id;
    const obj = req.body;
    db.movies_list[idx] = obj.name;
    res.json({
        msg: 'your data has been updated'
    });
});

module.exports = movieRouter;
```
