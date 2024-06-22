import { createStore } from "vuex";
import auth from "./modules/auth/auth.js";
import products from "./modules/admin/products.js";
import notifikasi from "./modules/admin/notifikasi.js";
import transaksi_masuks from "./modules/admin/transaksi_masuk.js";
import laporan_masuk from "./modules/admin/laporanmasuk.js";
import laporan_keluar from "./modules/admin/laporankeluar.js"
import transaksi_keluars from "./modules/admin/transaksi_keluar.js"
import pegawai from "./modules/admin/pegawai.js"

const store = createStore({
  state: {
    isLoading: false,
  },
  modules: {
    auth,
    products,
    notifikasi,
    transaksi_masuks,
    laporan_masuk,
    laporan_keluar,
    transaksi_keluars,
    pegawai
  },
});

export default store;