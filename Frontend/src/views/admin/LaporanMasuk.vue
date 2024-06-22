<template>
    <div>
      <h1 style="margin: 5%; border-bottom: 2px solid black; font-size: 200%;" class="min-w-flex  md:border-black-500">
        Data Laporan Masuk
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
              Tanggal Masuk
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
              Jumlah Masuk
            </th>
            <th class="bg-purple-500 p-2 text-white font-bold md:border md:border-grey-500 text-left block md:table-cell">
              Pengeluaran
            </th>
            
          </tr>
        </thead>
        <tbody class="block md:table-row-group">
          <tr class="bg-white-300 border border-white-500 md:border-none block md:table-row"
          v-for="(laporan, index) in filteredLaporanMasuk" :key="laporan.id">
            <td class="p-2 md:border md:border-white-500 text-center block md:table-cell">
              <span class="inline-block w-1/3 md:hidden font-bold">No</span>{{ index + 1 }}
            </td>
            <td class="p-2 md:border md:border-white-500 text-center block md:table-cell">
              <span class="inline-block w-1/3 md:hidden font-bold">Tanggal Masuk</span>{{ laporan.Transaksi_Masuk.tanggal_masuk }}
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
              <span class="inline-block w-1/3 md:hidden font-bold">Jumlah Masuk</span>{{ laporan.Transaksi_Masuk.jumlah_masuk }}
            </td>
            <td class="p-2 md:border md:border-white-500 text-center block md:table-cell">
              <span class="inline-block w-1/3 md:hidden font-bold">Pengeluaran</span>{{ formatRupiah(laporan.pengeluaran) }}
            </td>
          </tr>
        </tbody>
        <thead>
                <tr class="border border-purple-900 md:border-none block md:table-row absolute -top-full md:top-auto -left-full md:left-auto md:relative">
                  <th scope="col" class="bg-purple-500 p-2 text-white text-center font-bold md:border md:border-grey-500  block md:table-cell" colspan="6">Total Pengeluaran</th>
                  <th>{{ formatRupiah(totalPengeluaranFiltered) }}</th>
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
      ...mapGetters('laporan_masuk', ['getLaporanMasuk']),
      filteredLaporanMasuk() {
        return this.getLaporanMasuk.filter((laporan) => {
          return laporan.Transaksi_Masuk.tanggal_masuk.includes(this.searchTerm)
        }).reverse()
      },
      totalPengeluaranFiltered() {
        return this.filteredLaporanMasuk.reduce((total, laporan) => {
          return total + laporan.pengeluaran
        }, 0)
      }
    },
    methods: {
      ...mapActions('laporan_masuk', ['fetchLaporanMasuk']),
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
            { text: 'Laporan Masuk', style: 'header' },
            { text: `Tanggal: ${this.searchTerm}`, style: 'subheader' },
            {
              table: {
                headerRows: 1,
                widths: ['auto', 'auto', 'auto', 'auto', 'auto', 'auto', 'auto'],
                body: [
                  [
                    'No',
                    'Tanggal Masuk',
                    'Nama',
                    'Nama Barang',
                    'Kode Barang',
                    'Jumlah Masuk',
                    'Pengeluaran'
                  ],
                  ...this.filteredLaporanMasuk.map((laporan, index) => [
                    index + 1,
                    laporan.Transaksi_Masuk.tanggal_masuk,
                    laporan.User.username,
                    laporan.Product.nama_barang,
                    laporan.Product.kode_barang,
                    laporan.Transaksi_Masuk.jumlah_masuk,
                    this.formatRupiah(laporan.pengeluaran)
                  ]),
                  [
                    { text: 'Total Pengeluaran', colSpan: 6, alignment: 'center' },
                    {},
                    {},
                    {},
                    {},
                    {},
                    { text: this.formatRupiah(this.totalPengeluaranFiltered) }
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
              margin: [0, 0, 0, 10]
            }
          }
        }
  
        // Generate PDF document and open it in PDF Viewer Vue.js
        pdfMake.createPdf(documentDefinition).open({}, this.$refs.pdfViewer)
      }
    },
    created() {
      this.fetchLaporanMasuk()
    },
  }
  </script>
  