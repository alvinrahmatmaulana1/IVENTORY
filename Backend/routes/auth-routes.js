'use strict'
const express = require('express')
const auth = require('../controllers/auth-controllers')
const { verifyToken, } = require('../middleware/verify')
const { check, validationResult } = require('express-validator')
const passwordHash = require('password-hash')
const router = express.Router()

const checkValidation = [
    // isAlphanumeric adalah fungsi mengecek inputan kita harus angka atau huruf
    // isemail mengeck email
    check('username').not().isEmpty().withMessage('required value').isAlphanumeric(),
    check('email').not().isEmpty().withMessage('required value').isEmail(),
    check('password').not().isEmpty().withMessage('required value').isAlphanumeric(),
    check('role').not().isEmpty().withMessage('required value').isAlphanumeric(),
];

const checkValidationLogin = [
    // isAlphanumeric adalah fungsi mengecek inputan kita harus angka atau huruf
    check('email').not().isEmpty().withMessage('required value').isEmail(),
    check('password').not().isEmpty().withMessage('required value').isAlphanumeric()
];

const postParam = (req) => {
    // hash password dengan  library password hash
    const passwordToSave = passwordHash.generate(req.body.password),
        data = {
            username: req.body.username.trim(),
            email: req.body.email,
            password: passwordToSave,
            role: req.body.role
        };
    return data;
}

router.post(`/api/v1/auth/register`, [checkValidation], (req, res) =>  {
    // mengecek ke middleware apakah kondisi validasi terpenuhi atau tidak
    const errors = validationResult(req);

    // jika error kirim pesan error jikat tidak lanjut ke simpan data
    (!errors.isEmpty() ? res.status(422).json(errors) : auth.register(postParam(req), res))
})
router.post(`/api/v1/auth/login`, [checkValidationLogin], (req, res) => {
     // mengecek ke middleware apakah kondisi validasi terpenuhi atau tidak
     const errors = validationResult(req);

     // jika error kirim pesan error jikat tidak lanjut ke simpan data
     (!errors.isEmpty() ? res.status(422).json(errors) : auth.authentication(req, res))
})
router.post(`/api/v1/auth/logout`, auth.logout)

router.get(`/api/v1/auth/me`,verifyToken,auth.getLoginById)
router.get(`/api/v1/transaksi_masuks/me`,verifyToken,auth.getTransaksiPegawaiById)
router.get(`/api/v1/transaksi_keluars/me`,verifyToken,auth.getTransaksiPegawaiById2)
router.get(`/api/v1/laporan_masuks/me`,verifyToken,auth.getLaporan_masuks)
router.get(`/api/v1/laporan_keluars/me`,verifyToken,auth.getLaporan_keluars)
module.exports = router