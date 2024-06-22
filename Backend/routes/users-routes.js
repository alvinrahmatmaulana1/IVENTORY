'use strict'
const express = require('express')
const users = require('../controllers/users-controller')
const { verifyToken, adminOnly } = require('../middleware/verify')
const router = express.Router()

router.get(`/api/v1/user`,verifyToken,adminOnly, users.index)
router.post(`/api/v1/user`,verifyToken,adminOnly, users.createUsers)
router.get(`/api/v1/user/:id`,verifyToken,adminOnly, users.show)
router.put(`/api/v1/user/:id`,verifyToken,adminOnly, users.updateUsersById)
router.delete(`/api/v1/user/:id`, verifyToken,adminOnly,users.destroy)

module.exports = router