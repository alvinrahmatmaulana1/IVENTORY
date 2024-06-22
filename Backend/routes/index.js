'use strict'
const express = require('express')
const router = express()
const products = require('./products-routes')
const auth = require('./auth-routes')
const transaksi_masuks =require('./transaksi-masuk-routes')
const transaksi_keluars = require('./transaksi-keluar-routes')
const users = require('./users-routes')
const notifikasis = require('./notofikasis-routes')
const laporan_masuk = require('./laporan-masuk-routes')
const laporan_keluar = require('./laporan-keluar-routes')
router.get(`/api/v1/`, (_req, res) => {
  res.json({
    "message": "Welcome to restfullapi"
  })
})
router.use(products),
router.use(auth),
router.use(transaksi_masuks),
router.use(transaksi_keluars),
router.use(users),
router.use(notifikasis),
router.use(laporan_masuk),
router.use(laporan_keluar)

module.exports = router