import Swal from 'sweetalert2';
import axios from "axios";

const laporan_keluar = {
  namespaced: true,
  state: {
    laporan_keluar: [],
  
  },
  getters: {
    getLaporanKeluar: (state) => state.laporan_keluar,
    
  
  },
  actions: {
    async fetchLaporanKeluar({ commit, state }) {
      try {
        

        const token = localStorage.getItem("token");
        const response = await axios.get("/api/v1/laporan_keluars", {
          headers: {
            Authorization: `Bearer ${token}`,
          },
        });

        commit("SET_LAPORAN_KELUAR", response.data.rows);
       

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
    "SET_LAPORAN_KELUAR"(state, laporan_keluar) {
      state.laporan_keluar = laporan_keluar;
    },
  },
};

export default laporan_keluar;