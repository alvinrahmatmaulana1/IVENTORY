<template>
    <div class="isolate bg-white px-6 py-24 sm:py-32 lg:px-8">
        <div class="absolute inset-x-0 top-[-10rem] -z-10 transform-gpu overflow-hidden blur-3xl sm:top-[-20rem]"
            aria-hidden="true">
            <div class="relative left-1/2 -z-10 aspect-[1155/678] w-[36.125rem] max-w-none -translate-x-1/2 rotate-[30deg] bg-gradient-to-tr from-[#ff80b5] to-[#9089fc] opacity-30 sm:left-[calc(50%-40rem)] sm:w-[72.1875rem]"
                style="clip-path: polygon(74.1% 44.1%, 100% 61.6%, 97.5% 26.9%, 85.5% 0.1%, 80.7% 2%, 72.5% 32.5%, 60.2% 62.4%, 52.4% 68.1%, 47.5% 58.3%, 45.2% 34.5%, 27.5% 76.7%, 0.1% 64.9%, 17.9% 100%, 27.6% 76.8%, 76.1% 97.7%, 74.1% 44.1%)">
            </div>
        </div>
        <div class="mx-auto max-w-2xl text-center">
            <h2 class="text-3xl font-bold tracking-tight text-gray-900 sm:text-4xl">Transaksi Masuk</h2>
            <p class="mt-2 text-lg leading-8 text-gray-600">Lakukan Transaksi Masuk, Transaksi Akan Langsung Masuk Ke
                Laporan Dan Tidak Bisa Di Hapus Atau Di Rubah</p>
        </div>
        <form @submit.prevent="submitTransaction" action="" method="POST" class="mx-auto mt-16 max-w-xl sm:mt-20">
            <div class="sm:col-span-2">
                <label for="company" class="block text-sm font-semibold leading-6 text-black">Kode Barang</label>
                <div class="mt-2.5">
                    <input v-model="transaksi.kode_barang" @blur="fetchProductAndUser" type="text" name="" id=""
                        autocomplete="organization"
                        class="block w-full rounded-md border-0 px-3.5 py-2 text-gray-900 shadow-sm ring-1 ring-inset shadow-blue-500 ring-blue-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-blue-400 sm:text-sm sm:leading-6">
                </div>
            </div>
            <div class="grid grid-cols-1 gap-x-8 gap-y-6 sm:grid-cols-2 mt-2.5">
                <div>
                    <label for="first-name" class="block text-sm font-semibold leading-6 text-black">Nama Barang</label>
                    <div class="mt-2.5">
                        <input v-model="transaksi.nama_barang" disabled type="text" name="first-name" id="first-name"
                            autocomplete="given-name"
                            class="block w-full rounded-md border-0 px-3.5 py-2 text-gray-900 shadow-sm shadow-blue-500 ring-1 ring-inset ring-blue-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-blue-400 sm:text-sm sm:leading-6">
                    </div>
                </div>
                <div>
                    <label for="last-name" class="block text-sm font-semibold leading-6 text-black">Harga</label>
                    <div class="mt-2.5">
                        <input v-model="transaksi.harga" disabled type="text" name="last-name" id="last-name"
                            autocomplete="family-name"
                            class="block w-full rounded-md border-0 px-3.5 py-2 text-gray-900 shadow-sm ring-1 ring-inset shadow-blue-500 ring-blue-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-blue-400 sm:text-sm sm:leading-6">
                    </div>
                </div>

                <div class="sm:col-span-2">
                    <label for="" class="block text-sm font-semibold leading-6 text-black">Tanggal Keluar</label>
                    <div class="mt-2.5">
                        <input v-model="transaksi.tanggal_masuk" type="date" name="" id="" autocomplete=""
                            class="block w-full rounded-md border-0 px-3.5 py-2 text-gray-900 shadow-sm ring-1 ring-inset shadow-blue-500 ring-blue-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-blue-400 sm:text-sm sm:leading-6">
                    </div>
                </div>
                <div class="sm:col-span-2">
                    <label for="email" class="block text-sm font-semibold leading-6 text-black">Jumlah Keluar</label>
                    <div class="mt-2.5">
                        <input v-model="transaksi.jumlah_masuk" type="number" name="" id="" autocomplete=""
                            class="block w-full rounded-md border-0 px-3.5 py-2 text-gray-900 shadow-sm ring-1 ring-inset shadow-blue-500 ring-blue-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-blue-400 sm:text-sm sm:leading-6">
                    </div>
                </div>
            </div>
            <div class="mt-10">
                <button :disabled="!isFormValid" type="submit"
                    class="block w-full rounded-md bg-cyan-600 px-3.5 py-2.5 text-center text-sm font-semibold text-white shadow-sm hover:bg-green-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">Let's
                    talk</button>
            </div>
        </form>
    </div>
</template>

<script>
import axios from "axios";
import Swal from 'sweetalert2';
export default {
    data() {
        return {
            transaksi: {
                username: '',
                tanggal_masuk: '',
                kode_barang: '',
                nama_barang: '',
                harga: '',
                jumlah_masuk: 0,
                user_id: '', // Tambahkan properti user_id
                product_id: '' // Tambahkan properti product_id
            }
        };
    },
    computed: {
        isFormValid() {
            return (
                this.transaksi.product_id &&
                this.transaksi.user_id &&
                this.transaksi.tanggal_masuk &&
                this.transaksi.jumlah_masuk > 0
            );
        },
        loggedInUser() {
            return this.$store.dispatch('auth/fetchMe');
        }
    },
    methods: {
        fetchProductAndUser() {
            const token = localStorage.getItem("token");
            axios.all([
                axios.get(`/api/v1/products/${this.transaksi.kode_barang}`, {
                    headers: {
                        Authorization: `Bearer ${token}`
                    }
                }),
                this.loggedInUser
            ])
                .then(axios.spread((productResponse, userResponse) => {
                    this.transaksi.nama_barang = productResponse.data.nama_barang;
                    this.transaksi.harga = productResponse.data.harga;
                    this.transaksi.user_id = userResponse.id; // Gunakan id dari userResponse
                    this.transaksi.product_id = productResponse.data.id;
                }))
                .catch(error => {
                    console.error('Error fetching product and user:', error.message);
                });
        },
        submitTransaction() {
            // Lakukan pengiriman transaksi
            this.$store.dispatch('transaksi_masuks/addTransaksiMasuk', this.transaksi)
                .then(response => {
                    console.log("Transaction added successfully:", response);
                    this.resetForm();
                    Swal.fire({
                        position: "top-end",
                        icon: "success",
                        title: "Transaksi Berhasil",
                        showConfirmButton: false,
                        timer: 1500
                    });
                })
                .catch(error => {
                    console.error('Error adding transaction:', error);
                    alert('Error adding transaction: ' + error.message);
                });
        },
        resetForm() {
            this.transaksi = {
                username: '',
                tanggal_masuk: '',
                kode_barang: '',
                nama_barang: '',
                harga: '',
                jumlah_masuk: 0,
                user_id: '', // Atur ulang nilai user_id
                product_id: '' // Atur ulang nilai product_id
            };
        }
    },
    // created() {
    //     this.getUsername();
    // }
};
</script>