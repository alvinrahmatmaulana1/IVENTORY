<template>
    <div class="container ">
        <!-- <div class="mt-20 ml-40 grid grid-cols-1 gap-5 sm:grid-cols-1 lg:grid-cols-3">
  </div> -->
  
        <div class="mt-20  grid grid-cols-12 gap-4 ">
            
            <div class="col-span-12 sm:col-span-4">
                <router-link to="/admin/products">
                <div class="p-8 relative  bg-gray-800 border border-gray-800 shadow-lg  rounded-2xl">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor"
                        class="h-14 w-14 absolute bottom-4 right-3 text-yellow-300">
                        <path
                            d="M12.378 1.602a.75.75 0 0 0-.756 0L3 6.632l9 5.25 9-5.25-8.622-5.03ZM21.75 7.93l-9 5.25v9l8.628-5.032a.75.75 0 0 0 .372-.648V7.93ZM11.25 22.18v-9l-9-5.25v8.57a.75.75 0 0 0 .372.648l8.628 5.033Z" />
                    </svg>

                    <div class="flex justify-between items-center ">
                        <i class="fab fa-behance text-xl text-gray-400"></i>
                    </div>
                    <!-- <div class="text-2xl text-gray-100 font-medium leading-8 mt-5">99</div> -->
                    <div class="text-2xl text-gray-100 font-medium leading-8">Barang</div>
                </div>
            </router-link>
            </div>
        
        
            <div class="col-span-12 sm:col-span-4">
                <router-link to="/admin/data_pegawai">
                <div class="p-8 relative  bg-gray-800 border border-gray-800 shadow-lg  rounded-2xl">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor"
                        class="h-14 w-14 absolute bottom-4 right-3 text-yellow-300">
                        <path
                            d="M4.5 6.375a4.125 4.125 0 1 1 8.25 0 4.125 4.125 0 0 1-8.25 0ZM14.25 8.625a3.375 3.375 0 1 1 6.75 0 3.375 3.375 0 0 1-6.75 0ZM1.5 19.125a7.125 7.125 0 0 1 14.25 0v.003l-.001.119a.75.75 0 0 1-.363.63 13.067 13.067 0 0 1-6.761 1.873c-2.472 0-4.786-.684-6.76-1.873a.75.75 0 0 1-.364-.63l-.001-.122ZM17.25 19.128l-.001.144a2.25 2.25 0 0 1-.233.96 10.088 10.088 0 0 0 5.06-1.01.75.75 0 0 0 .42-.643 4.875 4.875 0 0 0-6.957-4.611 8.586 8.586 0 0 1 1.71 5.157v.003Z" />
                    </svg>

                    <div class="flex justify-between items-center ">
                        <i class="fab fa-behance text-xl text-gray-400"></i>
                    </div>
                    <!-- <div class="text-2xl text-gray-100 font-medium leading-8 mt-5">99</div> -->
                    <div class="text-2xl text-gray-100 font-medium leading-8">Pegawai</div>
                </div> 
            </router-link>
            </div>
       
        
            <div class="col-span-12 sm:col-span-4">
                <router-link to="/admin/transaksi_masuk">
                <div class="p-8 relative  bg-gray-800 border border-gray-800 shadow-lg  rounded-2xl">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor"
                        class="h-14 w-14  absolute bottom-4 right-3 text-yellow-300">
                        <path fill-rule="evenodd"
                            d="M9.75 6.75h-3a3 3 0 0 0-3 3v7.5a3 3 0 0 0 3 3h7.5a3 3 0 0 0 3-3v-7.5a3 3 0 0 0-3-3h-3V1.5a.75.75 0 0 0-1.5 0v5.25Zm0 0h1.5v5.69l1.72-1.72a.75.75 0 1 1 1.06 1.06l-3 3a.75.75 0 0 1-1.06 0l-3-3a.75.75 0 1 1 1.06-1.06l1.72 1.72V6.75Z"
                            clip-rule="evenodd" />
                        <path
                            d="M7.151 21.75a2.999 2.999 0 0 0 2.599 1.5h7.5a3 3 0 0 0 3-3v-7.5c0-1.11-.603-2.08-1.5-2.599v7.099a4.5 4.5 0 0 1-4.5 4.5H7.151Z" />
                    </svg>

                    <div class="flex justify-between items-center ">
                        <i class="fab fa-codepen text-xl text-gray-400"></i>
                    </div>
                    <!-- <div class="text-2xl text-gray-100 font-medium leading-8 mt-5">50</div> -->
                    <div class="text-2xl text-gray-100 font-medium leading-8">Transaksi Masuk</div>
                </div>
            </router-link>
            </div>
        
       
            <div class="col-span-12 sm:col-span-4">
                 <router-link to="/admin/transaksi_keluar">
                <div class="p-8 relative  bg-gray-800 border border-gray-800 shadow-lg  rounded-2xl">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor"
                        class="h-14 w-14  absolute bottom-4 right-3 text-yellow-300">
                        <path
                            d="M9.97.97a.75.75 0 0 1 1.06 0l3 3a.75.75 0 0 1-1.06 1.06l-1.72-1.72v3.44h-1.5V3.31L8.03 5.03a.75.75 0 0 1-1.06-1.06l3-3ZM9.75 6.75v6a.75.75 0 0 0 1.5 0v-6h3a3 3 0 0 1 3 3v7.5a3 3 0 0 1-3 3h-7.5a3 3 0 0 1-3-3v-7.5a3 3 0 0 1 3-3h3Z" />
                        <path
                            d="M7.151 21.75a2.999 2.999 0 0 0 2.599 1.5h7.5a3 3 0 0 0 3-3v-7.5c0-1.11-.603-2.08-1.5-2.599v7.099a4.5 4.5 0 0 1-4.5 4.5H7.151Z" />
                    </svg>

                    <div class="flex justify-between items-center ">
                        <i class="fab fa-codepen text-xl text-gray-400"></i>
                    </div>
                    <!-- <div class="text-2xl text-gray-100 font-medium leading-8 mt-5">50</div> -->
                    <div class=" text-2xl text-gray-100 font-medium leading-8">Transaksi Keluar</div>
                </div> 
            </router-link>
            </div>
       
       
            <div class="col-span-12 sm:col-span-4">
                 <router-link to="/admin/laporan_masuk">
                <div class="p-8 relative  bg-gray-800 border border-gray-800 shadow-lg  rounded-2xl">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor"
                        class="h-14 w-14  absolute bottom-4 right-3 text-yellow-300">
                        <path fill-rule="evenodd"
                            d="M17.663 3.118c.225.015.45.032.673.05C19.876 3.298 21 4.604 21 6.109v9.642a3 3 0 0 1-3 3V16.5c0-5.922-4.576-10.775-10.384-11.217.324-1.132 1.3-2.01 2.548-2.114.224-.019.448-.036.673-.051A3 3 0 0 1 13.5 1.5H15a3 3 0 0 1 2.663 1.618ZM12 4.5A1.5 1.5 0 0 1 13.5 3H15a1.5 1.5 0 0 1 1.5 1.5H12Z"
                            clip-rule="evenodd" />
                        <path
                            d="M3 8.625c0-1.036.84-1.875 1.875-1.875h.375A3.75 3.75 0 0 1 9 10.5v1.875c0 1.036.84 1.875 1.875 1.875h1.875A3.75 3.75 0 0 1 16.5 18v2.625c0 1.035-.84 1.875-1.875 1.875h-9.75A1.875 1.875 0 0 1 3 20.625v-12Z" />
                        <path
                            d="M10.5 10.5a5.23 5.23 0 0 0-1.279-3.434 9.768 9.768 0 0 1 6.963 6.963 5.23 5.23 0 0 0-3.434-1.279h-1.875a.375.375 0 0 1-.375-.375V10.5Z" />
                    </svg>

                    <div class="flex justify-between items-center ">
                        <i class="fab fa-codepen text-xl text-gray-400"></i>
                    </div>
                    <!-- <div class="text-2xl text-gray-100 font-medium leading-8 mt-5">50</div> -->
                    <div class=" text-2xl text-gray-100 font-medium leading-8">Laporan Masuk</div>
                </div>
            </router-link>
            </div>
        
        
            <div class="col-span-12 sm:col-span-4">
                <router-link to="/admin/laporan_keluar">
                <div class="p-8 relative  bg-gray-800 border border-gray-800 shadow-lg  rounded-2xl">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor"
                        class="h-14 w-14  absolute bottom-4 right-3 text-yellow-300">
                        <path fill-rule="evenodd"
                            d="M17.663 3.118c.225.015.45.032.673.05C19.876 3.298 21 4.604 21 6.109v9.642a3 3 0 0 1-3 3V16.5c0-5.922-4.576-10.775-10.384-11.217.324-1.132 1.3-2.01 2.548-2.114.224-.019.448-.036.673-.051A3 3 0 0 1 13.5 1.5H15a3 3 0 0 1 2.663 1.618ZM12 4.5A1.5 1.5 0 0 1 13.5 3H15a1.5 1.5 0 0 1 1.5 1.5H12Z"
                            clip-rule="evenodd" />
                        <path
                            d="M3 8.625c0-1.036.84-1.875 1.875-1.875h.375A3.75 3.75 0 0 1 9 10.5v1.875c0 1.036.84 1.875 1.875 1.875h1.875A3.75 3.75 0 0 1 16.5 18v2.625c0 1.035-.84 1.875-1.875 1.875h-9.75A1.875 1.875 0 0 1 3 20.625v-12Z" />
                        <path
                            d="M10.5 10.5a5.23 5.23 0 0 0-1.279-3.434 9.768 9.768 0 0 1 6.963 6.963 5.23 5.23 0 0 0-3.434-1.279h-1.875a.375.375 0 0 1-.375-.375V10.5Z" />
                    </svg>

                    <div class="flex justify-between items-center ">
                        <i class="fab fa-codepen text-xl text-gray-400"></i>
                    </div>
                    <!-- <div class="text-2xl text-gray-100 font-medium leading-8 mt-5">50</div> -->
                    <div class="text-2xl text-gray-100 font-medium leading-8">Laporan Keluar</div>
                </div>
            </router-link>
            </div>
        
        </div>


        <body
            class="flex  flex-col items-center justify-center w-screen m h-screen px-10 py-20 text-gray-700 bg-gray-100">


            <div
                class="flex flex-col items-center w-full max-w-screen-md  p-6 pb-6 mt-10 bg-white rounded-lg shadow-xl sm:p-8">
                <h2 class="text-xl font-bold">Monthly Revenue</h2>
                <span class="text-sm font-semibold text-gray-500">2024</span>
                <div class="flex items-end flex-grow w-full mt-2 space-x-2 sm:space-x-3">
                    <div class="relative flex flex-col items-center flex-grow pb-5 group">
                        <span class="absolute top-0 hidden -mt-6 text-xs font-bold group-hover:block">$37,500</span>
                        <div class="flex items-end w-full">

                            <div class="relative flex justify-center flex-grow h-6 bg-indigo-300"></div>
                            <div class="relative flex justify-center flex-grow h-16 bg-indigo-400"></div>
                        </div>
                        <span class="absolute bottom-0 text-xs font-bold">Jan</span>
                    </div>
                    <div class="relative flex flex-col items-center flex-grow pb-5 group">
                        <span class="absolute top-0 hidden -mt-6 text-xs font-bold group-hover:block">$45,000</span>
                        <div class="flex items-end w-full">

                            <div class="relative flex justify-center flex-grow h-6 bg-indigo-300"></div>
                            <div class="relative flex justify-center flex-grow h-20 bg-indigo-400"></div>
                        </div>
                        <span class="absolute bottom-0 text-xs font-bold">Feb</span>
                    </div>
                    <div class="relative flex flex-col items-center flex-grow pb-5 group">
                        <span class="absolute top-0 hidden -mt-6 text-xs font-bold group-hover:block">$47,500</span>
                        <div class="flex items-end w-full">
                            <div class="relative flex justify-center flex-grow h-8 bg-indigo-300"></div>
                            <div class="relative flex justify-center flex-grow h-20 bg-indigo-400"></div>
                        </div>
                        <span class="absolute bottom-0 text-xs font-bold">Mar</span>
                    </div>
                    <div class="relative flex flex-col items-center flex-grow pb-5 group">
                        <span class="absolute top-0 hidden -mt-6 text-xs font-bold group-hover:block">$50,000</span>
                        <div class="flex items-end w-full">
                            <div class="relative flex justify-center flex-grow h-6 bg-indigo-300"></div>
                            <div class="relative flex justify-center flex-grow h-24 bg-indigo-400"></div>
                        </div>
                        <span class="absolute bottom-0 text-xs font-bold">Apr</span>
                    </div>
                    <div class="relative flex flex-col items-center flex-grow pb-5 group">
                        <span class="absolute top-0 hidden -mt-6 text-xs font-bold group-hover:block">$47,500</span>
                        <div class="flex items-end w-full">
                            <div class="relative flex justify-center flex-grow h-8 bg-indigo-300"></div>
                            <div class="relative flex justify-center flex-grow h-20 bg-indigo-400"></div>
                        </div>
                        <span class="absolute bottom-0 text-xs font-bold">May</span>
                    </div>
                    <div class="relative flex flex-col items-center flex-grow pb-5 group">
                        <span class="absolute top-0 hidden -mt-6 text-xs font-bold group-hover:block">$55,000</span>
                        <div class="flex items-end w-full">
                            <div class="relative flex justify-center flex-grow h-8 bg-indigo-300"></div>
                            <div class="relative flex justify-center flex-grow h-24 bg-indigo-400"></div>
                        </div>
                        <span class="absolute bottom-0 text-xs font-bold">Jun</span>
                    </div>
                    <div class="relative flex flex-col items-center flex-grow pb-5 group">
                        <span class="absolute top-0 hidden -mt-6 text-xs font-bold group-hover:block">$60,000</span>
                        <div class="flex items-end w-full">
                            <div class="relative flex justify-center flex-grow h-16 bg-indigo-300"></div>
                            <div class="relative flex justify-center flex-grow h-20 bg-indigo-400"></div>
                        </div>
                        <span class="absolute bottom-0 text-xs font-bold">Jul</span>
                    </div>
                    <div class="relative flex flex-col items-center flex-grow pb-5 group">
                        <span class="absolute top-0 hidden -mt-6 text-xs font-bold group-hover:block">$57,500</span>
                        <div class="flex items-end w-full">
                            <div class="relative flex justify-center flex-grow h-10 bg-indigo-300"></div>
                            <div class="relative flex justify-center flex-grow h-24 bg-indigo-400"></div>
                        </div>
                        <span class="absolute bottom-0 text-xs font-bold">Aug</span>
                    </div>
                    <div class="relative flex flex-col items-center flex-grow pb-5 group">
                        <span class="absolute top-0 hidden -mt-6 text-xs font-bold group-hover:block">$67,500</span>
                        <div class="flex items-end w-full">
                            <div class="relative flex justify-center flex-grow h-10 bg-indigo-300"></div>
                            <div class="relative flex justify-center flex-grow h-32 bg-indigo-400"></div>
                        </div>
                        <span class="absolute bottom-0 text-xs font-bold">Sep</span>
                    </div>
                    <div class="relative flex flex-col items-center flex-grow pb-5 group">
                        <span class="absolute top-0 hidden -mt-6 text-xs font-bold group-hover:block">$65,000</span>
                        <div class="flex items-end w-full">
                            <div class="relative flex justify-center flex-grow h-12 bg-indigo-300"></div>
                            <div class="relative flex justify-center flex-grow bg-indigo-400 h-28"></div>
                        </div>
                        <span class="absolute bottom-0 text-xs font-bold">Oct</span>
                    </div>
                    <div class="relative flex flex-col items-center flex-grow pb-5 group">
                        <span class="absolute top-0 hidden -mt-6 text-xs font-bold group-hover:block">$70,000</span>
                        <div class="flex items-end w-full">

                            <div class="relative flex justify-center flex-grow h-8 bg-indigo-300"></div>
                            <div class="relative flex justify-center flex-grow h-40 bg-indigo-400"></div>
                        </div>
                        <span class="absolute bottom-0 text-xs font-bold">Nov</span>
                    </div>
                    <div class="relative flex flex-col items-center flex-grow pb-5 group">
                        <span class="absolute top-0 hidden -mt-6 text-xs font-bold group-hover:block">$75,000</span>
                        <div class="flex items-end w-full">

                            <div class="relative flex justify-center flex-grow h-8 bg-indigo-300"></div>
                            <div class="relative flex justify-center flex-grow h-40 bg-indigo-400"></div>
                        </div>
                        <span class="absolute bottom-0 text-xs font-bold">Dec</span>
                    </div>
                </div>
                <div class="flex w-full mt-3">
                    <div class="flex items-center ml-auto">
                        <span class="block w-4 h-4 bg-indigo-400"></span>
                        <span class="ml-1 text-xs font-medium">Pemasukan</span>
                    </div>
                    <div class="flex items-center ml-4">
                        <span class="block w-4  h-4 bg-indigo-300"></span>
                        <span class="ml-1 text-xs font-medium">Pengeluaran</span>
                    </div>
                </div>
            </div>
        </body>
    </div>
</template>
<style>
.group:hover .group-hover\:block {
    display: block;
}
</style>
