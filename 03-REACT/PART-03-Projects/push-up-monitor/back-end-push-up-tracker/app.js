const bodyParser = require('body-parser');
const express = require('express');
const cors = require('cors');
const morgan = require('morgan');
const userRouter = require('./user-router');
const mongoose = require("mongoose");

// connection code for mongodb.
const USERNAME = "your-username";  // 👈 keep your db username taken from mongodb cloud.
const PASSWORD = "your-password"; // 👈 keep your db password taken from mongodb cloud.
const DB_NAME = "your-db-name";
// change below URL according you our  mongodb cloud.
const URL = `mongodb+srv://${USERNAME}:${PASSWORD}@samplecluster.g2aijmc.mongodb.net/${DB_NAME}`; // get this cloud mongodb. so that we can host.
/**
 * ------------------------------------------------------------
 * 
 *            ☠️    DON't FORGET TO READ BELOW LINE   ☠️
 * 
 * ------------------------------------------------------------
 * 
 * 
 *  Things you want to change in above ⚠️ URL ⚠️ 
 *  👉 @samplecluster.g2aijmc.mongodb.net/ 👈 this will be changing for each and every user.
 *      Make sure to change this.
 */

mongoose.connect(URL);
mongoose.connection.on('connected', () => {
    console.log("mongodb is connected.");
});

const app = express();
// middle ware
app.use(morgan("tiny"));
app.use(cors());
app.use(bodyParser.json());

// routes
app.use('/gym', userRouter);
app.all('/', (req, res) => {
    res.send("application is working fine.");
})
module.exports = app;