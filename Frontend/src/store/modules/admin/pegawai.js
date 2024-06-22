import Swal from 'sweetalert2';
import axios from "axios";

const pegawai = {
  namespaced: true,
  state: {
    pegawai: [],
  
  },
  getters: {
    getPegawai: (state) => state.pegawai,
    
  
  },
  actions: {
    async fetchPegawai({ commit, state }) {
      try {
        

        const token = localStorage.getItem("token");
        const response = await axios.get("/api/v1/user", {
          headers: {
            Authorization: `Bearer ${token}`,
          },
        });

        commit("SET_PEGAWAI", response.data.rows);
       

        return response.data.rows;
      } catch (error) {
        console.error(
          "Error fetching Pegawai:",
          error.response.data.rows.msg
        );
        return false;
      }
    },

    async addPegawai({ commit, dispatch }, pegawai) {
      try {
        const token = localStorage.getItem("token"); // Get the token from local storage

        const response = await axios.post("/api/v1/user",pegawai, { 
          headers: {
            Authorization: `Bearer ${token}` ,
            "Content-Type": "application/json"
          }
        });
        // const transaksii = response.data;
        // commit("ADD_TRANSAKSI_MASUK", transaksii);
        return response.data; 
      } catch (error) {
        throw error; 
      }
      finally {
        dispatch('pegawai/fetchPegawai', null, { root: true })
    }
    },

    async editPegawai({ commit, dispatch }, editpegawai) {
      try {
        const token = localStorage.getItem("token"); // Get the token from local storage

        const response = await axios.put(`/api/v1/user/${editpegawai.id}`,editpegawai, { 
          headers: {
            Authorization: `Bearer ${token}` ,
            "Content-Type": "application/json"
          }
        });
        // const transaksii = response.data;
        // commit("ADD_TRANSAKSI_MASUK", transaksii);
        return response.data; 
      } catch (error) {
        throw error; 
      }
      finally {
        dispatch('pegawai/fetchPegawai', null, { root: true })
    }
    },
    async deletePegawai({ commit, dispatch }, Id) {
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
            const deletePegawai = await axios.delete(
              `/api/v1/user/${Id}`, 
              {
              headers: {
                  'Authorization': `Bearer ${localStorage.getItem('token')}`
              }
              }

          );
            console.log(deletePegawai.data);

            // commit('SET_KERANJANG', hapuskeranjang.data.cart_items.data);
            Swal.fire(
                'Deleted!',
                'Your users has been deleted.',
                'success'
            );
        } else {
            // Jika pengguna mengklik "Cancel", produk tidak dihapus dari keranjang
            Swal.fire(
                'Cancelled',
                'Your users is safe :)',
                'error'
            );
        }
    } catch (error) {
        console.log(error);
    } finally {
      dispatch('pegawai/fetchPegawai', null, { root: true })
    }
  },
   
   
  },
  mutations: {
    "SET_PEGAWAI"(state, pegawai) {
      state.pegawai = pegawai;
    },
  },
};

export default pegawai;