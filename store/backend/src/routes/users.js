const { Router } = require('express');
const router = Router();
const faker = require('faker');
const User = require('../models/User');

router.get('/api/users', async (req, res) => {
    const users = await User.find();
    res.json({users});
})

router.get('/api/users/create', async (req, res) => {
    for (let index = 1; index < 6; index++) {
        await User.create({
            "firstname": faker.name.firstName(),
            "lastname": faker.name.lastName(),
            "avatar": faker.image.avatar(),
        });
    }
    res.json("user created");
})

module.exports = router