import axios from "axios";
import Swal from 'sweetalert2';
const products = {
  namespaced: true,
  state: {
    products: [],
  
  },
  getters: {
    getProducts: (state) => state.products,
    // getProductsById: (state) => (uuid) => {
    //   return state.event_admin.find((event) => event.uuid === uuid) || null;
    // },
    
  },
  actions: {
    async fetchProducts({ commit, state }) {
      try {
        

        const token = localStorage.getItem("token");
        const response = await axios.get("/api/v1/products", {
          headers: {
            Authorization: `Bearer ${token}`,
          },
        });

        commit("SET_PRODUCTS", response.data.rows);
       

        return response.data.rows;
      } catch (error) {
        console.error(
          "Error fetching products data:",
          error.response.data.rows.msg
        );
        return false;
      }
    },
    // async fetchproductsById({ commit, state }, uuid) {
    //   try {
    //     commit("SET_LOADING", true);

    //     const token = localStorage.getItem("token");
    //     const response = await axios.get(`/event/admin/${uuid}`, {
    //       headers: {
    //         Authorization: `Bearer ${token}`,
    //       },
    //     });

    //     commit("SET_EVENT_ADMIN", [response.data]);
    //     commit("SET_LOADING", false);

    //     return response.data;
    //   } catch (error) {
    //     console.error(
    //       "Error fetching event admin data:",
    //       error.response.data.msg
    //     );
    //     commit("SET_LOADING", false);
    //     return false;
    //   }
    // },
    async addProduct({ commit, dispatch }, formData) {
      try {

        const token = localStorage.getItem("token");
        const response = await axios.post("/api/v1/products", formData, {
          headers: {
            Authorization: `Bearer ${token}`,
            "Content-Type": "multipart/form-data",
          },
        });


        return response.data;
      } catch (error) {
        console.error("Error creating event:", error);

        // Periksa apakah error.response terdefinisi sebelum mencoba mengakses properti 'data'
        const errorMessage = error.response
          ? error.response.data.msg
          : "An error occurred while creating the product. Please try again.";

        return false;
      }
      finally {
        dispatch('products/fetchProducts', null, { root: true })
    }
    },
    async editProduct({ commit, dispatch }, payload) {
      try {
        const token = localStorage.getItem("token");
        const response = await axios.put(`/api/v1/products/${payload.id}`, payload.formData, { 
          headers: {
            Authorization: `Bearer ${token}` ,
            "Content-Type": "multipart/form-data"
          }
        });
        return response.data; 
      } catch (error) {
        throw error; 
      }
    },
    async deleteProduct({ commit, dispatch }, Id) {
      try {
        // Tampilkan SweetAlert2 untuk konfirmasi penghapusan
        const confirmResult = await Swal.fire({
            title: 'Apa Anda Yakin?',
            text: "Anda tidak akan dapat mengembalikan ini!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Ya, hapus it!'
        });

        // Jika pengguna mengklik "Yes", maka hapus produk dari keranjang
        if (confirmResult.isConfirmed) {
            // Hapus produk dari keranjang
            const deleteProduct = await axios.delete(
              `/api/v1/products/${Id}`, 
              {
              headers: {
                  'Authorization': `Bearer ${localStorage.getItem('token')}`
              }
              }

          );
            console.log(deleteProduct.data);

            // commit('SET_KERANJANG', hapuskeranjang.data.cart_items.data);
            Swal.fire(
                'Deleted!',
                'Your product has been deleted.',
                'success'
            );
        } else {
            // Jika pengguna mengklik "Cancel", produk tidak dihapus dari keranjang
            Swal.fire(
                'Cancelled',
                'Your product is safe :)',
                'error'
            );
        }
    } catch (error) {
        console.log(error);
    } finally {
      dispatch('products/fetchProducts', null, { root: true })
  }
  },
  },
  mutations: {
    SET_PRODUCTS(state, products) {
      state.products = products;
    },
  },
};

export default products;