<template>
  <div>
    <h1 style="margin: 5%; border-bottom: 2px solid black; font-size: 200%;" class="min-w-flex md:border-black-500">
      Data Transaksi Masuk
    </h1>

    <div class="flex justify-end items-center">
      <div class="relative" style="margin-top: 30px; margin-right: 0.4cm;">
        <input v-model="searchTerm" type="date" placeholder="Search"
          class="border border-gray-300 rounded-md py-1 px-3 focus:outline-none focus:border-indigo-500">
        
      </div>
      <router-link to="/admin/transaksi_masuk/add">
      <button data-modal-target="add-modal" data-modal-toggle="add-modal"
        class="bg-green-500 hover:bg-green-700 text-white font-bold py-1 px-3 border border-green-500 rounded"
        style="margin-top: 30px;">
        Add
      </button>
    </router-link>
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
            Tanggal Masuk
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
            Jumlah Masuk
          </th>
          
        </tr>
      </thead>
      <tbody class="block md:table-row-group">
        <tr class="bg-white-300 border border-white-500 md:border-none block md:table-row"
        v-for="(transaksi, index) in filteredTransaksi" :key="transaksi.id">
          <td class="p-2 md:border md:border-white-500 text-center block md:table-cell">
            <span class="inline-block w-1/3 md:hidden font-bold">No</span>{{ index + 1 }}
          </td>
          <td class="p-2 md:border md:border-white-500 text-center block md:table-cell">
            <span class="inline-block w-1/3 md:hidden font-bold">Tanggal Masuk</span>{{transaksi.tanggal_masuk}}
          </td>
          <td class="p-2 md:border md:border-white-500 text-center block md:table-cell">
            <span class="inline-block w-1/3 md:hidden font-bold">Kode Barang</span>{{transaksi.Product.kode_barang}}
          </td>
          <td class="p-2 md:border md:border-white-500 text-center block md:table-cell">
            <span class="inline-block w-1/3 md:hidden font-bold">Nama Barang</span>{{transaksi.Product.nama_barang}}
          </td>
          <td class="p-2 md:border md:border-white-500 text-center block md:table-cell">
            <span class="inline-block w-1/3 md:hidden font-bold">Harga</span>{{formatRupiah( transaksi.Product.harga)}}
          </td>
          <td class="p-2 md:border md:border-white-500 text-center block md:table-cell">
            <span class="inline-block w-1/3 md:hidden font-bold">Jumlah Masuk</span>{{ transaksi.jumlah_masuk }}
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>
  
<script>
import { mapGetters, mapActions } from 'vuex'

export default {
  data() {
    return {
      searchTerm: '',
    }
  },
  computed: {
    ...mapGetters('transaksi_masuks', ['getTransaksi_masuks']),
    filteredTransaksi() {
      return this.getTransaksi_masuks.filter((transaksi) => {
        return transaksi.tanggal_masuk.toLowerCase().includes(this.searchTerm.toLowerCase())
      }).reverse()
    },
  },
  methods: {
    ...mapActions('transaksi_masuks', ['fetchMe']),
    formatRupiah(number) {
      const formatter = new Intl.NumberFormat("id-ID", {
        style: "currency",
        currency: "IDR"
      });
      return formatter.format(number);
    },
  },
  created() {
    this.fetchMe()
  },
}
</script>