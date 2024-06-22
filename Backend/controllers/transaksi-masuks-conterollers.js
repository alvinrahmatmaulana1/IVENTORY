const db = require("../database/models");
const Transaksi_Masuks = db.Transaksi_Masuks;
const Products = db.Products;
const Laporan_Masuks = db.Laporan_Masuks;
const Users = db.Users;

const store = async (req, res) => {
    try {
     const { tanggal_masuk, product_id, user_id, jumlah_masuk } = req.body;
        const save = await Transaksi_Masuks.create({
            tanggal_masuk,
            product_id,
            user_id,
            jumlah_masuk
        })
        
        const product = await Products.findByPk(product_id);
        if (product) {
          product.stok +=parseInt( jumlah_masuk);
            await product.save();
        }
        await Laporan_Masuks.create({
            users_id: user_id, 
            products_id: product_id,
            transaksi_masuks_id: save.id,
            pengeluaran: product.harga * parseInt(jumlah_masuk)
            
        });

        res.json(save).status(200)
    } catch (error) {
        res.json(error).status(422) 
    }
}

const index = async (req, res) => {
    try {
        const result = await Transaksi_Masuks.findAndCountAll(
            {
            attributes: ['id','tanggal_masuk', 'jumlah_masuk','createdAt','updatedAt'],
            include: [
                {
                    model: Products,
                    attributes: ['kode_barang', 'nama_barang', 'harga'], // Tentukan field-field yang ingin Anda ambil dari tabel Products
                },
                {
                    model: Users,
                    attributes: ['username'], // Tentukan field-field yang ingin Anda ambil dari tabel Users
                },
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
        const data = await Transaksi_Masuks.findOne({
            attributes: ['id','tanggal_masuk', 'jumlah_masuk'],
            include: [
                {
                    model: Products,
                    attributes: ['kode_barang', 'nama_barang', 'harga'], // Tentukan field-field yang ingin Anda ambil dari tabel Products
                },
                {
                    model: Users,
                    attributes: ['username'], // Tentukan field-field yang ingin Anda ambil dari tabel Users
                },
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

const update = async (req, res) => {
    try {
        const id = req.params.id;
        const transaksiMasuk = await Transaksi_Masuks.findByPk(id);

        if (!transaksiMasuk) {
            return res.json({ message: `${id} not found in db` });
        }

        const previousJumlahMasuk = transaksiMasuk.jumlah_masuk;

        // Update transaksi masuk
        const { tanggal_masuk, product_id, user_id, jumlah_masuk } = req.body;

        const save = await transaksiMasuk.update({
            tanggal_masuk,
            product_id,
            user_id,
            jumlah_masuk
        });

        // Update stok produk
        const product = await Products.findByPk(product_id);

        if (product) {
            const perubahanJumlahMasuk = jumlah_masuk - previousJumlahMasuk;
            product.stok += parseInt(perubahanJumlahMasuk);
            await product.save();
        }

        // Update entri di laporan masuk jika diperlukan
        const laporanMasuk = await Laporan_Masuks.findOne({
            where: { transaksi_masuks_id: save.id },
        });

        if (laporanMasuk) {
            await laporanMasuk.update({
                user_id: user_id,
                product_id: product_id,
                transaksi_masuks_id: save.id,
            });
        }

        res.json({ message: "Update successful", data: save });
    } catch (error) {
        res.json({ message: error.message }).status(422);
    }
};


const destroy = async (req, res) => {
    try {
        const {id} = req.params

        await Transaksi_Masuks.destroy({
            where: {
               id:id
            }
          });

          await Laporan_Masuks.destroy({
            where: {
              
              transaksi_masuks_id: id,
              
            }
          });
      
          res.json({ message: 'Data berhasil dihapus' }).status(200);
    } catch (error) {
        res.json(error).status(422);
    }
}

module.exports = {
    index, show, store,
    update, destroy
}