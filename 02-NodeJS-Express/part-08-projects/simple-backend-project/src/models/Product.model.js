const mongoose = require('mongoose');

// filepath: e:\sample-backend\src\models\Product.model.js

const ProductSchema = mongoose.Schema({
    name: { type: String, required: true },
    description: { type: String, required: true },
    price: { type: Number, required: true },
    category: { type: String, required: true },
    inStock: { type: Boolean, default: true },
    userId: { type: mongoose.Schema.Types.ObjectId, ref: 'User', required: true },
    createdAt: { type: Date, default: Date.now }
});

const ProductModel = mongoose.model('Product', ProductSchema);

module.exports = ProductModel;