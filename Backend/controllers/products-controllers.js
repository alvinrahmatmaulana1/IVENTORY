const db = require("../database/models")
const { v4: uuidv4 } = require('uuid');
const Products = db.Products;
const Joi = require('joi');
const multer = require('multer');
const path = require('path');
const fs = require('fs').promises; 

const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, 'public/uploads/produk'); // Menyimpan file di folder public/uploads/produk
    },
    filename: function (req, file, cb) {
        cb(null, file.originalname);
    },
});

function checkFileType(file, cb) {
    // Ekstensi file yang diizinkan
    const filetypes = /jpeg|jpg|png|gif/;
    // Mengecek ekstensi file
    const extname = filetypes.test(path.extname(file.originalname).toLowerCase());
    // Mengecek tipe mime
    const mimetype = filetypes.test(file.mimetype);

    if (mimetype && extname) {
        return cb(null, true);
    } else {
        cb('Error: Only images are allowed (jpeg, jpg, png, gif)!');
    }
}

// Schema validasi Joi untuk data produk
const produkSchema = Joi.object({
    nama_barang: Joi.string().required(),
    harga: Joi.number().required(),
    stok: Joi.number().required(),
    
});

// Middleware multer untuk upload file
const upload = multer({
    storage: storage,
    fileFilter: function (req, file, cb) {
        checkFileType(file, cb);
    },
}).single('image_barang');

const store = async (req, res) => {
    try {
        upload(req, res, async function (err) {
            if (err) {
                return res.status(422).json({ status: 422, message: err });
            }

            // Validasi data produk menggunakan Joi, dengan mengesampingkan validasi foto
            const { error } = produkSchema.validate(req.body, { exclude: ['image_barang'] });
            if (error) {
                return res.status(422).json({ status: 422, message: error.details[0].message });
            }

            if (!req.file) {
                return res.status(422).json({ status: 422, message: 'No file uploaded' });
            }

            // Menyimpan path foto yang akan disimpan di database
            const image_barang = '/uploads/produk/' + req.file.filename;

            const { nama_barang, harga, stok } = req.body;
            const kode_barang = uuidv4();

            // Menyimpan data produk ke database
            const save = await Products.create({ nama_barang,harga,stok,image_barang,kode_barang });
            res.json({ status: 200, message: 'success', data: save });
        });
    } catch (error) {
        res.json({ status: 422, message: error.message });
    }
};



const index = async (req, res) => {
    try {
        const result = await Products.findAndCountAll()
        res.json(result).status(200)
    } catch (error) {
        res.json(error).status(422)
    }
}

const show = async (req, res) => {
    try {
        const kode_barang = req.params.kode_barang
        const data = await Products.findOne({
            where: {
                kode_barang: kode_barang
            }
        });
        const result = data ? data : `${kode_barang} not found in db`
        res.json(result).status(200)
    } catch (error) {
        res.json(error).status(422)
    }
}

const showbyid = async (req, res) => {
    try {
        const id = req.id
        const data = await Products.findOne({
            where: {
                id: id
            }
        });
        const result = data ? data : `${id} not found in db`
        res.json(result).status(200)
    } catch (error) {
        res.json(error).status(422)
    }
}

// const update = (req, res) => {
//     Products.findByPk(req.params.id).then((emp) => {
//         if(emp){
//             emp.update(req.body)
//             msg = emp
//         }else{
//             msg = `${req.params.id} not found in db`
//         }
//         res.json({ message: msg })
//     }).catch((err) => {
//         res.json({ msg: err.message });
//     });
// }

const update = async (req, res) => {
    try {
        const id = req.params.id;
        const produk = await Products.findByPk(id);

        if (!produk) {
            return res.json({ status: 422, message: `${id} not found in db` });
        }

        if (!req.file) {
            req.body.image_barang = produk.image_barang;
        }

        upload(req, res, async function (err) {
            if (err) {
                return res.status(422).json({ status: 422, message: err });
            }

            

            // Validasi data produk menggunakan Joi, dengan mengesampingkan validasi foto
            // const { error } = produkSchema.validate(req.body, { exclude: ['image_barang'] });
            // if (error) {
            //     return res.status(422).json({ status: 422, message: error.details[0].message });
            // }

            let image_barang = produk.image_barang; // Tetap menggunakan foto lama jika tidak ada file baru diunggah

            if (req.file) {
                // Hapus foto lama jika ada file baru diunggah
                await fs.unlink(`public${produk.image_barang}`);
                image_barang = '/uploads/produk/' + req.file.filename;;
            }

            

            const { nama_barang, harga, stok } = req.body;

            // Update data produk di database
            await produk.update({ nama_barang,harga,stok,image_barang });
            res.json({ status: 200, message: 'success updated' });
        });
    } catch (error) {
        res.json({ status: 422, message: error.message });
    }
};

const destroy = (req, res) => {
    let msg
    Products.findByPk(req.params.id).then((row) => {
        if(row){
            row.destroy()
            msg = "success deleted"
        }else{
            msg = `${req.params.id} not found in db`
        }
        res.json({ message: msg })
    }).catch((err) => {
        res.json({ message: err.message })
    })
}

module.exports = {
    index, show, store,
    update, destroy, showbyid, 
    // getImageById
}