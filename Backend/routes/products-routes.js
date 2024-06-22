'use strict'
const express = require('express')
const products = require('../controllers/products-controllers')
const { verifyToken, adminOnly } = require('../middleware/verify')
const router = express.Router()

router.get(`/api/v1/products`,verifyToken, products.index)
router.post(`/api/v1/products`,verifyToken,adminOnly,products.store)
router.get(`/api/v1/products/:kode_barang`,verifyToken, products.show)
router.get(`/api/v1/products/:id`,verifyToken, products.showbyid)
router.put(`/api/v1/products/:id`,verifyToken,adminOnly, products.update)
router.delete(`/api/v1/products/:id`,verifyToken,adminOnly, products.destroy)


module.exports = router