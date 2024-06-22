import { createWebHistory, createRouter } from "vue-router";
import AdminLayouts from "../layouts/AdminLayouts.vue";
import MainLayout from "../layouts/MainLayouts.vue";
import AdminDashboard from "../views/admin/AdminDashboard.vue"
import ProductsAdmin from "../views/admin/ProductsAdmin.vue"
import Login from "../views/auth/Login.vue"
import TransaksiMasuk from "../views/admin/TransaksiMasuk.vue";
import TransaksiKeluar from "../views/admin/TransaksiKeluar.vue"
import AddTransaksiMasuk from "../views/admin/AddTransaksiMasuk.vue";
import AddTransaksiKeluar from "../views/admin/AddTransaksiKeluar.vue";
import LaporanMasuk from "../views/admin/LaporanMasuk.vue";
import LaporanKeluar from "../views/admin/LaporanKeluar.vue";
import Users from "../views/admin/Users.vue"
import store from "../store";

 const routes = [
    {
      path: "/",
      component: MainLayout,
      name: "MainLayout",
    },

    {
      path: "/login",
      name: "Login",
      component: Login,
      meta: {
        title: "Login",
      },
      beforeEnter: (to, from, next) => {
        
        const isAuthenticated = store.getters["auth/isAuthenticated"];
        if (isAuthenticated) {
          // Jika pengguna sudah login, arahkan ke halaman yang sesuai dengan rolenya
          const role = localStorage.getItem("role");
          if (role === "admin") {
            next("/admin");
          } else if (role === "pegawai"){
            next("/");
          }
        } else {
          // Menampilkan halaman login
         
          next();
        }
      },
    },


    {
      path: "/admin",
      component: AdminLayouts,
      name: "AdminLayouts",
      meta: {
        requiresAuth: true
      },
      children: [
        {
          path: "/admin",
          component: AdminDashboard,
          name: "AdminDashboard",
          meta: {
            title: "AdminDashboard",
            requiresAuth: true
          },
        },
        {
          path: "/admin/products",
          component: ProductsAdmin,
          name: "ProductsAdmin",
          meta: {
            title: "ProductsAdmin",
            requiresAuth: true
          },
        },
        {
          path: "/admin/transaksi_masuk",
          component: TransaksiMasuk,
          name: "TransaksiMasuk",
          meta: {
            title: "TransaksiMasuk",
            requiresAuth: true
          },
        },
        {
          path: "/admin/transaksi_keluar",
          component: TransaksiKeluar,
          name: "TransaksiKeluar",
          meta: {
            title: "TransaksiKeluar",
            requiresAuth: true
          },
        },
        {
          path: "/admin/transaksi_masuk/add",
          component: AddTransaksiMasuk,
          name: "AddTransaksiMasuk",
          meta: {
            title: "AddTransaksiMasuk",
            requiresAuth: true
          },
        },
        {
          path: "/admin/transaksi_keluar/add",
          component: AddTransaksiKeluar,
          name: "AddTransaksiKeluar",
          meta: {
            title: "AddTransaksiKeluar",
            requiresAuth: true
          },
        },
        {
          path: "/admin/laporan_masuk",
          component: LaporanMasuk,
          name: "LaporanMasuk",
          meta: {
            title: "LaporanMasuk",
            requiresAuth: true
          },
        },
        {
          path: "/admin/laporan_keluar",
          component: LaporanKeluar,
          name: "LaporanKeluar",
          meta: {
            title: "LaporanKeluar",
            requiresAuth: true
          },
        },
        {
          path: "/admin/data_pegawai",
          component: Users,
          name: "Users",
          meta: {
            title: "Users",
            requiresAuth: true
          },
        }
      ]
    },

   
  ];


const router = createRouter({
    history: createWebHistory(),
    routes,
  });

  router.beforeEach((to, from, next) => {
    const isAuthenticated = store.getters["auth/isAuthenticated"];
    const requiresAuth = to.meta.requiresAuth;
    const userRole = store.getters["auth/isRole"]; // Mendapatkan peran pengguna dari store
  
    // Jika rute memerlukan otentikasi dan pengguna belum terotentikasi
    if (requiresAuth && !isAuthenticated) {
      next({
        name: "Login"
      }); // Redirect ke halaman login
    } else if (to.path.includes("/admin/") && userRole === "user") {
      // Jika pengguna dengan peran "user" mencoba mengakses rute admin
      next({
        name: "MainLayout"
      }); // Redirect ke halaman dashboard pengguna
    } else {
      next(); // Lanjutkan navigasi ke rute yang diminta
    }
  });
  
  export default router;