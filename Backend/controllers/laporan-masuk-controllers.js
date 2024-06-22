const db = require("../database/models")
const Laporan_Masuks = db.Laporan_Masuks;
const Products = db.Products;
const Transaksi_Masuks = db.Transaksi_Masuks;
const Users = db.Users;

const index = async (req, res) => {
    try {
        const result = await Laporan_Masuks.findAndCountAll(
            {
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
            }
        )
        res.json(result).status(200)
    } catch (error) {
        res.json(error).status(422)
    }
}

const show = async (req, res) => {
    try {
        const id = req.params.id
        const data = await Laporan_Masuks.findOne({
            attributes: ['id', 'pengeluaran','createdAt','updatedAt'],
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
                        model: Transaksi_Masuks,
                        attributes:['id','tanggal_masuk','jumlah_masuk']
                    }
                ],
            where: {
                id: id
            }
        })
        const result = data ? data : `${id} not found in db`
        res.json(result).status(200)
    } catch (error) {
        res.json(error).status(422)
    }
}



module.exports = {
    index,show
}