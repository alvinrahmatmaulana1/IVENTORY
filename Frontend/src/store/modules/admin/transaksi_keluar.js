
import axios from "axios";

const transaksi_keluars = {
  namespaced: true,
  state: {
    transaksi_keluars: [],
  
  },
  getters: {
    getTransaksi_keluars: (state) => state.transaksi_keluars,
    // gettransaksi_masuksById: (state) => (uuid) => {
    //   return state.event_admin.find((event) => event.uuid === uuid) || null;
    // },
    
  },
  actions: {
    async fetchTransaksi_keluars({ commit, state }) {
      try {
        

        const token = localStorage.getItem("token");
        const response = await axios.get("/api/v1/transaksi_keluars", {
          headers: {
            Authorization: `Bearer ${token}`,
          },
        });

        commit("SET_TRANSAKSI_KELUARS", response.data.rows);
       

        return response.data.rows;
      } catch (error) {
        console.error(
          "Error fetching transaksi data:",
          error.response.data.rows.msg
        );
        return false;
      }
    },
    async fetchMe({ commit }) {
        try {
          
  
          // Ambil Bearer Token dari Local Storage
          const token = localStorage.getItem("token"); // Gantilah 'your_token_key' dengan kunci token Anda
  
          const response = await axios.get("/api/v1/transaksi_keluars/me", {
            headers: {
              Authorization: `Bearer ${token}`,
            },
          });
  
          const transaksi_keluars = response.data;
          commit("SET_TRANSAKSI_KELUARS", transaksi_keluars);
  
          
  
          return transaksi_keluars;
        } catch (error) {
          console.error("Error fetching user Transaksi Keluar:", error.message);
  
  
          return false;
        }
      },

      async addTransaksiKeluar({ commit, dispatch }, transaksi) {
        try {
          const token = localStorage.getItem("token"); // Get the token from local storage
  
          const response = await axios.post("/api/v1/transaksi_keluars",transaksi, { 
            headers: {
              Authorization: `Bearer ${token}` ,
              "Content-Type": "application/json"
            }
          });
          
          return response.data; 
        } catch (error) {
          throw error; 
        }
        finally {
          dispatch('notifikasi/fetchNotifikasi', null, { root: true })
      }
      }
    
  },
  mutations: {
    SET_TRANSAKSI_KELUARS(state, transaksi_keluars) {
      state.transaksi_keluars = transaksi_keluars;
    },
    
  },
};

export default transaksi_keluars;