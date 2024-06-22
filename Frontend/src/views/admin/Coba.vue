<template>
    <div>
        <h1 style="margin: 2%; border-bottom: 2px solid black; font-size: 200%;"
            class="min-w-flex md:border-black-500">
            City table
        </h1>

        <button data-modal-target="add-modal" data-modal-toggle="add-modal"
            class="bg-green-500 hover:bg-green-700 text-white font-bold py-1 px-3 border border-green-500 rounded"
            style="margin-top: 30px; display: flex; justify-content: flex-end; margin-left: auto; margin-right: 160px;">
            <img src="/src/assets/add-circle-svgrepo-com.svg" alt="add-image"
                style="width: 20px; height: auto; margin-right: 5px; filter: brightness(0) invert(1);">
            Add
        </button>
        <div id="add-modal" tabindex="-1" aria-hidden="true"
            class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 justify-center items-center w-full md:inset-0 h-[calc(100%-1rem)] max-h-full">
            <div class="relative p-4 w-full max-w-md max-h-full">
                <!-- Modal content -->
                <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
                    <!-- Modal header -->
                    <div
                        class="flex items-center justify-between p-4 md:p-5 border-b rounded-t dark:border-gray-600">
                        <h3 class="text-xl font-semibold text-gray-900 dark:text-white">
                            Sign in to our platform
                        </h3>
                        <button type="button"
                            class="end-2.5 text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ms-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white"
                            data-modal-hide="add-modal">
                            <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none"
                                viewBox="0 0 14 14">
                                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"
                                    stroke-width="2" d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6" />
                            </svg>
                            <span class="sr-only">Close modal</span>
                        </button>
                    </div>
                    <!-- Modal body -->
                    <div class="p-4 md:p-5">
                        <form @submit.prevent="addNewCity" method="POST">
                            <div class="mb-5">
                                <label for="name" class="mb-3 block text-base font-medium text-[#07074D]">
                                    City name
                                </label>
                                <input type="text" v-model="citydata.city" name="name" id="name"
                                    placeholder="City Name"
                                    class="w-full rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base font-medium text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md" />
                            </div>
                            <div class="mb-5">
                                <label for="email" class="mb-3 block text-base font-medium text-[#07074D]">
                                    Province
                                </label>
                                <select v-model="citydata.province_id" name="province_id" id="province_id">
                                    <option value="">Select Province</option>
                                    <option v-for="province in getProvince" :key="province.id" :value="province.id">
                                        {{
                                            province.province_name }}
                                    </option>
                                </select>
                            </div>
                            <div class="mb-5">
                                <label for="subject" class="mb-3 block text-base font-medium text-[#07074D]">
                                    City Image
                                </label>
                                <input type="file" @change="handleFileUpload" name="subject" id="subject"
                                    placeholder="Enter your subject"
                                    class="w-full rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base font-medium text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md" />
                            </div>
                            <div class="flex">
                                <button type="submit"
                                    class="hover:shadow-form rounded-md bg-[#6A64F1] py-3 px-8 text-base font-semibold text-white outline-none">
                                    Submit
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- component -->
    <div class="table-data" style="margin-top: 10px;">
        <table class="min-w-full border-collapse block md:table">
            <thead class="block md:table-header-group">
                <tr
                    class="border border-purple-900 md:border-none block md:table-row absolute -top-full md:top-auto -left-full md:left-auto md:relative">
                    <th
                        class="bg-purple-500 p-2 text-white font-bold md:border md:border-grey-500 text-left block md:table-cell">
                        Id
                    </th>
                    <th
                        class="bg-purple-500 p-2 text-white font-bold md:border md:border-grey-500 text-left block md:table-cell">
                        City Name
                    </th>
                    <th
                        class="bg-purple-500 p-2 text-white font-bold md:border md:border-grey-500 text-left block md:table-cell">
                        Image
                    </th>
                    <th
                        class="bg-purple-500 p-2 text-white font-bold md:border md:border-grey-500 text-left block md:table-cell">
                        Province Name
                    </th>
                    <th
                        class="bg-purple-500 p-2 text-white font-bold md:border md:border-grey-500 text-left block md:table-cell">
                        Action
                    </th>
                </tr>
            </thead>
            <tbody class="block md:table-row-group">
                <tr class="bg-white-300 border border-white-500 md:border-none block md:table-row"
                    v-for="city in getCity" :key="city.id">
                    <td class="p-2 md:border md:border-white-500 text-left block md:table-cell">
                        <span class="inline-block w-1/3 md:hidden font-bold">Id</span>{{ city.id }}
                    </td>
                    <td class="p-2 md:border md:border-white-500 text-left block md:table-cell">
                        <span class="inline-block w-1/3 md:hidden font-bold">City Name</span>{{ city.city }}
                    </td>
                    <td class="p-2 md:border md:border-white-500 text-left block md:table-cell">
                        <span class="inline-block w-1/3 md:hidden font-bold">City Name</span><img :src="city.image"
                            alt="city.image" style="max-width: 100px;">
                    </td>
                    <td class="p-2 md:border md:border-white-500 text-left block md:table-cell">
                        <span class="inline-block w-1/3 md:hidden font-bold">Province</span>{{ city.province_name }}
                    </td>
                    <td class="p-2 md:border md:border-white-500 text-left block md:table-cell">
                        <span class="inline-block w-1/3 md:hidden font-bold">Actions</span>
                        <button @click="loadDataForCity(city.id)" type="button"
                            :data-modal-target="'edit-modal-' + city.id"
                            :data-modal-toggle="'edit-modal-' + city.id"
                            class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-1 px-2 border border-blue-500 rounded">
                            Edit
                        </button>
                        <div :id="'edit-modal-' + city.id" tabindex="-1" aria-hidden="true"
                            class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 justify-center items-center w-full md:inset-0 h-[calc(100%-1rem)] max-h-full">
                            <div class="relative p-4 w-full max-w-md max-h-full">
                                <!-- Konten Modal -->
                                <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
                                    <!-- Header Modal -->
                                    <div
                                        class="flex items-center justify-between p-4 md:p-5 border-b rounded-t dark:border-gray-600">
                                        <h3 class="text-xl font-semibold text-gray-900 dark:text-white">
                                            Edit Kota
                                        </h3>
                                        <button type="button"
                                            class="end-2.5 text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ms-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white"
                                            :data-modal-hide="'edit-modal-' + city.id">
                                            <svg class="w-3 h-3" aria-hidden="true"
                                                xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 14">
                                                <path stroke="currentColor" stroke-linecap="round"
                                                    stroke-linejoin="round" stroke-width="2"
                                                    d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6" />
                                            </svg>
                                            <span class="sr-only">Tutup modal</span>
                                        </button>
                                    </div>
                                    <!-- Tubuh Modal -->
                                    <div class="p-4 md:p-5">
                                        <form @submit.prevent="editCity" method="POST">
                                            <div class="mb-5">
                                                <label for="edit-city"
                                                    class="mb-3 block text-base font-medium text-[#07074D]">
                                                    Nama Kota
                                                </label>
                                                <input type="text" v-model="editedCity.city" name="edit-city"
                                                    id="edit-city" placeholder="Nama Kota"
                                                    class="w-full rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base font-medium text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md" />
                                            </div>
                                            <div class="mb-5">
                                                <label for="edit-province"
                                                    class="mb-3 block text-base font-medium text-[#07074D]">
                                                    Provinsi
                                                </label>
                                                <select v-model="editedCity.province_id" name="edit-province"
                                                    id="edit-province">
                                                    <option value="">Pilih Provinsi</option>
                                                    <option v-for="province in getProvince" :key="province.id"
                                                        :value="province.id">{{ province.province_name }}</option>
                                                </select>
                                            </div>
                                            <div class="mb-5">
                                                <label for="edit-subject"
                                                    class="mb-3 block text-base font-medium text-[#07074D]">
                                                    Gambar Kota
                                                </label>
                                                <input type="file" @change="handleEditFileUpload"
                                                    name="edit-subject" id="edit-subject"
                                                    placeholder="Upload gambar kota"
                                                    class="w-full rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base font-medium text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md" />
                                            </div>
                                            <div class="flex">
                                                <button type="submit"
                                                    class="hover:shadow-form rounded-md bg-[#6A64F1] py-3 px-8 text-base font-semibold text-white outline-none">
                                                    Simpan Perubahan
                                                </button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- edit end -->
                        <button type="button" @click="DeleteCity(city.id)"
                            class="bg-red-500 hover:bg-red-700 text-white font-bold py-1 px-2 border border-red-500 rounded"
                            style="margin: 5%">
                            Delete
                        </button>
                        <button
                            class="bg-green-500 hover:bg-green-700 text-white font-bold py-1 px-2 border border-green-500 rounded">
                            <router-link :to="{ name: 'DetailCity', params: { id: city.id } }">
                                <span>view</span>
                            </router-link>
                        </button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</template>

<script>
import { mapGetters, mapActions } from "vuex";
import Swal from 'sweetalert2'

export default {
data() {
    return {
        citydata: {
            city: "",
            city_image: null, // Mengubah menjadi null untuk memastikan nilai awalnya adalah null
            province_id: "", // Menambahkan deklarasi province_id di dalam data komponen
        },
        editedCity: {
            city: "",
            city_image: null,
            province_id: "",
        }
    }
},
computed: {
    ...mapGetters("province", ["getProvince"]),
    ...mapGetters("city", ["getCity", "getCityById"]),


},
methods: {
    ...mapActions("province", ["fetchProvince",]),
    ...mapActions("city", ["fetchCity", "DeleteCity", "AddCity", "editCity", "fetchSinglecity"]),
    async loadDataForCity(cityId) {
        try {
            await this.fetchSinglecity(cityId);
            const city = this.getCityById(cityId); // Pastikan cityId yang digunakan adalah ID yang valid
            if (city) {
                // Tetapkan nilai editedCity menggunakan data city yang dipilih
                this.editedCity = {
                    id: city.id,
                    city: city.city,
                    province_id: city.province_id,
                    // Tetapkan nilai default untuk city_image jika tidak ada gambar yang tersedia
                    city_image: city.image ? city.image : null,
                };
            } else {
                // Atur editedCity menjadi null jika city tidak ditemukan
                this.editedCity = null;
            }
        } catch (error) {
            console.error('Error loading city data for edit:', error);
        }
    },


    handleFileUpload(event) {
        const fileInput = event.target.files[0];
        if (!fileInput) return; // Tambahkan pengecekan null di sini
        if (fileInput) {
            const allowedTypes = ["image/png", "image/jpeg", "image/jpg"];
            if (!allowedTypes.includes(fileInput.type)) {
                this.$message.error(
                    "Invalid file type. Please upload a valid image file."
                );
                return;
            }

            const maxSize = 5 * 1024 * 1024; // 5 MB in bytes
            if (fileInput.size > maxSize) {
                this.$message.error(
                    "File size exceeds the limit. Please upload a file less than 5 MB."
                );
                return;
            }
            // Set file object to eventForm
            this.citydata.city_image = fileInput;
        } else {
            this.citydata.city_image = null;
        }
    },
    handleEditFileUpload(event) {
        const fileInput = event.target.files[0];
        if (!fileInput) return;

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

        this.editedCity.city_image = fileInput;
    },
    async addNewCity() {
        try {
            const formData = new FormData();
            Object.keys(this.citydata).forEach((key) => {
                if (key !== "city_image") {
                    formData.append(key, this.citydata[key]);
                }
            });

            // Adding file to FormData
            formData.append("city_image", this.citydata.city_image);

            // Calling action in store to create event
            await this.AddCity(formData);

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
    async editCity() {
        try {
            // Memastikan bahwa editedCity memiliki ID yang valid sebelum membuat permintaan PUT
            if (!this.editedCity.id) {
                console.error('Invalid city ID');
                return;
            }

            // Membuat objek FormData untuk mengirim data ke server
            const formData = new FormData();

            // Menambahkan bidang-bidang yang diperlukan ke dalam FormData
            formData.append('id', this.editedCity.id);
            formData.append('city', this.editedCity.city);
            formData.append('province_id', this.editedCity.province_id);

            // Menambahkan gambar kota jika tersedia
            if (this.editedCity.city_image) {
                formData.append('city_image', this.editedCity.city_image);
            }

            // Melakukan permintaan PUT ke server
            await this.$store.dispatch('city/editCity', { cityId: this.editedCity.id, formData });

            // Menampilkan pesan sukses
            Swal.fire({
                title: 'Success!',
                text: 'City updated successfully!',
                icon: 'success',
                confirmButtonText: 'OK'
            }).then(() => {
                // Reload halaman setelah pembaruan berhasil
                window.location.reload();
            });
        } catch (error) {
            // Menangani kesalahan
            console.error('Error updating city:', error);

            // Menampilkan pesan kesalahan
            Swal.fire({
                title: 'Error',
                text: 'Failed to update city. Please try again later.',
                icon: 'error',
                confirmButtonText: 'OK'
            });
        }
    },

},
created() {
    this.fetchProvince();
    this.fetchCity();
   }
}
</script>