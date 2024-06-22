'use strict'
const express = require('express')
const transaksi_keluars = require('../controllers/transaksi-keluars-controller')
const {verifyToken} = require('../middleware/verify')
const router = express.Router()

router.get(`/api/v1/transaksi_keluars`,verifyToken, transaksi_keluars.index)
router.post(`/api/v1/transaksi_keluars`,verifyToken, transaksi_keluars.store)
router.get(`/api/v1/transaksi_keluars/:id`,verifyToken, transaksi_keluars.show)
// router.put(`/api/v1/transaksi_masuks/:id`, transaksi_masuks.update)
// router.delete(`/api/v1/transaksi_masuks/:id`, transaksi_masuks.destroy)

module.exports = router