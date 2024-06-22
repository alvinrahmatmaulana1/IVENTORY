<template>
  <nav class="fixed top-0 z-50 w-full bg-white border-b border-gray-200 dark:bg-gray-800 dark:border-gray-700">
    <div class="px-3 py-3 lg:px-5 lg:pl-20">
      <div class="flex items-center justify-between">
        <div class="flex items-center justify-start rtl:justify-end">
          <button data-drawer-target="logo-sidebar" data-drawer-toggle="logo-sidebar" aria-controls="logo-sidebar"
            type="button"
            class="inline-flex items-center p-2 text-sm text-gray-500 rounded-lg sm:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600">
            <span class="sr-only">Open sidebar</span>
            <svg class="w-6 h-6" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20"
              xmlns="http://www.w3.org/2000/svg">
              <path clip-rule="evenodd" fill-rule="evenodd"
                d="M2 4.75A.75.75 0 012.75 4h14.5a.75.75 0 010 1.5H2.75A.75.75 0 012 4.75zm0 10.5a.75.75 0 01.75-.75h7.5a.75.75 0 010 1.5h-7.5a.75.75 0 01-.75-.75zM2 10a.75.75 0 01.75-.75h14.5a.75.75 0 010 1.5H2.75A.75.75 0 012 10z">
              </path>
            </svg>
          </button>
          <a href="https://flowbite.com" class="flex ms-2 md:me-24">
            <!-- <img src="https://flowbite.com/docs/images/logo.svg" class="h-8 me-3" alt="FlowBite Logo" /> -->
            <span
              class="self-center text-xl font-semibold sm:text-2xl whitespace-nowrap dark:text-white">IVENTORY</span>
          </a>
        </div>
        <div class="flex items-center justify-end">
          <button @click="openModal"
            class="flex items-center p-2 text-sm text-gray-500 rounded-lg hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600">
            <span class="sr-only">Open notification modal</span>

            <svg class="w-6 h-6" viewBox="0 0 24 24" id="_24x24_On_Light_Notification-Alert"
              data-name="24x24/On Light/Notification-Alert" xmlns="http://www.w3.org/2000/svg" fill="#000000">
              <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
              <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
              <g id="SVGRepo_iconCarrier">
                <rect id="view-box" width="24" height="24" fill="none"></rect>
                <path id="Shape"
                  d="M6,17v-.5H2.25A2.253,2.253,0,0,1,0,14.25v-.382a2.542,2.542,0,0,1,1.415-2.289A1.247,1.247,0,0,0,2.1,10.572l.446-4.91A6.227,6.227,0,0,1,10.618.286a5.477,5.477,0,0,0-.635,1.374A4.794,4.794,0,0,0,8.75,1.5,4.7,4.7,0,0,0,4.045,5.8L3.6,10.708A2.739,2.739,0,0,1,2.089,12.92a1.055,1.055,0,0,0-.589.949v.382A.751.751,0,0,0,2.25,15h13A.751.751,0,0,0,16,14.25v-.382a1.053,1.053,0,0,0-.586-.948A2.739,2.739,0,0,1,13.9,10.708l-.2-2.18a5.473,5.473,0,0,0,1.526.221l.166,1.822a1.26,1.26,0,0,0,.686,1.005,2.547,2.547,0,0,1,1.418,2.29v.382a2.252,2.252,0,0,1-2.25,2.25H11.5V17A2.75,2.75,0,0,1,6,17Zm1.5,0A1.25,1.25,0,0,0,10,17v-.5H7.5ZM15.047,6.744A3.486,3.486,0,0,1,13.5,6.28L13.456,5.8a4.7,4.7,0,0,0-1.648-3.185,3.5,3.5,0,0,1,.61-1.417A6.221,6.221,0,0,1,14.95,5.662l.1,1.081v0Z"
                  transform="translate(3.25 2.25)" fill="#141124"></path>
                <path id="Shape-2" data-name="Shape" d="M3.5,7A3.5,3.5,0,1,1,7,3.5,3.5,3.5,0,0,1,3.5,7Z"
                  transform="translate(15 2)" fill="#ff6359">{{ getNotifikasi.count }}</path>
              </g>
            </svg>
          </button>

          <button @click="handleLogout()"
            class="flex items-center p-2 text-sm text-gray-500 rounded-lg hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600">
            <span class="inline-flex justify-center items-center ml-5">
              <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                xmlns="http://www.w3.org/2000/svg">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                  d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1"></path>
              </svg>
            </span>
          </button>
        </div>
      </div>
    </div>
  </nav>

  <dialog id="notificationModal" class="h-auto w-11/12 md:w-1/4 p-5 bg-white rounded-md ">
    <div class="flex flex-col w-full h-auto">
      <!-- Header -->
      <div class="flex w-full h-auto justify-center items-center">
        <div class="flex w-10/12 h-auto py-3 justify-center items-center text-2xl font-bold">
          Notifikasi
        </div>
        <div @click="closeModal" class="flex w-1/12 h-auto justify-center cursor-pointer">
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
            stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x">
            <line x1="18" y1="6" x2="6" y2="18"></line>
            <line x1="6" y1="6" x2="18" y2="18"></line>
          </svg>
        </div>
        <!--Header End-->
      </div>
      <!-- Modal Content-->
      <div v-for="notifikasi in reversedNotifikasi" :key="notifikasi.id"
        class="flex w-full h-auto py-0 px-2 justify rounded text-center text-gray-500">
        <div
          class="py-3 px-5 mb-4 bg-blue-100 text-blue-900 text-sm rounded-md border border-blue-200 flex items-center justify-between"
          role="alert">
          <span>{{ notifikasi.pesan }}!</span>
          <button class="w-4" type="button" data-dismiss="alert" aria-label="Close"
            @click="deleteNotifikasi(notifikasi.id)">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
            </svg>
          </button>
        </div>
      </div>
      <!-- End of Modal Content-->
    </div>
  </dialog>
  <!-- component -->
  
  <div class="mt-16 h-screen flex">

<aside class="w-64 max-h-screen overflow-y-auto bg-gray-50 dark:bg-gray-800" aria-label="Sidebar">
  <div class="px-3 py-4  overflow-y-auto rounded bg-gray-50 dark:bg-gray-800">
    <ul class="space-y-2">
      <li>
            <router-link to="/admin">
              <a
                class="relative flex flex-row items-center h-11 focus:outline-none hover:bg-gray-50 text-gray-600 hover:text-gray-800 border-l-4 border-transparent hover:border-indigo-500 pr-6">
                <span class="inline-flex justify-center items-center ml-4">
                  <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                    xmlns="http://www.w3.org/2000/svg">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                      d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6">
                    </path>
                  </svg>
                </span>
                <span class="ml-2 text-sm tracking-wide truncate">Dashboard</span>
              </a>
            </router-link>
          </li>
      <li>
        <li>
            <router-link to="/admin/products">
              <a
                class="relative flex flex-row items-center h-11 focus:outline-none hover:bg-gray-50 text-gray-600 hover:text-gray-800 border-l-4 border-transparent hover:border-indigo-500 pr-6">
                <span class="inline-flex justify-center items-center ml-4">
                  <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                    xmlns="http://www.w3.org/2000/svg">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                      d="M20 13V6a2 2 0 00-2-2H6a2 2 0 00-2 2v7m16 0v5a2 2 0 01-2 2H6a2 2 0 01-2-2v-5m16 0h-2.586a1 1 0 00-.707.293l-2.414 2.414a1 1 0 01-.707.293h-3.172a1 1 0 01-.707-.293l-2.414-2.414A1 1 0 006.586 13H4">
                    </path>
                  </svg>
                </span>
                <span class="ml-2 text-sm tracking-wide truncate">Barang</span>
                
              </a>
            </router-link>
          </li>
          <router-link to="/admin/data_pegawai">
            <li>
              <a
                class="relative flex flex-row items-center h-11 focus:outline-none hover:bg-gray-50 text-gray-600 hover:text-gray-800 border-l-4 border-transparent hover:border-indigo-500 pr-6">
                <span class="inline-flex justify-center items-center ml-4">
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor"
                        class="h-5 w-5 ">
                        <path
                            d="M4.5 6.375a4.125 4.125 0 1 1 8.25 0 4.125 4.125 0 0 1-8.25 0ZM14.25 8.625a3.375 3.375 0 1 1 6.75 0 3.375 3.375 0 0 1-6.75 0ZM1.5 19.125a7.125 7.125 0 0 1 14.25 0v.003l-.001.119a.75.75 0 0 1-.363.63 13.067 13.067 0 0 1-6.761 1.873c-2.472 0-4.786-.684-6.76-1.873a.75.75 0 0 1-.364-.63l-.001-.122ZM17.25 19.128l-.001.144a2.25 2.25 0 0 1-.233.96 10.088 10.088 0 0 0 5.06-1.01.75.75 0 0 0 .42-.643 4.875 4.875 0 0 0-6.957-4.611 8.586 8.586 0 0 1 1.71 5.157v.003Z" />
                    </svg>
                </span>
                <span class="ml-2 text-sm tracking-wide truncate">Pegawai</span>
              </a>
            </li>
          </router-link>

          <li>
            <div class="relative transition">
              <input class="peer hidden" type="checkbox" id="menu-1" checked />
              <button
                class="flex peer relative w-full items-center border-l-rose-600 py-3 px-4 text-sm font-medium text-gray-600 outline-none transition-all duration-100 ease-in-out hover:border-l-4 hover:text-rose-600 focus:border-l-4">
                <span class="flex mr-5 w-5"><svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none"
                    viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                    <path stroke-linecap="round" stroke-linejoin="round"
                      d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z" />
                  </svg></span>
                Transaksi
                <label for="menu-1" class="absolute inset-0 h-full w-full cursor-pointer"></label>
              </button>
              <svg xmlns="http://www.w3.org/2000/svg"
                class="absolute right-0 top-4 ml-auto mr-5 h-4 text-gray-600 transition peer-checked:rotate-180 peer-hover:text-rose-600"
                fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                <path stroke-linecap="round" stroke-linejoin="round" d="M19 9l-7 7-7-7" />
              </svg>
              <ul
                class="duration-400 flex m-2 max-h-0 flex-col overflow-hidden rounded-xl bg-gray-100 font-medium transition-all duration-300 peer-checked:max-h-96">
                <router-link to="/admin/transaksi_masuk">
                  <li
                    class="flex m-2 cursor-pointer border-l-rose-600 py-3 pl-5 text-sm text-gray-600 transition-all duration-100 ease-in-out hover:border-l-4 hover:text-rose-600">
                    <span class="mr-5">
                      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor"
                        class="h-5 w-5">
                        <path fill-rule="evenodd"
                            d="M9.75 6.75h-3a3 3 0 0 0-3 3v7.5a3 3 0 0 0 3 3h7.5a3 3 0 0 0 3-3v-7.5a3 3 0 0 0-3-3h-3V1.5a.75.75 0 0 0-1.5 0v5.25Zm0 0h1.5v5.69l1.72-1.72a.75.75 0 1 1 1.06 1.06l-3 3a.75.75 0 0 1-1.06 0l-3-3a.75.75 0 1 1 1.06-1.06l1.72 1.72V6.75Z"
                            clip-rule="evenodd" />
                        <path
                            d="M7.151 21.75a2.999 2.999 0 0 0 2.599 1.5h7.5a3 3 0 0 0 3-3v-7.5c0-1.11-.603-2.08-1.5-2.599v7.099a4.5 4.5 0 0 1-4.5 4.5H7.151Z" />
                    </svg>
                    </span>
                    Transaksi Masuk
                  </li>
                </router-link>
                <router-link to="/admin/transaksi_keluar">
                  <li
                    class="flex m-2 cursor-pointer border-l-rose-600 py-3 pl-5 text-sm text-gray-600 transition-all duration-100 ease-in-out hover:border-l-4 hover:text-rose-600">
                    <span class="mr-5">
                      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor"
                        class="h-5 w-5 ">
                        <path
                            d="M9.97.97a.75.75 0 0 1 1.06 0l3 3a.75.75 0 0 1-1.06 1.06l-1.72-1.72v3.44h-1.5V3.31L8.03 5.03a.75.75 0 0 1-1.06-1.06l3-3ZM9.75 6.75v6a.75.75 0 0 0 1.5 0v-6h3a3 3 0 0 1 3 3v7.5a3 3 0 0 1-3 3h-7.5a3 3 0 0 1-3-3v-7.5a3 3 0 0 1 3-3h3Z" />
                        <path
                            d="M7.151 21.75a2.999 2.999 0 0 0 2.599 1.5h7.5a3 3 0 0 0 3-3v-7.5c0-1.11-.603-2.08-1.5-2.599v7.099a4.5 4.5 0 0 1-4.5 4.5H7.151Z" />
                    </svg>
                    </span>
                    Transaksi Keluar
                  </li>
                </router-link>
              </ul>
            </div>
          </li>

          <li>
            <div class="relative transition">
              <input class="peer hidden" type="checkbox" id="menu-2" checked />
              <button
                class="flex peer relative w-full items-center border-l-rose-600 py-3 px-4 text-sm font-medium text-gray-600 outline-none transition-all duration-100 ease-in-out hover:border-l-4 hover:text-rose-600 focus:border-l-4">
                <span class="flex mr-5 w-5">
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor"
                        class="h-5 w-5">
                        <path fill-rule="evenodd"
                            d="M17.663 3.118c.225.015.45.032.673.05C19.876 3.298 21 4.604 21 6.109v9.642a3 3 0 0 1-3 3V16.5c0-5.922-4.576-10.775-10.384-11.217.324-1.132 1.3-2.01 2.548-2.114.224-.019.448-.036.673-.051A3 3 0 0 1 13.5 1.5H15a3 3 0 0 1 2.663 1.618ZM12 4.5A1.5 1.5 0 0 1 13.5 3H15a1.5 1.5 0 0 1 1.5 1.5H12Z"
                            clip-rule="evenodd" />
                        <path
                            d="M3 8.625c0-1.036.84-1.875 1.875-1.875h.375A3.75 3.75 0 0 1 9 10.5v1.875c0 1.036.84 1.875 1.875 1.875h1.875A3.75 3.75 0 0 1 16.5 18v2.625c0 1.035-.84 1.875-1.875 1.875h-9.75A1.875 1.875 0 0 1 3 20.625v-12Z" />
                        <path
                            d="M10.5 10.5a5.23 5.23 0 0 0-1.279-3.434 9.768 9.768 0 0 1 6.963 6.963 5.23 5.23 0 0 0-3.434-1.279h-1.875a.375.375 0 0 1-.375-.375V10.5Z" />
                    </svg>
                </span>
                Laporan
                <label for="menu-2" class="absolute inset-0 h-full w-full cursor-pointer"></label>
              </button>
              <svg xmlns="http://www.w3.org/2000/svg"
                class="absolute right-0 top-4 ml-auto mr-5 h-4 text-gray-600 transition peer-checked:rotate-180 peer-hover:text-rose-600"
                fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                <path stroke-linecap="round" stroke-linejoin="round" d="M19 9l-7 7-7-7" />
              </svg>
              <ul
                class="duration-400 flex m-2 max-h-0 flex-col overflow-hidden rounded-xl bg-gray-100 font-medium transition-all duration-300 peer-checked:max-h-96">
                <router-link to="/admin/laporan_masuk">
                  <li
                    class="flex m-2 cursor-pointer border-l-rose-600 py-3 pl-5 text-sm text-gray-600 transition-all duration-100 ease-in-out hover:border-l-4 hover:text-rose-600">

                    <span class="mr-5">
                      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor"
                        class="h-5 w-5">
                        <path fill-rule="evenodd"
                            d="M17.663 3.118c.225.015.45.032.673.05C19.876 3.298 21 4.604 21 6.109v9.642a3 3 0 0 1-3 3V16.5c0-5.922-4.576-10.775-10.384-11.217.324-1.132 1.3-2.01 2.548-2.114.224-.019.448-.036.673-.051A3 3 0 0 1 13.5 1.5H15a3 3 0 0 1 2.663 1.618ZM12 4.5A1.5 1.5 0 0 1 13.5 3H15a1.5 1.5 0 0 1 1.5 1.5H12Z"
                            clip-rule="evenodd" />
                        <path
                            d="M3 8.625c0-1.036.84-1.875 1.875-1.875h.375A3.75 3.75 0 0 1 9 10.5v1.875c0 1.036.84 1.875 1.875 1.875h1.875A3.75 3.75 0 0 1 16.5 18v2.625c0 1.035-.84 1.875-1.875 1.875h-9.75A1.875 1.875 0 0 1 3 20.625v-12Z" />
                        <path
                            d="M10.5 10.5a5.23 5.23 0 0 0-1.279-3.434 9.768 9.768 0 0 1 6.963 6.963 5.23 5.23 0 0 0-3.434-1.279h-1.875a.375.375 0 0 1-.375-.375V10.5Z" />
                    </svg>
                    </span>
                    Laporan Masuk
                  </li>
                </router-link>
                <router-link to="/admin/laporan_keluar">
                  <li
                    class="flex m-2 cursor-pointer border-l-rose-600 py-3 pl-5 text-sm text-gray-600 transition-all duration-100 ease-in-out hover:border-l-4 hover:text-rose-600">
                    <span class="mr-5">
                      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor"
                        class="h-5 w-5">
                        <path fill-rule="evenodd"
                            d="M17.663 3.118c.225.015.45.032.673.05C19.876 3.298 21 4.604 21 6.109v9.642a3 3 0 0 1-3 3V16.5c0-5.922-4.576-10.775-10.384-11.217.324-1.132 1.3-2.01 2.548-2.114.224-.019.448-.036.673-.051A3 3 0 0 1 13.5 1.5H15a3 3 0 0 1 2.663 1.618ZM12 4.5A1.5 1.5 0 0 1 13.5 3H15a1.5 1.5 0 0 1 1.5 1.5H12Z"
                            clip-rule="evenodd" />
                        <path
                            d="M3 8.625c0-1.036.84-1.875 1.875-1.875h.375A3.75 3.75 0 0 1 9 10.5v1.875c0 1.036.84 1.875 1.875 1.875h1.875A3.75 3.75 0 0 1 16.5 18v2.625c0 1.035-.84 1.875-1.875 1.875h-9.75A1.875 1.875 0 0 1 3 20.625v-12Z" />
                        <path
                            d="M10.5 10.5a5.23 5.23 0 0 0-1.279-3.434 9.768 9.768 0 0 1 6.963 6.963 5.23 5.23 0 0 0-3.434-1.279h-1.875a.375.375 0 0 1-.375-.375V10.5Z" />
                    </svg>
                    </span>
                    Laporan Keluar
                  </li>
                </router-link>
              </ul>
            </div>
          </li>
    
</li>


    
      
      
      
    </ul>
  </div>
</aside>
</div>

</template>


<script>
import { mapGetters, mapActions } from 'vuex';

export default {
  methods: {
    openModal() {
      document.getElementById('notificationModal').showModal();
    },
    closeModal() {
      document.getElementById('notificationModal').close();
    },
    ...mapActions('notifikasi', ['fetchNotifikasi', 'deleteNotifikasi']),
    ...mapActions("auth", ["logout"]),

    async handleLogout() {
      try {
        // Panggil action logout
        await this.logout();

        // Setelah logout berhasil, lakukan navigasi ke halaman login atau halaman lain yang sesuai
        this.$router.push("/login");
      } catch (error) {
        console.error("Error logging out:", error.message);
      }
    },
  },
  computed: {
    ...mapGetters('notifikasi', ['getNotifikasi']),
    reversedNotifikasi() {
      // Balik urutan notifikasi agar yang terbaru muncul di atas
      return this.getNotifikasi.slice().reverse();
    },
  },

  created() {
    this.fetchNotifikasi();
  }
}
</script>
<style>
dialog[open] {
  animation: appear .15s cubic-bezier(0, 1.8, 1, 1.8);
}

dialog::backdrop {
  background: linear-gradient(45deg, rgba(0, 0, 0, 0.5), rgba(54, 54, 54, 0.5));
  backdrop-filter: blur(3px);
}

.notification-list {
  max-height: 300px; /* Atur tinggi maksimal sesuai kebutuhan */
  overflow-y: auto; /* Tambahkan overflow-y untuk scroll vertikal jika melebihi tinggi maksimal */
}



@keyframes appear {
  from {
    opacity: 0;
    transform: translateX(-3rem);
  }

  to {
    opacity: 1;
    transform: translateX(0);
  }
}
</style>
