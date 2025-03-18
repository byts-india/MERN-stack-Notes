const express = require("express");
const mongoose = require('mongoose');

const gymUserSchema = new mongoose.Schema({
    username: { type: String, required: true, unique: true },
    password: { type: String, required: true },
    count: { type: Number, default: 0 }
});

const GymUserModel = mongoose.model('gymUser', gymUserSchema)
// first we will design our model with schema

const userRouter = express.Router();

userRouter.get('/:id', async (req, res) => {
    try {
        const userId = req.params.id;
        const result = await GymUserModel.findById(userId);
        const status = result !== null;
        res.json({
            status: status,
            msg: status ? 'data got successful' : "authentication failed",
            data: {
                count: result.count
            }
        });
    } catch (error) {
        res.json({
            status: false,
            msg: 'something went wrong',
            data: error
        });
    }
});
// sign-in
userRouter.post('/sign-in', async (req, res) => {
    try {
        const payload = req.body;
        const condition = {
            username: payload.username,
            password: payload.password
        };
        const result = await GymUserModel.findOne(condition);
        // if result is null, then that username and password doesn't match
        const status = result !== null;
        res.json({
            status: status,
            msg: status ? 'authentication successful' : "authentication failed",
            data: result // we might need it existing count value.
        });
    } catch (error) {
        res.json({
            status: false,
            msg: 'authentication failed',
            data: error
        });
    }
});
// sign-up
userRouter.post('/sign-up', async (req, res) => {
    try {
        const payload = req.body;
        const condition = {
            username: payload.username,
            password: payload.password
        };
        const result = await GymUserModel.create(condition);
        res.json({
            status: true,
            msg: 'user created successful',
            data: result // we might need it existing count value.
        });
    } catch (error) {
        res.json({
            status: false,
            msg: 'authentication failed',
            data: error
        });
    }
});
// update count
userRouter.put('/update-count', async (req, res) => {
    try {
        const payload = req.body;
        const userId = payload._id;
        const toUpdate = {
            count: payload.count
        };
        const result = await GymUserModel.findByIdAndUpdate(userId, toUpdate);
        res.json({
            status: true,
            msg: 'operation success',
            data: result
        });
    } catch (error) {
        res.json({
            status: false,
            msg: 'something went wrong',
            data: error
        });
    }
})

// using * to handle wild card routing.
userRouter.all("*", (req, res) => {
    res.status(404).send("page not found");
});

module.exports = userRouter;