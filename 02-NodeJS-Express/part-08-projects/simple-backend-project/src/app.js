const express = require('express');
const morgan = require('morgan');
const userRoutes = require('./routes/user.routes');
const productRoutes = require('./routes/product.routes');
const mongoose = require("mongoose");

const app = express();

// middle ware
app.use(express.json());
app.use(morgan('combined'));
mongoose.connect("mongodb://localhost:27017/my-db")
mongoose.connection.on("connected",() => {
    console.log("mongoose connected");
})

app.use('/api/users', userRoutes);
app.use('/api/products', productRoutes);

module.exports = app;