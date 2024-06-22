<!-- <template>
  <div>
    <div class="mx-auto max-w-screen-lg px-4 py-8 sm:px-8">
      <div class="flex items-center justify-between pb-6">
        <div class="ml-32 mt-20">
          <h1 class="font-semibold  text-gray-700">Data Laporan Keluar</h1>
          <span class="text-xs text-gray-500"></span>

        </div>

        <div class="flex items-center justify-between">
          <div class='max-w-md mx-auto mt-20 ml-2'>
            <div
              class=" relative flex items-center w-full h-12 rounded-lg focus-within:shadow-lg bg-white overflow-hidden">
              <div class="grid place-items-center h-full w-12 bg-gray-100 text-gray-300">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24"
                  stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                    d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                </svg>
              </div>
              <input v-model="searchTerm"
                class=" peer h-full w-full outline-none text-sm bg-gray-100 text-gray-700 pr-2" type="date" id="search"
                placeholder="Search something.." />
            </div>
          </div>
          <div class="ml-2 sm:ml-10 space-x-8 sm:space-x-8">
            <button @click="generatePDF"
              class="mt-20 flex items-center gap-2 rounded-md bg-red-600 px-2 sm:px-4 py-2 text-sm font-semibold text-white focus:outline-none focus:ring hover:bg-blue-700">
              PDF
            </button>
          </div>
        </div>
      </div>

      <div class="mx-auto mt- max-w-screen-lg px-2 overflow-x-auto">
        <div class="mt-6 ml-28 overflow-y-auto border shadow" style="max-height: 400px;">
          <table class="w-full text-sm text-gray-500 dark:text-gray-400 text-center">
            <thead>
              <tr class="bg-yellow-300 border-b dark:bg-white-800 dark:border-gray-700">
                <th scope="col" class="px-3 py-3 border-2" rowspan="2">No</th>
                <th scope="col" class="px-3 py-3 border-2" rowspan="2">Tanggal Keluar</th>
                <th scope="col" class="px-3 py-3 border-2" rowspan="2">Nama</th>
                <th scope="col" class="px-3 py-3 border-2" rowspan="2">Nama Barang</th>
                <th scope="col" class="px-3 py-3 border-2" rowspan="2">Kode Barang</th>
                <th scope="col" class="px-3 py-3 border-2" rowspan="2">Jumlah Keluar</th>
                <th scope="col" class="px-3 py-3 border-2" rowspan="2">Pendapatan</th>
              </tr>
            </thead>
            <tbody>
              <tr class="bg-white border-2 dark:bg-gray-800 dark:border-gray-700"
                v-for="(laporan, index) in filteredLaporanKeluar" :key="laporan.id">
                <td scope="col" class="px-2 py-3 border-2">{{ index + 1 }}</td>
                <td scope="col" class="px-2 py-3 ">{{ laporan.Transaksi_Keluar.tanggal_keluar }}</td>
                <td scope="col" class="px-2 py-3 text-justify border-2">{{ laporan.User.username }}</td>
                <td scope="col" class="px-2 py-3 text-justify border-2">{{ laporan.Product.nama_barang }}</td>
                <td scope="col" class="px-2 py-3 border-2">{{ laporan.Product.kode_barang }}</td>
                <td scope="col" class="px-2 py-3 border-2">{{ laporan.Transaksi_Keluar.jumlah_keluar }}</td>
                <td scope="col" class="px-2 py-3 border-2">{{ formatRupiah(laporan.pendapatan) }}</td>
              </tr>
            </tbody>
            <thead>
              <tr class=" border-b dark:bg-white-800 dark:border-gray-700">
                <th scope="col" class="px-2 py-3 border-2" colspan="6">Total Pengendapatan</th>
                <th>{{ formatRupiah(totalPendapatanFiltered) }}</th>
              </tr>
            </thead>
          </table>
        </div>
      </div>
    </div>
  </div>
</template> -->

<template>
  <div>
    <h1 style="margin: 5%; border-bottom: 2px solid black; font-size: 200%;" class="min-w-flex md:border-black-500">
      Data Laporan Keluar
    </h1>

    <div class="flex justify-end items-center">
      <div class="relative" style="margin-top: 30px; margin-right: 0.4cm;">
        <input v-model="searchTerm" type="date" placeholder="Search"
          class="border border-gray-300 rounded-md py-1 px-3 focus:outline-none focus:border-indigo-500">
        
      </div>
      <button @click="generatePDF" data-modal-target="add-modal" data-modal-toggle="add-modal"
        class="bg-red-500 hover:bg-red-700 text-white font-bold py-1 px-3 border border-red-500 rounded"
        style="margin-top: 30px;">
        PDF
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
            Tanggal Keluar
          </th>
          <th class="bg-purple-500 p-2 text-white font-bold md:border md:border-grey-500 text-left block md:table-cell">
            Nama Lengkap
          </th>
          <th class="bg-purple-500 p-2 text-white font-bold md:border md:border-grey-500 text-left block md:table-cell">
            Nama Barang
          </th>
          <th class="bg-purple-500 p-2 text-white font-bold md:border md:border-grey-500 text-left block md:table-cell">
            Kode Barang
          </th>
          <th class="bg-purple-500 p-2 text-white font-bold md:border md:border-grey-500 text-left block md:table-cell">
            Jumlah Keluar
          </th>
          <th class="bg-purple-500 p-2 text-white font-bold md:border md:border-grey-500 text-left block md:table-cell">
            Pendapatan
          </th>
          
        </tr>
      </thead>
      <tbody class="block md:table-row-group">
        <tr class="bg-white-300 border border-white-500 md:border-none block md:table-row"
        v-for="(laporan, index) in filteredLaporanKeluar" :key="laporan.id">
          <td class="p-2 md:border md:border-white-500 text-center block md:table-cell">
            <span class="inline-block w-1/3 md:hidden font-bold">No</span>{{ index + 1 }}
          </td>
          <td class="p-2 md:border md:border-white-500 text-center block md:table-cell">
            <span class="inline-block w-1/3 md:hidden font-bold">Tanggal Keluar</span>{{ laporan.Transaksi_Keluar.tanggal_keluar }}
          </td>
          <td class="p-2 md:border md:border-white-500 text-center block md:table-cell">
            <span class="inline-block w-1/3 md:hidden font-bold">Nama Lengkap</span>{{ laporan.User.username }}
          </td>
          <td class="p-2 md:border md:border-white-500 text-center block md:table-cell">
            <span class="inline-block w-1/3 md:hidden font-bold">Nama Barang</span>{{ laporan.Product.nama_barang }}
          </td>
          <td class="p-2 md:border md:border-white-500 text-center block md:table-cell">
            <span class="inline-block w-1/3 md:hidden font-bold">Kode Barang</span>{{ laporan.Product.kode_barang }}
          </td>
          <td class="p-2 md:border md:border-white-500 text-center block md:table-cell">
            <span class="inline-block w-1/3 md:hidden font-bold">Jumlah Keluar</span>{{ laporan.Transaksi_Keluar.jumlah_keluar }}
          </td>
          <td class="p-2 md:border md:border-white-500 text-center block md:table-cell">
            <span class="inline-block w-1/3 md:hidden font-bold">Pendapatan</span>{{ formatRupiah(laporan.pendapatan) }}
          </td>
        </tr>
      </tbody>
      <thead>
              <tr class="border border-purple-900 md:border-none block md:table-row absolute -top-full md:top-auto -left-full md:left-auto md:relative">
                <th scope="col" class="bg-purple-500 p-2 text-white text-center font-bold md:border md:border-grey-500  block md:table-cell" colspan="6">Total Pendapatan</th>
                <th>{{ formatRupiah(totalPendapatanFiltered) }}</th>
              </tr>
            </thead>
    </table>
  </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'
import pdfMake from 'pdfmake/build/pdfmake'
import pdfFonts from 'pdfmake/build/vfs_fonts'

export default {
  data() {
    return {
      searchTerm: '',
    }
  },
  computed: {
    ...mapGetters('laporan_keluar', ['getLaporanKeluar']),
    filteredLaporanKeluar() {
      return this.getLaporanKeluar.filter((laporan) => {
        return laporan.Transaksi_Keluar.tanggal_keluar.includes(this.searchTerm)
      }).reverse()
    },
    totalPendapatanFiltered() {
      return this.filteredLaporanKeluar.reduce((total, laporan) => {
        return total + laporan.pendapatan
      }, 0)
    }
  },
  methods: {
    ...mapActions('laporan_keluar', ['fetchLaporanKeluar']),
    formatRupiah(number) {
      const formatter = new Intl.NumberFormat("id-ID", {
        style: "currency",
        currency: "IDR"
      });
      return formatter.format(number);
    },
    generatePDF() {
      // Set up font for PDF
      pdfMake.vfs = pdfFonts.pdfMake.vfs

      // Create PDF document definition
      const documentDefinition = {
        content: [
          { text: 'Laporan Keluar', style: 'header' },
          { text: `Tanggal: ${this.searchTerm}`, style: 'subheader' },
          {
            table: {
              headerRows: 2,
              widths: ['auto', 'auto', 'auto', 'auto', 'auto', 'auto', 'auto'],
              body: [
                [
                  'No',
                  'Tanggal Keluar',
                  'Nama Lengkap',
                  'Nama Barang',
                  'Kode Barang',
                  'Jumlah Keluar',
                  'Pendapatan'
                ],
                ...this.filteredLaporanKeluar.map((laporan, index) => [
                  index + 1,
                  laporan.Transaksi_Keluar.tanggal_keluar,
                  laporan.User.username,
                  laporan.Product.nama_barang,
                  laporan.Product.kode_barang,
                  laporan.Transaksi_Keluar.jumlah_keluar,
                  this.formatRupiah(laporan.pendapatan)
                ]),
                [
                  { text: 'Total Pengendapatan', colSpan: 6, alignment: 'center' },
                  {},
                  {},
                  {},
                  {},
                  {},
                  { text: this.formatRupiah(this.totalPendapatanFiltered) }
                ]
              ]
            }
          }
        ],
        styles: {
          header: {
            fontSize: 18,
            bold: true,
            alignment: 'center',
            margin: [0, 0, 0, 10]
          },
          subheader: {
            fontSize: 14,
            bold: true,
            margin: [0, 0, 0, 9]
          }
        }
      }

      // Generate PDF document and open it in PDF Viewer Vue.js
      pdfMake.createPdf(documentDefinition).open({}, this.$refs.pdfViewer)
    }
  },
  created() {
    this.fetchLaporanKeluar()
  },
}
</script>

<style>
table {
  display: block;
  overflow-x: auto;
  white-space: nowrap;
}
</style>
