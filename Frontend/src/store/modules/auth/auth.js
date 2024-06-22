import axios from "axios";

const auth = {
  namespaced: true,
  state: {
    role: localStorage.getItem("role") || "",
    token: localStorage.getItem("token") || "",
    users: [],
   
    
  },
  getters: {
    isRole: (state) => !!state.role && state.role !== "",
    isAuthenticated: (state) => !!state.token && state.token !== "",
    getMe: (state) => state.users,

  },
  actions: {
    async login({ commit }, credentials) {
      try {
        const response = await axios.post("/api/v1/auth/login", credentials);
        const { token, role } = response.data; 
    
        // Pastikan respons dari server mengandung token dan role
        if (token && role) {
          localStorage.setItem("token", token);
          localStorage.setItem("role", role);
    
          commit("SET_ROLE", role);
          commit("SET_TOKEN", token);
    
          return { token, role }; // Kembalikan token dan role
        } else {
          // Jika respons tidak valid, lempar error
          throw new Error("Invalid response from server");
        }
      } catch (error) {
        // Tangani kesalahan dari server
        const errorMessage = error.response.data.msg || "An error occurred during login";
        throw new Error(errorMessage);
      }
    },
    
    
    
    async fetchMe({ commit }) {
      try {
        // Set status loading menjadi true sebelum memuat data

        // Ambil Bearer Token dari Local Storage
        const token = localStorage.getItem("token"); // Gantilah 'your_token_key' dengan kunci token Anda

        const response = await axios.get("/api/v1/auth/me", {
          headers: {
            Authorization: `Bearer ${token}`,
          },
        });

        const users = response.data;
        commit("SET_USER", users);

        // Setelah data dimuat, atur status loading menjadi false
       
        return users;
      } catch (error) {
        console.error("Error fetching user data:", error.message);

        

        return false;
      }
    },
    async logout({ commit }) {
      localStorage.removeItem("role");
      localStorage.removeItem("token");
      commit("SET_ROLE", "");
      commit("SET_TOKEN", "");
      return true;
    },
  },
  mutations: {
    SET_ROLE(state, role) {
      state.role = role;
    },
    SET_TOKEN(state, token) {
      state.token = token;
    },
    SET_USER_LOGIN(state, auth) {
      state.users = auth;
    },
    SET_USER(state, auth) {
      state.users = auth;
    },
    
  },
};

export default auth;