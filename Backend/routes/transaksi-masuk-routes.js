'use strict'
const express = require('express')
const transaksi_masuks = require('../controllers/transaksi-masuks-conterollers')
const {verifyToken} = require('../middleware/verify')
const router = express.Router()

router.get(`/api/v1/transaksi_masuks`,verifyToken, transaksi_masuks.index)
router.post(`/api/v1/transaksi_masuks`,verifyToken, transaksi_masuks.store)
router.get(`/api/v1/transaksi_masuks/:id`,verifyToken, transaksi_masuks.show)
router.put(`/api/v1/transaksi_masuks/:id`,verifyToken, transaksi_masuks.update)
router.delete(`/api/v1/transaksi_masuks/:id`,verifyToken, transaksi_masuks.destroy)

module.exports = router