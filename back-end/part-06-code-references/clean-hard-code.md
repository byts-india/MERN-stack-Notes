# TEMPLATE CODES

## Basic below project details

- A cleaner version of codes.
  - 🍭 which includes separate folder for
    - 📂 model
    - 📂 controller
    - 📂 routes

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
│                                 
├──📂routes
│   └──📄 song-route.js
├──📂controllers
│   └──📄 song-controller.js
├──📂models
│   └──📄 song-model.js
│
├──📄 like-routes.js
├──📄 user-routes.js
├──📄 app.js                 // Main application file
├──📄 index.js               // The starting file
└──📄 package.json           // Node.js package configuration
```

## `index.js`

```javascript
const app = require('./app');

const PORT = 3434;
app.listen(PORT, () => {
    console.log("my app is listening in port no : " + PORT);
});
```

## `app.js`

```javascript
// package imports
const express = require("express");
const morgan = require("morgan");
const cors = require("cors");
const bodyParser = require("body-parser");
const mongoose = require("mongoose");

// custom files imports
const songRouter = require("./routes/song-route");

// mongodb connection 
// TODO: enter your 👇 database name below 
const DB_NAME = "your-db-name";
const URI = "mongodb://127.0.0.1:27017/" + DB_NAME;
mongoose.connect(URI);
mongoose.connection.on("connected", () => {
    console.log("mongodb is connected successfully");
});

// declaration
const app = express();
// middle ware
app.use(morgan("tiny"));
app.use(cors());
app.use(bodyParser.json());

// routers
// TODO: add your router below 👇
app.use('/song', songRouter);


// exports
module.exports = app;
```

## `routes\song-route.js`

```javascript
const express = require('express');
const { getAllSongs, addSong, updateSong, deleteSong } = require('../controllers/song-controller');

const songRouter = express.Router();

// CRUD
// Read   - GET
songRouter.get('/', getAllSongs);
// Create - POST
songRouter.post('/', addSong);
// Update - PUT
songRouter.put('/', updateSong);
// Delete - DELETE
songRouter.delete('/:id', deleteSong);

module.exports = songRouter;

```

## `controllers\song-controller.js`

```javascript
const SongModel = require("../models/song-model");

// Add your controller logics as you wish below. 👇
//          these are mandatory      👇  👇
async function getAllSongs(req, res) {
    const songs = await SongModel.find({});
    // 💀 don't change the JSON structure below ⚠️ 
    res.json({
        status: true,
        msg: "data retrieved successfully",
        data: songs   // 👈 your data that need to send back to client 🧑‍💻
        // data: null   👈 give as shown here. if you are sending nothn
    });
}

async function addSong(req, res) {
    const payload = req.body;
    const newSong = await SongModel.create(payload);

    // 💀 don't change the JSON structure below ⚠️ 
    res.json({
        status: true,
        msg: "data added successfully",
        data: newSong   // 👈 your data that need to send back to client 🧑‍💻
        // data: null   👈 give as shown here. if you are sending nothn
    });
}

async function updateSong(req, res) {
    const payload = req.body;
    const updatedSong = await SongModel.updateOne({
        _id: payload._id
    }, payload);
    // 💀 don't change the JSON structure below ⚠️ 
    res.json({
        status: true,
        msg: "updated song successfully",
        data: updatedSong   // 👈 your data that need to send back to client 🧑‍💻
        // data: null   👈 give as shown here. if you are sending nothn
    });
}

async function deleteSong(req, res) {
    const songId = req.params.id;
    SongModel.dele
    await SongModel.deleteOne({
        _id: songId
    });
    // 💀 don't change the JSON structure below ⚠️ 
    res.json({
        status: true,
        msg: "deleted song successfully",
        data: null   // 👈 your data that need to send back to client 🧑‍💻
        // data: null   👈 give as shown here. if you are sending nothn
    });
}



module.exports = { getAllSongs, addSong, updateSong, deleteSong };
```

## `models\song-model.js`

```javascript
const mongoose = require('mongoose');

// TODO: change your Schema name 👇
const songSchema = new mongoose.Schema({
    // TODO: insert your schema below 👇
    // reference : https://github.com/AvinashKumar3000/react-mini-project/blob/master/class-board/back-end-written-notes/mongoose/mongoose-part-02.md#example
    title: String,
    artist: String,
    album: String,
    release_year: Number,
    genre: String,
    duration: String,
    writers: [String],
    producers: [String],
});

//[model-name]👇    [db collection name]👇          👇your schema here
const SongModel = mongoose.model("song", songSchema);
// export your model here 👇
module.exports = SongModel;
```
