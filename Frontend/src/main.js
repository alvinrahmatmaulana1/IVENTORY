import { createApp } from 'vue';
import App from './App.vue';
import router from './router/index'
import store from "./store/index";  
import "./style.css";
import axios from 'axios';


axios.defaults.withCredentials = true;
axios.defaults.baseURL = 'http://localhost:3000'

const app = createApp(App);     
app.use(store)
app.use(router).mount('#app')