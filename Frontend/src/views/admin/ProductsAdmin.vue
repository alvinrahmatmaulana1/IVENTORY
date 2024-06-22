<template>
  <div>
    <h1 style="margin: 5%; border-bottom: 2px solid black; font-size: 200%;" class="min-w-flex md:border-black-500">
      Data Barang
    </h1>

    <div class="flex justify-end items-center">
      <div class="relative" style="margin-top: 30px; margin-right: 0.4cm;">
        <input v-model="searchTerm" type="text" placeholder="Search"
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
            Gambar Barang
          </th>
          <th class="bg-purple-500 p-2 text-white font-bold md:border md:border-grey-500 text-left block md:table-cell">
            Kode Barang
          </th>
          <th class="bg-purple-500 p-2 text-white font-bold md:border md:border-grey-500 text-left block md:table-cell">
            Nama Barang
          </th>
          <th class="bg-purple-500 p-2 text-white font-bold md:border md:border-grey-500 text-left block md:table-cell">
            Harga
          </th>
          <th class="bg-purple-500 p-2 text-white font-bold md:border md:border-grey-500 text-left block md:table-cell">
            Stok
          </th>
          <th class="bg-purple-500 p-2 text-white font-bold md:border md:border-grey-500 text-left block md:table-cell">
            Action
          </th>
        </tr>
      </thead>
      <tbody class="block md:table-row-group">
        <tr class="bg-white-300 border border-white-500 md:border-none block md:table-row"
          v-for="(product, index) in reversedProduct" :key="product.id">
          <td class="p-2 md:border md:border-white-500 text-center block md:table-cell">
            <span class="inline-block w-1/3 md:hidden font-bold">No</span>{{ index + 1 }}
          </td>
          <td class="p-2 md:border md:border-white-500 text-center block md:table-cell">
            <span class="inline-block w-1/3 md:hidden font-bold">Gambar Barang</span><img
              :src="formatImagePath(product.image_barang)" alt="Product Image" style="width: 100px;">
          </td>
          <td class="p-2 md:border md:border-white-500 text-center block md:table-cell">
            <span class="inline-block w-1/3 md:hidden font-bold">Kode Barang</span>{{ product.kode_barang }}
          </td>
          <td class="p-2 md:border md:border-white-500 text-center block md:table-cell">
            <span class="inline-block w-1/3 md:hidden font-bold">Nama Barang</span>{{ product.nama_barang }}
          </td>
          <td class="p-2 md:border md:border-white-500 text-center block md:table-cell">
            <span class="inline-block w-1/3 md:hidden font-bold">Harga</span>{{ formatRupiah(product.harga) }}
          </td>
          <td class="p-2 md:border md:border-white-500 text-center block md:table-cell">
            <span class="inline-block w-1/3 md:hidden font-bold">Stok</span>{{ product.stok }}
          </td>
          <td class="p-2 md:border md:border-white-500 text-center block md:table-cell">
            <span class="inline-block w-1/3 md:hidden font-bold">Actions</span>
            <button type="button" @click="openEditPopup(product)"
              class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-1 px-2 border border-blue-500 rounded">
              Edit
            </button>
            
            <button type="button" @click="deleteProduct(product.id)"
              class="bg-red-500 hover:bg-red-700 text-white font-bold py-1 px-2 border border-red-500 rounded"
              style="margin: 5%">
              Delete
            </button>
            <!-- <button
              class="bg-green-500 hover:bg-green-700 text-white font-bold py-1 px-2 border border-green-500 rounded">
              <router-link to="">
                <span>view</span>
              </router-link>
            </button>  -->
          </td>
        </tr>
      </tbody>
    </table>
    <form @submit.prevent="addNewProduct">
      <div v-if="showAddPopup"
        class="fixed inset-0 z-10 overflow-y-auto bg-gray-900 bg-opacity-50 flex justify-center items-center">
        <div class="bg-white p-8 rounded-lg shadow-xl w-96">
          <h2 class="text-lg font-semibold mb-4">Tambah Data</h2>
          <input v-model="formKey.nama_barang" type="text" class="border border-gray-300 p-2 rounded-lg mb-4 w-full"
            placeholder="Nama Barang">
          <input v-model="formKey.harga" type="number" class="border border-gray-300 p-2 rounded-lg mb-4 w-full"
            placeholder="Harga">
          <input v-model="formKey.stok" type="number" class="border border-gray-300 p-2 rounded-lg mb-4 w-full"
            placeholder="Stok">

          <input type="file" @change="handleFileUpload" name="subject" id="subject" placeholder="Enter your subject"
            class="w-full rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base font-medium text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md" />

          <div class="flex mt-4 justify-end">
            <button class="bg-blue-500 text-white px-4 py-2 rounded-lg mr-2">Add</button>
            <button @click="cancelAdd" class="bg-red-500 text-white px-4 py-2 rounded-lg">Cancel</button>
          </div>
        </div>
      </div>
    </form>

    <form @submit.prevent="editProducts">
      <div v-if="showeditPopup"
        class="fixed inset-0 z-10 overflow-y-auto bg-gray-900 bg-opacity-50 flex justify-center items-center">
        <div class="bg-white p-8 rounded-lg shadow-xl w-96">
          <h2 class="text-lg font-semibold mb-4">Edit Data</h2>
          <input v-model="formKeyedit.nama_barang" type="text" class="border border-gray-300 p-2 rounded-lg mb-4 w-full"
            placeholder="Nama Barang">
          <input v-model="formKeyedit.harga" type="number" class="border border-gray-300 p-2 rounded-lg mb-4 w-full"
            placeholder="Harga">
          <input v-model="formKeyedit.stok" type="number" class="border border-gray-300 p-2 rounded-lg mb-4 w-full"
            placeholder="Stok">
          <input type="file" @change="handleEditFileUpload" name="edit-subject" id="edit-subject"
            placeholder="Upload gambar kota"
            class="w-full rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base font-medium text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md" />
          <div class="flex mt-4 justify-end">
            <button class="bg-blue-500 text-white px-4 py-2 rounded-lg mr-2">Add</button>
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
      showeditPopup: false,
      formKey: {
        nama_barang: "",
        harga: "",
        stok: "",
        image_barang: null
      },
      formKeyedit: {
        id: null,
        nama_barang: "",
        harga: "",
        stok: "",
        image_barang: null
      },
    }
  },
  computed: {
    ...mapGetters('products', ['getProducts']),
    reversedProduct() {
      return this.getProducts.filter((products) => {
        return products.nama_barang.toLowerCase().includes(this.searchTerm.toLowerCase())
      }).reverse()
    },
  },
  methods: {
    ...mapActions('products', ['fetchProducts', 'addProduct', 'editProduct','deleteProduct']),
    formatRupiah(number) {
      const formatter = new Intl.NumberFormat("id-ID", {
        style: "currency",
        currency: "IDR"
      });
      return formatter.format(number);
    },
    formatImagePath(path) {
      return 'http://localhost:3000' + path;
    },
    handleFileUpload(event) {
      const fileInput = event.target.files[0];
      if (!fileInput) {
        this.formKey.image_barang = null; // Jika tidak ada file, kosongkan gambar
        return;
      }
      const allowedTypes = ["image/png", "image/jpeg", "image/jpg"];
      if (!allowedTypes.includes(fileInput.type)) {
        Swal.fire({
          icon: 'error',
          title: 'Oops...',
          text: 'Invalid file type. Please upload a valid image file.'
        });
        return;
      }

      const maxSize = 5 * 1024 * 1024; // 5 MB in bytes
      if (fileInput.size > maxSize) {
        Swal.fire({
          icon: 'error',
          title: 'Oops...',
          text: 'File size exceeds the limit. Please upload a file less than 5 MB.'
        });
        return;
      }
      // Set file object to eventForm
      this.formKey.image_barang = fileInput;
    },

    handleEditFileUpload(event) {
      const fileInput = event.target.files[0];
      if (!fileInput) {
        this.formKeyedit.image_barang = null; // Jika tidak ada file, kosongkan gambar
        return;
      }

      const allowedTypes = ["image/png", "image/jpeg", "image/jpg"];
      if (!allowedTypes.includes(fileInput.type)) {
        Swal.fire({
          icon: 'error',
          title: 'Oops...',
          text: 'Invalid file type. Please upload a valid image file.'
        });
        return;
      }

      const maxSize = 5 * 1024 * 1024; // 5 MB in bytes
      if (fileInput.size > maxSize) {
        Swal.fire({
          icon: 'error',
          title: 'Oops...',
          text: 'File size exceeds the limit. Please upload a file less than 5 MB.'
        });
        return;
      }

      this.formKeyedit.image_barang = fileInput;
    },
    async addNewProduct() {
      try {
        const formData = new FormData();
        Object.keys(this.formKey).forEach((key) => {
          if (key !== "image_barang") {
            formData.append(key, this.formKey[key]);
          }
        });

        // Adding file to FormData
        formData.append("image_barang", this.formKey.image_barang);

        // Calling action in store to create event
        await this.addProduct(formData);

        // Tampilkan SweetAlert2
        Swal.fire({
          title: 'Success!',
          text: 'City added successfully!',
          icon: 'success',
          confirmButtonText: 'OK'
        }).then(() => {
          // Setelah pengguna menekan tombol "OK", barulah halaman dimuat ulang
          window.location.reload();
        });
      } catch (error) {
        console.log(error);
      }
    },
    openEditPopup(product) {
      this.formKeyedit.id = product.id;
      this.formKeyedit.nama_barang = product.nama_barang;
      this.formKeyedit.harga = product.harga;
      this.formKeyedit.stok = product.stok;
      this.formKeyedit.image_barang = product.image_barang; // Set image URL

      this.showeditPopup = true; // Show edit popup
    },

//     async editProducts() {
//   try {
//     // Make sure edited product has a valid ID before making PUT request
//     if (!this.formKeyedit.id) {
//       console.error('Invalid product ID');
//       return;
//     }

//     // Create FormData object to send data to server
//     const formData = new FormData();

//     // Add required fields to FormData
//     formData.append('id', this.formKeyedit.id);
//     formData.append('nama_barang', this.formKeyedit.nama_barang);
//     formData.append('harga', this.formKeyedit.harga);
//     formData.append('stok', this.formKeyedit.stok);

//     // Add product image if available
//     if (this.formKeyedit.image_barang) {
//       formData.append('image_barang', this.formKeyedit.image_barang);
//     }

//     // Create axios instance with custom configuration
//     const axiosInstance = axios.create({
//       headers: {
//         'Authorization': `Bearer ${localStorage.getItem("token")}`,
//         'Content-Type': 'multipart/form-data'
//       }
//     });

//     // Make PUT request using the custom axios instance
//     await axiosInstance.put(`/api/v1/products/${this.formKeyedit.id}`, formData);

//     // Show success message
//     Swal.fire({
//       title: 'Success!',
//       text: 'Product updated successfully!',
//       icon: 'success',
//       confirmButtonText: 'OK'
//     }).then(() => {
//       // Reload page after update succeeds
//       window.location.reload();
//     });
//   } catch (error) {
//     // Handle error
//     console.error('Error updating product:', error);

//     // Show error message
//     Swal.fire({
//       title: 'Error',
//       text: 'Failed to update product. Please try again later.',
//       icon: 'error',
//       confirmButtonText: 'OK'
//     });
//   }
// },

async editProducts() {
  try {
    // Memastikan bahwa editedProduct memiliki ID yang valid sebelum membuat permintaan PUT
    if (!this.formKeyedit.id) {
        console.error('Invalid product ID');
        return;
    }

    // Membuat objek FormData untuk mengirim data ke server
    const formData = new FormData();

    // Menambahkan bidang-bidang yang diperlukan ke dalam FormData
    formData.append('nama_barang', this.formKeyedit.nama_barang);
    formData.append('harga', this.formKeyedit.harga);
    formData.append('stok', this.formKeyedit.stok);

    // Menambahkan gambar produk jika tersedia
    if (this.formKeyedit.image_barang) {
        formData.append('image_barang', this.formKeyedit.image_barang);
    }

    // Panggil action editProduct dari store dengan payload yang sesuai
    await this.$store.dispatch('products/editProduct', { id: this.formKeyedit.id, formData });

    // Menampilkan pesan sukses
    Swal.fire({
        title: 'Success!',
        text: 'Product updated successfully!',
        icon: 'success',
        confirmButtonText: 'OK'
    }).then(() => {
        // Reload halaman setelah pembaruan berhasil
        window.location.reload();
    });
  } catch (error) {
    // Menangani kesalahan
    console.error('Error updating product:', error);

    // Menampilkan pesan kesalahan
    Swal.fire({
        title: 'Error',
        text: 'Failed to update product. Please try again later.',
        icon: 'error',
        confirmButtonText: 'OK'
    });
  }
},


    cancelAdd() {
      this.showAddPopup = false;
    },
    cancelEdit() {
      this.showeditPopup = false;
    },
  },
  created() {
    this.fetchProducts();
  }
}
</script>
