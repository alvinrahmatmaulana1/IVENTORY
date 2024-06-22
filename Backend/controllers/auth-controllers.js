const db = require("../database/models")
const Users = db.Users
const Products = db.Products
const Blacklist = db.Blacklist
const Laporan_Masuks = db.Laporan_Masuks;
const Laporan_Keluars = db.Laporan_Keluars;
const Transaksi_Masuks = db.Transaksi_Masuks;
const Transaksi_Keluars = db.Transaksi_Keluars;
const jwt = require('jsonwebtoken')
const passwordHash = require('password-hash')
require("dotenv").config()

const register = async (input, res) => {
    try {
        /* input mengambil dari route hasil validasi 
           jadi di controller sudha bersih tidak ada logic pengecekan lagi
        */
        const save = await Users.create(input)
        res.json(save).status(200)
    } catch (error) {
        res.json(error).status(422)
    }
}

const authentication = async (req, res) => {
    try {
        const email = req.body.email.trim();
        const password = req.body.password.trim();
        const cekemail = await Users.findOne({ where: { email: email } });
        const fetchResult = cekemail.dataValues
        const verify = passwordHash.verify(password, fetchResult.password);

        /*  cek apakah password yanng di input sama dengan yang ada didatabase
            lalu di cocokan menggunakan hash
        */
        if (verify != true) {
            res.json({ msg: 'Password incorect !' }).status(422)
        } else {

            // isi value token kita mau apa aja
            const userToken = {
                id: fetchResult.id,
                username: fetchResult.username,
                email: fetchResult.email,
                role: fetchResult.role
            }

            /*  set token dengan value usertoken
                set secret key token kita untuk nanti validasi
                set expires token nya
                lalu kasih balikan berupa token jika login sukses
            */
            jwt.sign({ userToken }, process.env.JWT_KEY, {
                expiresIn: '100h' //set exipre token
            }, (err, token) => {
                if (err) {
                    console.error('Error in generating token:', err);
                    res.status(500).json({ msg: "Internal Server Error" });
                } else {
                    res.json({ token: token, role: fetchResult.role}).status(200);
                }
            });
        }
    } catch (error) {
        // kondisi jika username atau password salah
        res.json({ msg: `username or password not match ${error}` }).status(422);
    }
}

const getLoginById = async (req, res) => {
    try {
        const userId = req.userToken.id;

        const data = await Users.findByPk(userId, {
            attributes: ['id','username','email','role']
        });

        if (!data) {
            return res.status(404).json({ msg: "user not found" });
        }

        res.json(data).status(200);
    } catch (error) {
        console.error('Error in getLoginById:', error);
        res.status(422).json({ msg: "Unprocessable Entity" });
    }
};

const getTransaksiPegawaiById = async (req, res) => {
    try {
        const userId = req.userToken.id;

        const data = await Transaksi_Masuks.findAll(
            {
                attributes: ['id','tanggal_masuk', 'jumlah_masuk','createdAt','updatedAt'],
                include: [
                    {
                        model: Products,
                        attributes: ['id','kode_barang', 'nama_barang', 'harga'], // Tentukan field-field yang ingin Anda ambil dari tabel Products
                    },
                    {
                        model: Users,
                        attributes: ['id','username'], // Tentukan field-field yang ingin Anda ambil dari tabel Users
                    },
                ],
                where : {user_id:userId}
            }
            
            );

        if (!data || data.length === 0) {
            return res.status(404).json({ msg: "Transaksi Not Found " });
        }

        res.json(data).status(200);
    } catch (error) {
        console.error('Error in getLoginById:', error);
        res.status(422).json({ msg: "Unprocessable Entity" });
    }
};

const getTransaksiPegawaiById2 = async (req, res) => {
    try {
        const userId = req.userToken.id;

        const data = await Transaksi_Keluars.findAll({
            attributes: ['id','tanggal_keluar', 'jumlah_keluar','createdAt','updatedAt'],
                include: [
                    {
                        model: Products,
                        attributes: ['id','kode_barang', 'nama_barang', 'harga'], // Tentukan field-field yang ingin Anda ambil dari tabel Products
                    },
                    {
                        model: Users,
                        attributes: ['id','username'], // Tentukan field-field yang ingin Anda ambil dari tabel Users
                    },
                ],
            where : {users_id:userId}});

        if (!data || data.length === 0) {
            return res.status(404).json({ msg: "Transaksi Not Found " });
        }

        res.json(data).status(200);
    } catch (error) {
        console.error('Error in getLoginById:', error);
        res.status(422).json({ msg: "Unprocessable Entity" });
    }
};
const getLaporan_masuks = async (req, res) => {
    try {
        const userId = req.userToken.id;

        const data = await Laporan_Masuks.findAll({
            attributes: ['id', 'pengeluaran','createdAt','updatedAt'],
                include: [
                    {
                        model: Products,
                        attributes: ['id','kode_barang', 'nama_barang', 'harga'], // Tentukan field-field yang ingin Anda ambil dari tabel Products
                    },
                    {
                        model: Users,
                        attributes: ['id','username'], // Tentukan field-field yang ingin Anda ambil dari tabel Users
                    },
                    {
                        model: Transaksi_Masuks,
                        attributes:['id','tanggal_masuk','jumlah_masuk']
                    }
                ],
            where : {users_id:userId}
        });

        if (!data || data.length === 0) {
            return res.status(404).json({ msg: "Laporan Not Found " });
        }

        res.json(data).status(200);
    } catch (error) {
        console.error('Error in getLoginById:', error);
        res.status(422).json({ msg: "Unprocessable Entity" });
    }
};

const getLaporan_keluars = async (req, res) => {
    try {
        const userId = req.userToken.id;

        const data = await Laporan_Keluars.findAll({
            attributes: ['id', 'pendapatan','createdAt','updatedAt'],
                include: [
                    {
                        model: Products,
                        attributes: ['id','kode_barang', 'nama_barang', 'harga'], 
                    },
                    {
                        model: Users,
                        attributes: ['id','username'], 
                    },
                    {
                        model: Transaksi_Keluars,
                        attributes:['id','tanggal_keluar','jumlah_keluar']
                    }
                ],
            where : {users_id:userId}
        });

        if (!data || data.length === 0) {
            return res.status(404).json({ msg: "Laporan Not Found " });
        }

        res.json(data).status(200);
    } catch (error) {
        console.error('Error in getLoginById:', error);
        res.status(422).json({ msg: "Unprocessable Entity" });
    }
};
const logout = async (req, res) => {
    try {
        if (req.headers.authorization) {
            const token = req.headers.authorization.split(' ')[1]
            await Blacklist.create({ token: token })
            res.json({ msg: 'Logout sucessfully' }).status(200);
        } else {
            res.json({ msg: 'Token required' }).status(422);
        }
    } catch (error) {
        console.log(error);
        res.json({ msg: error }).status(422);
    }
}

module.exports = {
    register, authentication, logout, getLoginById, getTransaksiPegawaiById, getTransaksiPegawaiById2,
    getLaporan_masuks,getLaporan_keluars
}