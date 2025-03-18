const mongoose = require('mongoose');

const UserSchema = mongoose.Schema({
    username: {  type: String, require: true, unique: true    },
    dept: { type: String, require: true }
});

const UserModel = mongoose.model('User',UserSchema);

module.exports = UserModel;