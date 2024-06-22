const db = require("../database/models");
const Transaksi_Keluars = db.Transaksi_Keluars;
const Products = db.Products;
const Laporan_Keluars = db.Laporan_Keluars;
const Notifikases = db.Notifikasis;
const Users = db.Users;

// const store = async (req, res) => {
//     try {
//      const { tanggal_keluar, products_id, users_id, jumlah_keluar } = req.body;
//         const save = await Transaksi_Keluars.create({
//             tanggal_keluar,
//             products_id,
//             users_id,
//             jumlah_keluar
//         })
        
//         const product = await Products.findByPk(products_id);
//         if (product) {

//             if (jumlah_keluar > product.stok){
//                 res.status(404).json({ msg: "Stok Tidak Mencukupi" });
//             }
//             else
//             product.stok -= parseInt(jumlah_keluar);

//             await product.save();
            


//             if (product.stok <= 10) {
//                 await Notifikases.create({
//                     products_id: products_id,
//                     pesan: "Barang " + product.nama_barang + " sudah hampir habis",
//                     tanggal_notifikasi: tanggal_keluar
//                 });
//             }
//         }
//         await Laporan_Keluars.create({
//             users_id: users_id, 
//             products_id: products_id,
//             transaksi_keluars_id: save.id,
//             pendapatan: product.harga * parseInt(jumlah_keluar)
            
//         });
        
       

//         res.json(save).status(200)
//     } catch (error) {
//         res.json(error).status(422)
//     }
// }

const store = async (req, res) => {
    try {
        const { tanggal_keluar, products_id, users_id, jumlah_keluar } = req.body;

        // Find the product
        const product = await Products.findByPk(products_id);
        if (!product) {
            return res.status(404).json({ error: "Product not found" });
        }

        // Check if stock is sufficient
        if (product.stok < jumlah_keluar) {
            return res.status(400).json({ error: "Stok tidak mencukupi" });
        }

        // Proceed with the transaction
        const save = await Transaksi_Keluars.create({
            tanggal_keluar,
            products_id,
            users_id,
            jumlah_keluar
        });

        // Update stock
        product.stok -= jumlah_keluar;
        await product.save();

        // Check if stock is running low
        if (product.stok <= 10) {
            await Notifikases.create({
                products_id: products_id,
                pesan: "Barang " + product.nama_barang + " sudah hampir habis",
                tanggal_notifikasi: tanggal_keluar
            });
        }

        // Create a report
        await Laporan_Keluars.create({
            users_id: users_id,
            products_id: products_id,
            transaksi_keluars_id: save.id,
            pendapatan: product.harga * parseInt(jumlah_keluar)
        });

        res.status(200).json({ message: "Transaction successful" });
    } catch (error) {
        console.error("Error:", error);
        res.status(500).json({ error: "Internal server error" });
    }
};

const index = async (req, res) => {
    try {
        const result = await Transaksi_Keluars.findAndCountAll(
            {
            attributes: ['id','tanggal_keluar', 'jumlah_keluar','createdAt','updatedAt'],
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
        const data = await Transaksi_Keluars.findOne({
            attributes: ['id','tanggal_keluar', 'jumlah_keluar','createdAt','updatedAt'],
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
        const transaksiMasuk = await Transaksi_Keluars.findByPk(id);

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