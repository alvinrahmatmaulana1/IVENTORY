import Swal from 'sweetalert2';
import axios from "axios";

const notifikasi = {
  namespaced: true,
  state: {
    notifikasi: [],
  
  },
  getters: {
    getNotifikasi: (state) => state.notifikasi,
    
  
  },
  actions: {
    async fetchNotifikasi({ commit, state }) {
      try {
        

        const token = localStorage.getItem("token");
        const response = await axios.get("/api/v1/notifikasis", {
          headers: {
            Authorization: `Bearer ${token}`,
          },
        });

        commit("SET_NOTIFIKASI", response.data.rows);
       

        return response.data.rows;
      } catch (error) {
        console.error(
          "Error fetching notifikasi data:",
          error.response.data.rows.msg
        );
        return false;
      }
    },
    async deleteNotifikasi({ commit, dispatch }, Id) {
            try {
                // const token = localStorage.getItem('token');
                const deleteNotifikasi = await axios.delete(
                    `/api/v1/notifikasis/${Id}`, 
                    {
                    headers: {
                        'Authorization': `Bearer ${localStorage.getItem('token')}`
                    }
                    }
                    
      
                );
                console.log(deleteNotifikasi.data)
                // commit("SET_KERANJANG", deleteKeranjang.data.cart_items.data);
                Swal.fire(
                    'Deleted!',
                    'Your product has been deleted.',
                    'success'
                );
            } catch (error) {
                alert(error);
                console.log(error);
            } finally {
                dispatch('notifikasi/fetchNotifikasi', null, { root: true })
            }
        },
   
  },
  mutations: {
    SET_NOTIFIKASI(state, notifikasi) {
      state.notifikasi = notifikasi;
    },
  },
};

export default notifikasi;