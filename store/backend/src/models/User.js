const { Schema, model } = require('mongoose')

const userSchema = new Schema({
    firstname: {
        type: String,
        required: true
    },
    lastname: String,
    avatar: String
}, {
    timestamps: true
});

module.exports = model('User', userSchema)