'use strict'
const express = require('express')
const notifikasis = require('../controllers/notifikasis-controllers')
const {verifyToken, adminOnly} = require('../middleware/verify')
const router = express.Router()

router.get(`/api/v1/notifikasis`,verifyToken, adminOnly, notifikasis.index)
// router.post(`/api/v1/transaksi_masuks`, transaksi_masuks.store)
// router.get(`/api/v1/transaksi_masuks/:id`, transaksi_masuks.show)
// router.put(`/api/v1/transaksi_masuks/:id`, transaksi_masuks.update)
router.delete(`/api/v1/notifikasis/:id`,verifyToken, adminOnly, notifikasis.destroy)

module.exports = router