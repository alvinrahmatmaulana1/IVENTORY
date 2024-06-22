import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_inventory/app/data/transaksimasuk_model.dart';
import 'package:mobile_inventory/app/modules/transaksi_masuk/views/show_transaksi.dart';
import 'package:mobile_inventory/app/routes/app_pages.dart';
import 'package:mobile_inventory/app/providers/api.dart';
import 'package:mobile_inventory/app/modules/profil/controllers/profil_controller.dart';
import 'package:mobile_inventory/app/modules/barang/controllers/barang_controller.dart';

class TransaksiMasukController extends GetxController {
  var Transaksimsk = <Transaksi_Masuk>[].obs;

  BarangController barangControllers = Get.put(BarangController()); // Mendapatkan instance controller barang
  ProfilController profilControllers = Get.put(ProfilController());// Mendapatkan instance controller profil

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      var apiUrl = '${Api.baseUrl}transaksi_masuks/me';
      var headers = await Api.getHeaders();

      var response = await http.get(
        Uri.parse(apiUrl),
        headers: headers,
      );

      if (response.statusCode == 200) {
         var apiResponse = json.decode(response.body);
        if (apiResponse is List) {
          Transaksimsk.assignAll(
              apiResponse.map((data) => Transaksi_Masuk.fromJson(data)).toList());
        } else {
          throw Exception('Invalid response format');
        }
      } else {
        throw Exception('Failed to load transaksi');
      }
    } catch (e) {
      print('Error during fetching transaksi: $e');
    }
  }

  // Fungsi untuk menambahkan transaksi
  Future<void> tambahTransaksi(
    String tanggalMasuk,
    String jumlahMasuk,
    String kodeBarang,
  ) async {
    try {
      if (tanggalMasuk.isEmpty || jumlahMasuk.isEmpty || kodeBarang.isEmpty) {
        Get.snackbar('Error', 'Semua field harus diisi');
        return;
      }

      // Mendapatkan ID produk dari kode barang
      final productData = await barangControllers.getProductByKodeBarang(kodeBarang);
      if (productData != null) {
        final productId = productData.id;

        // Mendapatkan ID pengguna dari controller profil
        final userId = profilControllers.users['id'];

        // Melakukan penambahan transaksi dengan ID produk dan ID pengguna yang diperoleh
        var apiUrl = '${Api.baseUrl}transaksi_masuks';
        var headers = await Api.getHeaders();

        var response = await http.post(
          Uri.parse(apiUrl),
          headers: headers,
          body: {
            'tanggal_masuk': tanggalMasuk,
            'product_id': productId.toString(),
            'user_id': userId.toString(),
            'jumlah_masuk': jumlahMasuk,
          },
        );

        if (response.statusCode == 200) {
          Get.snackbar('Sukses', 'Transaksi berhasil ditambahkan');
          fetchData();
          Get.offAndToNamed(Routes.TRANSAKSI_MASUK); // Redirect ke halaman Transaksi
        } else {
          throw Exception('Failed to add Transaksi');
        }
      } else {
        Get.snackbar('Error', 'Produk dengan kode barang tersebut tidak ditemukan');
      }
    } catch (e) {
      print('Error during tambah Transaksi: $e');
      if (e is http.Response) {
        print('Response Body: ${e.body}');
      }
    }
  }

  // Fungsi untuk menampilkan detail transaksi
  void showTransaksiDetails(Transaksi_Masuk transaksimasuk) {
    Get.to(() => DetailTransaksiView(transaksimasuk: transaksimasuk));
  }
}
