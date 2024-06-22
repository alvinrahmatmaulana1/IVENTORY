import Swal from 'sweetalert2';
import axios from "axios";

const laporan_masuk = {
  namespaced: true,
  state: {
    laporan_masuk: [],
  
  },
  getters: {
    getLaporanMasuk: (state) => state.laporan_masuk,
    
  
  },
  actions: {
    async fetchLaporanMasuk({ commit, state }) {
      try {
        

        const token = localStorage.getItem("token");
        const response = await axios.get("/api/v1/laporan_masuks", {
          headers: {
            Authorization: `Bearer ${token}`,
          },
        });

        commit("SET_LAPORAN_MASUK", response.data.rows);
       

        return response.data.rows;
      } catch (error) {
        console.error(
          "Error fetching laporan data:",
          error.response.data.rows.msg
        );
        return false;
      }
    },
   
   
  },
  mutations: {
    "SET_LAPORAN_MASUK"(state, laporan_masuk) {
      state.laporan_masuk = laporan_masuk;
    },
  },
};

export default laporan_masuk;