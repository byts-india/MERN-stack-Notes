# Simple version of back end code

## Basic below project details

- A simple version of route code. 🌸 `user-routes.js` 🌸
  - 🍭 which includes just schema, model, routes.
  - 🍭 It doesn't include mongoose validation.
  - 🍭 It doesn't include try catch block.
  - 🍭 logics have been written separately.
  - 🍭 It doesn't include ?: ternary operator to efficiently handle status.
- All CRUD operation with 💪 `user-routes.js` 💪
  - ⚡ which includes mongoose validation in Schema.
  - ⚡ try catch block to handle data-base error.
  - ⚡ Efficiently handle status using ?: ternary operator.

## pre requirement

- basic theory concepts of back-end
- starting from node.js, express, mongodb, mongoose

## project setup

1. create your project folder. eg: `my-app-back-end`
2. use below commands
3. `npm init`, then press enter until `package.json` file got created.
4. `npm install nodemon --save-dev`
5. `npm install express morgan cors body-parser mongoose`
6. update your `package.json` with code given below.

```json
     "scripts": {
        "start": "nodemon index.js",
     }
```

## create and apply as shown below

### your folder structure will look as shown below

```al
📂project
│                                 // these items are kept as static files.
├──📂public                      // your images. or other items
│   ├──📂videos                  // To access this below are the links.
│   │   └──🎬 movie.mp4          // 🔗http://localhost:3434/videos/movie.mp4
│   ├──📂audios
│   │   └──🎼 favorite_song.mp3  // 🔗http://localhost:3434/videos/favorite_song.mp3
│   └──📂images
│       └──📷 background.png     // 🔗http://localhost:3434/images/background.png
│        
├──📄 like-routes.js
├──📄 user-routes.js
├──📄 app.js                 // Main application file
├──📄 index.js               // The starting file
└──📄 package.json           // Node.js package configuration
```

### `index.js`

```javascript
// 🔖 always import app from app.js
// 💀 ⚠️ don't use : const express = require('express');
const app = require('./app');

// 🔖 change the PORT no if you wish.
const PORT = 3434;
app.listen(PORT, () => {
    console.log("my app is listening in port no : " + PORT);
});
```

### `app.js`

```javascript
// 🔖 package imports
const express = require("express");
const morgan = require("morgan");
const cors = require("cors");
const bodyParser = require("body-parser");
const mongoose = require("mongoose");

const likeRouter = require("./like-routes");
const userRouter = require("./user-routes");

// 🔖 mongodb connection 
const DB_NAME = "your-db-name";   //  👈⬅️⬅️⬅️⬅️ TODO : update your data base name
const URI = "mongodb://127.0.0.1:27017/" + DB_NAME;
mongoose.connect(URI);
mongoose.connection.on("connected", () => {
    console.log(`mongodb [ DB NAME : ${DB_NAME} ] is connected successfully`);
});

// 🔖 declaration
const app = express();
// 🔖 middle ware
app.use(morgan("tiny"));
app.use(cors());
app.use(bodyParser.json());
// 🔖 to store your images, video or audio files in back-end and 
//    access it on front-end side.
// NOTE: eg: http://localhost:3434/
app.use(express.static('public'));

// 🔖 routers
// TODO: add your routers below 👇
// eg: 🧑‍💻 ▶️ app.use('/like', likeRouter);
app.use('/like', likeRouter);
app.use('/user', userRouter);

// 🔖 exports
module.exports = app;
```

### `like-routes.js`

```javascript
// ----------------------------------------------------------------------------------------------
// 🔖 :  means that should not be missed.  
// ----------------------------------------------------------------------------------------------


// 🔖 imports 
const express = require('express');
const mongoose = require('mongoose');


// ----------------------------------------------------------------------------------------------
//           YOUR MONGOOSE SCHEMA AND MODEL CODE
// ----------------------------------------------------------------------------------------------

// 🔖 Schema code
// 🤔💭 thinks to remember
//       use new keyword       Schema 'S' is capital
//                  👇         👇      
const likeSchema = new mongoose.Schema({
    count: Number,
    by: String
});
// 🔖 create model out of Schema above.
// 🤔💭 thinks to remember
// 1. mongoose.model(arg1, arg2)   👈 here arg1 is mongodb collection name
//                                 👈  here arg2 is your Schema created above. eg: likeSchema
// 2. First letter is capital
//    👇                  
const LikeModel = mongoose.model("like", likeSchema);


// ----------------------------------------------------------------------------------------------
//           YOUR ROUTER CODE
// ----------------------------------------------------------------------------------------------
// 🔖 create your router as shown below.
const likeRouter = express.Router();
// 🔖 your router goes here 👇

// ⚠️ RULES TO FOLLOW WHILE WRITING ROUTER CODE ⚠️
// 1️⃣ your arrow function should start with [ async ] 
// 2️⃣ your database model code always prefix with [ await ]
//     NOTE: Every database model code should prefix with [ await ]
//     Example:   await LikeModel.find({})
//     Example:   await LikeModel.deleteOne({})

// 🪵 below code is to update the count in document.
likeRouter.put('/', async (req, res) => {
    //    payload is just a name for meaningful code.
    //     👇 use below name. payload refers to data coming from client.
    const payload = req.body;
    // 🔖 Every data base operation will return something for sure.
    //    Make sure to check it. Eg. console.log(data);
    //    By this way you can know, what is being stored in variable 'data' 
    
    const condition = {
        by: payload.by
    };
    const newObj = {
        count: payload.count
    };
    const data = await LikeModel.updateOne(condition, newObj);
    // 🔖 Finally what to send as response.
    res.json({
        status: true,
        msg: 'update',
        data: data
    });
});

// 🪵 below code is to create new `document` in `collection`
likeRouter.post('/', async (req, res) => {
    const payload = req.body;
    const data = await LikeModel.create(payload);
    res.json({
        status: true,
        msg: 'create',
        data: data
    });
});

// 🔖 in like-route.js always export likeRouter alone.
module.exports = likeRouter;
```

### `user-routes.js`

```javascript
// 🔖 imports 
const express = require('express');
const mongoose = require('mongoose');

// ----------------------------------------------------------------------------------------------
//           YOUR MONGOOSE SCHEMA AND MODEL CODE
// ----------------------------------------------------------------------------------------------

// 🔖 Schema code  
const userSchema = new mongoose.Schema({
    username: { type: String, required: true, unique: true },
    password: { type: String, required: true }
});

// 🔖 Mongoose provides a comprehensive set of validation options
// type     : It is used to determine the Type.
// required : It will make sure, while create new data, this field is mandatory.
// unique   : it will make sure, if any new data, came, this field should be unique.

// 🔖 create model out of Schema above.
const UserModel = mongoose.model("user", userSchema);

// ----------------------------------------------------------------------------------------------
//           YOUR ROUTER CODE
// ----------------------------------------------------------------------------------------------
// ⚠️ ➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖ ⚠️
// ⚠️ RULES TO FOLLOW WHILE WRITING ROUTER CODE ⚠️
// 1️⃣ your arrow function should start with [ async ] 
// 2️⃣ your database model code always prefix with [ await ]
//     NOTE: Every database model code should prefix with [ await ]
//     Example:   await UserModel.find({})
//     Example:   await UserModel.deleteOne({})
// 3️⃣ It is mandatory to use try catch.
//     We may don't know when database will through error.
//     In all code it is better to write database code inside try catch block.
// ⚠️ ➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖ ⚠️

// 🔖 your router code goes here 👇
const userRouter = express.Router();
// 📦 CRUD : C -> CREATE
// 🪵 Below code is to create new user
//  ✨ 🤵 : SIGN-UP  ✨
userRouter.post('/sign-up', async (req, res) => {
    try {
        const payload = req.body;
        const obj = {
            username: payload.username,
            password: payload.password
        };
        const newUser = await UserModel.create(obj);
        // const newUser = await UserModel.create(payload);
        // we don't suggest passing payload directly. payload may contain any data.
        res.json({
            status: true,
            msg: 'user created successfully.',
            data: newUser
        });
    } catch (error) {
        res.json({
            status: false,
            msg: 'error',
            data: error
        });
    }
});

// -----------------------------------------------------------------------------------------------
// QUESTION  : Why can't we use GET in below case to apply SIGN-IN operation.
// ANSWER    : When implementing the SIGN-IN logic in your back-end project using 
//             NodeJS, Express, and 
//             Mongoose, the best HTTP request method to use is ✨ POST ✨. Here's why:
//    Security:  The POST method is more secure for sending sensitive information like usernames 
//               and passwords because the data is sent in the body of the request, not in
//               the URL. This helps to prevent credentials from being exposed in server logs, 
//               browser history, or network monitoring tools.
//    Semantics: According to HTTP/1.1 specification, the POST method is used for actions
//               that result in the creation of a new resource or submission of 
//               data to be processed to a specified resource. 
//               Since signing in involves sending user credentials to be processed 
//               and authenticated, POST is semantically appropriate.
// REFERENCE : https://stackoverflow.com/questions/978061/http-get-with-request-body
//             So, yes, you can send a body with GET, and no, it is never useful to do so.
// -----------------------------------------------------------------------------------------------

// 📦 CRUD : R -> READ
// 🪵 Below code is to do authentication process
//     get information if username and password is correct or wrong.
//  ✨ 🤵 : SIGN-IN  ✨
userRouter.post('/sign-in', async (req, res) => {
    try {
        const payload = req.body;
        const condition = {
            username: payload.username,
            password: payload.password
        };
        const result = await UserModel.findOne(condition);
        const status = result !== null;
        res.json({
            status: status,
            msg: status ? 'success' : 'fail',
            data: result
        });
    } catch (error) {
        res.json({
            status: false,
            msg: 'error',
            data: error
        });
    }
});

// 📦 CRUD : U -> UPDATE
// 🪵 below code for change password.
//  ✨ 🤵 : CHANGE-PASSWORD  ✨
userRouter.put('/', async (req, res) => {
    try {
        const payload = req.body;
        const condition = { 
            username: payload.username,
            password: payload.password
        };
        const newObj = { password: payload.newPassword };
        const result = await UserModel.updateOne(condition, newObj);
        /**     👆  --> desc about how you will get result in above code.
         * Below is the data format which you will get as a result
          {
            "acknowledged": true,
            "modifiedCount": 1,   👈 <--- only if this is 1, it means data is updated.
            "upsertedId": null,
            "upsertedCount": 0,
            "matchedCount": 1
          }
        */
        const status = result.modifiedCount === 1;
        res.json({
            status: status,
            msg: status ? "success" : "fail",
            data: result
        });
    } catch (error) {
        res.json({
            status: false,
            msg: 'error',
            data: error
        });
    }
});

// 📦 CRUD : D -> DELETE
// 🪵 below code is to remove account
userRouter.delete('/', async (req, res) => {
    try {
        const payload = req.body;
        const condition = {
            username: payload.username,
            password: payload.password
        };
        const result = await UserModel.deleteOne(condition);
        /**     👆  --> desc about how you will get result in above code.
         * Below is the data format which you will get as a result
            {
               "acknowledged": true,
               "deletedCount": 1
            }
        */
        const status = result.deletedCount === 1;
        res.json({
            status: status,
            msg: status ? "success" : "fail",
            data: result
        });
    } catch (error) {
        res.json({
            status: false,
            msg: 'error',
            data: error
        });
    }
});

// 🔖 in user-route.js always export userRouter alone.
module.exports = userRouter;
```
