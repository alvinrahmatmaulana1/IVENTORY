'use strict'
const express = require('express')
const laporan_keluar = require('../controllers/laporan-keluar-controllers')
const {verifyToken, adminOnly} = require('../middleware/verify')
const router = express.Router()

router.get(`/api/v1/laporan_keluars`,verifyToken, adminOnly, laporan_keluar.index)
// router.post(`/api/v1/transaksi_masuks`, transaksi_masuks.store)
// router.get(`/api/v1/transaksi_masuks/:id`, transaksi_masuks.show)
// router.put(`/api/v1/transaksi_masuks/:id`, transaksi_masuks.update)
// router.delete(`/api/v1/notifikasis/:id`,verifyToken, adminOnly, notifikasis.destroy)

module.exports = router