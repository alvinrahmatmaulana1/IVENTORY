'use strict'
const express = require('express')
const laporan_masuk = require('../controllers/laporan-masuk-controllers')
const {verifyToken, adminOnly} = require('../middleware/verify')
const router = express.Router()

router.get(`/api/v1/laporan_masuks`,verifyToken, adminOnly, laporan_masuk.index)
// router.post(`/api/v1/transaksi_masuks`, transaksi_masuks.store)
// router.get(`/api/v1/transaksi_masuks/:id`, transaksi_masuks.show)
// router.put(`/api/v1/transaksi_masuks/:id`, transaksi_masuks.update)
// router.delete(`/api/v1/notifikasis/:id`,verifyToken, adminOnly, notifikasis.destroy)

module.exports = router