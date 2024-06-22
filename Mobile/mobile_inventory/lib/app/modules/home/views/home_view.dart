import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              Get.toNamed('/profil');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner
            Container(
              height: 200,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    // Gambar
                    Expanded(
                      flex: 1,
                      child: Image.asset(
                        'assets/images/hello.png', // Ganti dengan path gambar Anda
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Teks "Selamat Datang"
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Text(
                          'Selamat Datang',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // First Row of Cards
            SizedBox(height: 20),
            Container(
              height: 220,
              padding: EdgeInsets.all(20),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Fungsi yang akan dijalankan saat card diklik
                      Get.toNamed('/barang'); // Ganti dengan halaman tujuan
                    },
                    child: Container(
                      width: 200,
                      margin: EdgeInsets.only(right: 20),
                      child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              // Gambar
                              Image.asset(
                                '../assets/images/box_685388.png', // Ganti dengan path gambar Anda
                                width: 90, // Ukuran gambar
                                height: 90,
                              ),
                              SizedBox(height: 10), // Jarak antara gambar dan teks
                              // Judul atau teks
                              Text(
                                'Barang',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Fungsi yang akan dijalankan saat card diklik
                      Get.toNamed('/transaksi-keluar'); // Ganti dengan halaman tujuan
                    },
                    child: Container(
                      width: 200,
                      margin: EdgeInsets.only(right: 20),
                      child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              // Gambar
                              Image.asset(
                                '../assets/images/smartphone_5568990.png', // Ganti dengan path gambar Anda
                                width: 90, // Ukuran gambar
                                height: 90,
                              ),
                              SizedBox(height: 10), // Jarak antara gambar dan teks
                              // Judul atau teks
                              Text(
                                'Transaksi Keluar',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Fungsi yang akan dijalankan saat card diklik
                      Get.toNamed('/transaksi-masuk'); // Ganti dengan halaman tujuan
                    },
                    child: Container(
                      width: 200,
                      margin: EdgeInsets.only(right: 20),
                      child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              // Gambar
                              Image.asset(
                                '../assets/images/slide_2050798.png', // Ganti dengan path gambar Anda
                                width: 90, // Ukuran gambar
                                height: 90,
                              ),
                              SizedBox(height: 10), // Jarak antara gambar dan teks
                              // Judul atau teks
                              Text(
                                'Transaksi Masuk',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Second Row of Cards
            SizedBox(height: 20),
            Container(
              height: 220,
              padding: EdgeInsets.all(20),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Fungsi yang akan dijalankan saat card diklik
                      Get.toNamed('/laporan-masuk'); // Ganti dengan halaman tujuan
                    },
                    child: Container(
                      width: 200,
                      margin: EdgeInsets.only(right: 20),
                      child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              // Gambar
                              Image.asset(
                                '../assets/images/laporan_in.png', // Ganti dengan path gambar Anda
                                width: 90, // Ukuran gambar
                                height: 90,
                              ),
                              SizedBox(height: 10), // Jarak antara gambar dan teks
                              // Judul atau teks
                              Text(
                                'Laporan Masuk',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Fungsi yang akan dijalankan saat card diklik
                      Get.toNamed('/laporan-keluar'); // Ganti dengan halaman tujuan
                    },
                    child: Container(
                      width: 200,
                      margin: EdgeInsets.only(right: 20),
                      child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              // Gambar
                              Image.asset(
                                '../assets/images/laporan_out-removebg-preview.png', // Ganti dengan path gambar Anda
                                width: 90, // Ukuran gambar
                                height: 90,
                              ),
                              SizedBox(height: 10), // Jarak antara gambar dan teks
                              // Judul atau teks
                              Text(
                                'Laporan Keluar',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
