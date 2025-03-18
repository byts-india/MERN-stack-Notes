# Simple FILE server with EXPRESS JS

📄 `index.js`

```javascript
// all import statements
const app = require("./app");

// can mention any port number 👇. 
// But should not mention any reserved PORT numbers like 80: which is used for HTTP
// refer link given in 📝 NOTES for more.
const PORT = 3434; 

app.listen(PORT, () => {
    // This is just a simple code 
    // to display information that server is running on following PORT number
    console.log(`app is listening in port : [ ${PORT} ]...`);
});

```

NOTES:

- Follow this link to see all default ports. <https://docs.oracle.com/en/storage/tape-storage/sl4000/slklg/default-port-numbers.html>

---

📄 `app.js`

```javascript
// all dependency import statements
const express = require('express');
const logger = require('morgan');
const bodyParser = require('body-parser');
const cors = require('cors');

const sampleRouter = require('./routes/sample');

// all important assignments
const app = express();

// middle-ware
app.use(bodyParser.json());
app.use(logger('dev'));
app.use(cors());

// routes
app.use('/sample', sampleRouter);

// export statements
module.exports = app;
```

📄 `routes\sample.js`

```javascript
const express = require('express');

const sampleRouter = express.Router();

// A sample db 
const db = {
    data: [
        { name: 'avinash', rollNo: 124 },
        { name: 'rohith', rollNo: 124 },
        { name: 'gowtham', rollNo: 124 },
    ]
}

// routes
sampleRouter.get('/', (req, res) => {
    res.status(200);
    res.json({
        data: db.data
    });
});

sampleRouter.get('/:id', (req, res) => {
    // req
    const idx = req.params.id;
    // console.log(typeof req.params.id);
    const user = db.data[idx];
    // res
    res.status(200);
    res.json({
        data: user
    });
});

sampleRouter.post('/', (req, res) => {
    const newUser = req.body;
    db.data.push(newUser);
    res.status(200);
    res.send({
        status: 'success'
    });
});


module.exports = sampleRouter;
```

NOTES:

- Follow this link to see all default ports. <https://docs.oracle.com/en/storage/tape-storage/sl4000/slklg/default-port-numbers.html>

packages used for this application and its usage

- `morgan`
  - HTTP request logger middleware for node.js
  - <https://www.npmjs.com/package/morgan>
- `cors`
  - CORS is a node.js package for providing a Connect/Express middleware that can be used to enable CORS with various options.
  - <https://www.npmjs.com/package/cors>
  - <https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS/Errors>
  - <https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS/Errors/CORSDisabled>
- `body-parser`
  - Node.js body parsing middleware.
  - Parse incoming request bodies in a middleware before your handlers, available under the req.body property.
  - <https://www.npmjs.com/package/body-parser>

Where to search for this packages

- <https://npmjs.com/>
