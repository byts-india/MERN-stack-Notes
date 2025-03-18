# steps to hosting

## back end hosting

### `.gitignore`

```md
/node_modules
```

### index.js

```javascript
const app = require("./app");

const PORT = 3434;
app.listen(PORT, () => {
    console.log("app listening..." + PORT);
});
```

### `app.js`

```javascript
const express = require('express');
const cors = require('cors');
const morgan = require('morgan');
const bodyParser = require('body-parser');

const app = express();
app.use(morgan('tiny'));
app.use(cors());
app.use(bodyParser.json());

// router.
app.get('/movie',(req,res) => {
    res.send("movies from server...");
})

module.exports = app;
```

### `vercel.json`

```json
{
    "version":2,
    "builds":[
        {
            "src":"./index.js",
            "use":"@vercel/node"
        }
    ],
    "routes":[
        {
            "src":"/(.*)",
            "dest":"/"
        }
    ]
}
```

## FRONT END

```javascript
import './App.css';
import { useEffect, useState } from 'react';

function App() {
  const [value, setValue] = useState(""); 
  useEffect(()=> {
    const requestOptions = {
      method: "GET",
      redirect: "follow"
    };
    
    fetch("https://adsfa-mu.vercel.app/", requestOptions)
      .then((response) => response.text())
      .then((result) => {
        setValue(result);
      })
      .catch((error) => console.error(error));
  },[]);
  return (
    <div className="App">
      <header className="App-header">
        my name is avinash
        <p>
          { value }
        </p>
      </header>
    </div>
  );
}

export default App;

```
