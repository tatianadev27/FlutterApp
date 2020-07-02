const app = require('./app')
const { connect } = require('./db')

app.get('/', (req, res) => {
    res.json({
        message: "Hello world"
    })
})

async function main() {
    connect()

    await app.listen(4000)
    console.log("Server on port 4000")
}

main();