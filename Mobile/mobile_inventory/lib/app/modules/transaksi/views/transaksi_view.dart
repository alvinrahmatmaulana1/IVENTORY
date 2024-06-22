import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/transaksi_controller.dart';

class TransaksiView extends GetView<TransaksiController> {
  const TransaksiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TransaksiView'),
        centerTitle: true,
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
                      flex: 2,
                      child: Image.asset(
                        'assets/images/hello.png', // Ganti dengan path gambar Anda
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Teks "Selamat datang di menu Transaksi"
                    Expanded(
                      flex: 3,
                      child: Center(
                        child: Text(
                          'Selamat datang di menu Transaksi',
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
            // First Column of Cards
            SizedBox(height: 20),
            
                  GestureDetector(
                    onTap: () {
                      // Fungsi yang akan dijalankan saat card diklik
                      Get.toNamed('/transaksi-keluar'); // Ganti dengan halaman tujuan
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20), // Jarak antara card
                      child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Row(
                            children: [
                              // Logo Flutter di sebelah kiri
                              Image.asset(
                                '../assets/images/smartphone_5568990.png', // Ganti dengan path gambar Anda
                                width: 90, // Ukuran gambar
                                height: 90,
                              ),
                              SizedBox(width: 10), // Jarak antara logo dan teks
                              // Judul atau teks di sebelah kanan
                              Text(
                                'Transaksi Keluar',
                                style: TextStyle(
                                  fontSize: 20,
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
                      margin: EdgeInsets.only(bottom: 20), // Jarak antara card
                      child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Row(
                            children: [
                              // Logo Flutter di sebelah kiri
                              Image.asset(
                                '../assets/images/slide_2050798.png', // Ganti dengan path gambar Anda
                                width: 90, // Ukuran gambar
                                height: 90,
                              ),
                              SizedBox(width: 10), // Jarak antara logo dan teks
                              // Judul atau teks di sebelah kanan
                              Text(
                                'Transaksi Masuk',
                                style: TextStyle(
                                  fontSize: 20,
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
          
        
    );
  }
}
