const db = require("../database/models")
const Laporan_Keluars = db.Laporan_Keluars;
const Products = db.Products;
const Transaksi_Keluars = db.Transaksi_Keluars;
const Users = db.Users;

const index = async (req, res) => {
    try {
        const result = await Laporan_Keluars.findAndCountAll(
            {
                attributes: ['id', 'pendapatan','createdAt','updatedAt'],
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
                        model: Transaksi_Keluars,
                        attributes:['id','tanggal_keluar','jumlah_keluar']
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
        const data = await Laporan_Keluars.findOne({
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