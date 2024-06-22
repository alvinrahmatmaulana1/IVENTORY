<template>
  <div>
    <h1 style="margin: 5%; border-bottom: 2px solid black; font-size: 200%;" class="min-w-flex md:border-black-500">
      Data Pegawai
    </h1>

    <div class="flex justify-end items-center">


      <div class="relative" style="margin-top: 30px; margin-right: 0.4cm;">
        <input v-model="searchTerm"  type="text" placeholder="Search"
          class="border border-gray-300 rounded-md py-1 px-3 focus:outline-none focus:border-indigo-500">
        <button class="absolute inset-y-0 right-0 flex items-center px-2">
          <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-gray-400" viewBox="0 0 20 20" fill="currentColor">
            <path fill-rule="evenodd"
              d="M8 3a5 5 0 100 10 5 5 0 000-10zM0 8a8 8 0 1116 0A8 8 0 010 8zm17.707 8.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 111.414-1.414l4 4z"
              clip-rule="evenodd" />
          </svg>
        </button>
      </div>

      <button data-modal-target="add-modal" data-modal-toggle="add-modal" @click="showAddPopup = true"
        class="bg-green-500 hover:bg-green-700 text-white font-bold py-1 px-3 border border-green-500 rounded"
        style="margin-top: 30px;">
        Add
      </button>
    </div>

  </div>

  <!-- component -->
  <div class="table-data overflow-y-auto border shadow max-h-96" style="margin-top: 10px;">
    <table class="min-w-full border-collapse block md:table">
      <thead class="block md:table-header-group">
        <tr
          class="border border-purple-900 md:border-none block md:table-row absolute -top-full md:top-auto -left-full md:left-auto md:relative">
          <th class="bg-purple-500 p-2 text-white font-bold md:border md:border-grey-500 text-left block md:table-cell">
            No
          </th>
          <th class="bg-purple-500 p-2 text-white font-bold md:border md:border-grey-500 text-left block md:table-cell">
            Nama Lengkap
          </th>
          <th class="bg-purple-500 p-2 text-white font-bold md:border md:border-grey-500 text-left block md:table-cell">
            Email
          </th>
          <th class="bg-purple-500 p-2 text-white font-bold md:border md:border-grey-500 text-left block md:table-cell">
            Action
          </th>
        </tr>
      </thead>
      <tbody class="block md:table-row-group">
        <tr class="bg-white-300 border border-white-500 md:border-none block md:table-row"
          v-for="(pegawai, index) in reversedPegawai" :key="pegawai.id">
          <td class="p-2 md:border md:border-white-500 text-center block md:table-cell">
            <span class="inline-block w-1/3 md:hidden font-bold">No</span>{{ index + 1 }}
          </td>
          <td class="p-2 md:border md:border-white-500 text-center block md:table-cell">
            <span class="inline-block w-1/3 md:hidden font-bold">Nama Lengkap</span>{{ pegawai.username }}
          </td>
          <td class="p-2 md:border md:border-white-500 text-center block md:table-cell">
            <span class="inline-block w-1/3 md:hidden font-bold">Email</span>{{ pegawai.email }}
          </td>
          <td class="p-2 md:border md:border-white-500 text-center block md:table-cell">
            <span class="inline-block w-1/3 md:hidden font-bold">Actions</span>
            <button type="button" @click="showeditPopup(pegawai)"
              class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-1 px-2 border border-blue-500 rounded">
              Edit
            </button>
            <button type="button" @click="deletePegawai(pegawai.id)"
              class="bg-red-500 hover:bg-red-700 text-white font-bold py-1 px-2 border border-red-500 rounded"
              style="margin: 5%">
              Delete
            </button>
            <!-- <button
              class="bg-green-500 hover:bg-green-700 text-white font-bold py-1 px-2 border border-green-500 rounded">
              <router-link to="">
                <span>view</span>
              </router-link>
            </button> -->
          </td>
        </tr>
      </tbody>
    </table>

    <form @submit.prevent="addData">
    <div v-if="showAddPopup"
      class="fixed inset-0 z-10 overflow-y-auto bg-gray-900 bg-opacity-50 flex justify-center items-center">
      <div class="bg-white p-8 rounded-lg shadow-xl w-96">
        <h2 class="text-lg font-semibold mb-4">Tambah Data</h2>
        <input v-model="formKey.username" type="text" class="border border-gray-300 p-2 rounded-lg mb-4 w-full"
          placeholder="Username">
        <input v-model="formKey.email" type="text" class="border border-gray-300 p-2 rounded-lg mb-4 w-full"
          placeholder="Email">
        <input v-model="formKey.password" type="password" class="border border-gray-300 p-2 rounded-lg mb-4 w-full"
          placeholder="Password">
        <div class="flex justify-end">
          <button class="bg-blue-500 text-white px-4 py-2 rounded-lg mr-2">Add</button>
          <button @click="cancelAdd" class="bg-red-500 text-white px-4 py-2 rounded-lg">Cancel</button>
        </div>
      </div>
    </div>
  </form>

     <form>
      <div v-if="showEditPopup"
        class="fixed inset-0 z-10 overflow-y-auto bg-gray-900 bg-opacity-50 flex justify-center items-center">
        <div class="bg-white p-8 rounded-lg shadow-xl w-96">
          <h2 class="text-lg font-semibold mb-4">Edit Data</h2>
          <input v-model="editData.username" type="text" class="border border-gray-300 p-2 rounded-lg mb-4 w-full"
            placeholder="Username">
          <input v-model="editData.email" type="text" class="border border-gray-300 p-2 rounded-lg mb-4 w-full"
            placeholder="Email">
          <input v-model="editData.password" type="password" class="border border-gray-300 p-2 rounded-lg mb-4 w-full"
            placeholder="Password">

          <div class="flex justify-end">
            <button @click="saveEditData" class="bg-blue-500 text-white px-4 py-2 rounded-lg mr-2">Edit</button>
            <button @click="cancelEdit" class="bg-red-500 text-white px-4 py-2 rounded-lg">Cancel</button>
          </div>
        </div>
      </div>
    </form>
  </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex';
import Swal from 'sweetalert2';
export default {
  data() {
    return {
      searchTerm: '',
      showAddPopup: false,
      showEditPopup: false,
      formKey: {
        username: "",
        email: "",
        password: ""
      },
      editData: {
        id: null, // Tambahkan properti id untuk menyimpan id pegawai yang diedit
        username: "",
        email: "",
        password: ""
      }
    };
  },
  computed: {
    ...mapGetters('pegawai', ['getPegawai']),
    reversedPegawai() {
      return this.getPegawai.filter((pegawai) => {
        return pegawai.username.toLowerCase().includes(this.searchTerm.toLowerCase())
      }).reverse()
    },
  },
  methods: {
    ...mapActions('pegawai', ['fetchPegawai', 'addPegawai', 'editPegawai', 'deletePegawai']),
    async addData() {
      const pegawai = {
        username: this.formKey.username,
        email: this.formKey.email,
        password: this.formKey.password
      };
      this.$store.dispatch('pegawai/addPegawai', pegawai)
        .then(response => {
          console.log("Pegawai added successfully:", response);
          this.showAddPopup = false; // Tutup pop-up tambah data setelah berhasil menambahkan pegawai
          Swal.fire({
            position: "top-end",
            icon: "success",
            title: "Data Berhasil Ditambahkan",
            showConfirmButton: false,
            timer: 1500
          });
        })
        .catch(error => {
          console.error('Error adding pegawai:', error);
          alert('Error adding pegawai: ' + error.message);
        });
    },

    showeditPopup(pegawai) {
      // Atur nilai properti editData berdasarkan data pegawai yang dipilih
      this.editData.id = pegawai.id;
      this.editData.username = pegawai.username;
      this.editData.email = pegawai.email;
      this.editData.password = ''; // Kosongkan password saat menampilkan pop-up edit
      this.showEditPopup = true; // Tampilkan pop-up edit
    },
    async saveEditData() {
      const editedPegawai = {
        id: this.editData.id, // Gunakan id pegawai yang disimpan dalam properti editData
        username: this.editData.username,
        email: this.editData.email,
        password: this.editData.password
      };
      this.$store.dispatch('pegawai/editPegawai', editedPegawai)
        .then(response => {
          console.log("Pegawai edited successfully:", response);
          this.showEditPopup = false; // Tutup pop-up edit setelah berhasil menyimpan perubahan
          Swal.fire({
            position: "top-end",
            icon: "success",
            title: "Data Berhasil Diubah",
            showConfirmButton: false,
            timer: 1500
          });
        })
        .catch(error => {
          console.error('Error editing pegawai:', error);
          alert('Error editing pegawai: ' + error.message);
        });
    },
    
    cancelAdd() {
      this.showAddPopup = false;
    },
    cancelEdit() {
      this.showEditPopup = false;
    },
  },
  created() {
    this.fetchPegawai();
  },
};
</script>