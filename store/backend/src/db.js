const mongoose = require('mongoose')


const uri = 'mongodb://localhost/mongodbflutter';
const db = mongoose.connection;

function connect() {
    mongoose.connect(uri, {
        useUnifiedTopology: true,
        useNewUrlParser: true,
    }).catch(err => console.log(err));

    db.once('open', _ => {
        console.log("DB is connected", uri)
    })

    db.on('error', err => {
        console.log(err)
    })
}

module.exports = { connect }