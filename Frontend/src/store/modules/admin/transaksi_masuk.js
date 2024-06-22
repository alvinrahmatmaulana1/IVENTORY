
import axios from "axios";

const transaksi_masuks = {
  namespaced: true,
  state: {
    transaksi_masuks: [],
  
  },
  getters: {
    getTransaksi_masuks: (state) => state.transaksi_masuks,
    // gettransaksi_masuksById: (state) => (uuid) => {
    //   return state.event_admin.find((event) => event.uuid === uuid) || null;
    // },
    
  },
  actions: {
    async fetchTransaksi_masuks({ commit, state }) {
      try {
        

        const token = localStorage.getItem("token");
        const response = await axios.get("/api/v1/transaksi_masuks", {
          headers: {
            Authorization: `Bearer ${token}`,
          },
        });

        commit("SET_TRANSAKSI_MASUKS", response.data.rows);
       

        return response.data.rows;
      } catch (error) {
        console.error(
          "Error fetching products data:",
          error.response.data.rows.msg
        );
        return false;
      }
    },
    async fetchMe({ commit }) {
        try {
          
  
          // Ambil Bearer Token dari Local Storage
          const token = localStorage.getItem("token"); // Gantilah 'your_token_key' dengan kunci token Anda
  
          const response = await axios.get("/api/v1/transaksi_masuks/me", {
            headers: {
              Authorization: `Bearer ${token}`,
            },
          });
  
          const transaksi_masuks = response.data;
          commit("SET_TRANSAKSI_MASUKS", transaksi_masuks);
  
          
  
          return transaksi_masuks;
        } catch (error) {
          console.error("Error fetching user Transaksi Masuk:", error.message);
  
  
          return false;
        }
      },

      async addTransaksiMasuk({ commit }, transaksi) {
        try {
          const token = localStorage.getItem("token"); // Get the token from local storage
  
          const response = await axios.post("/api/v1/transaksi_masuks",transaksi, { 
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
      }
    
  },
  mutations: {
    SET_TRANSAKSI_MASUKS(state, transaksi_masuks) {
      state.transaksi_masuks = transaksi_masuks;
    },
    ADD_TRANSAKSI_MASUK(state, transaksi_masuks) {
      state.transaksi_masuks.push(transaksi_masuks); // Menambahkan transaksi baru ke array transaksi_masuks
    }
  },
};

export default transaksi_masuks;