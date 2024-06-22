import 'dart:convert';
import 'package:mobile_inventory/app/data/transaksikeluar_model.dart';
import 'package:mobile_inventory/app/modules/transaksi_keluar/views/show_transaksi_keluar.dart';
import 'package:mobile_inventory/app/providers/api.dart';
import 'package:mobile_inventory/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_inventory/app/modules/profil/controllers/profil_controller.dart';
import 'package:mobile_inventory/app/modules/barang/controllers/barang_controller.dart';
class TransaksiKeluarController extends GetxController {
   var transaksi_keluar = <Transaksi_Keluar>[].obs;

   BarangController barangController = Get.put(BarangController()); // Mendapatkan instance controller barang
  ProfilController profilController = Get.put(ProfilController());

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      var apiUrl = '${Api.baseUrl}transaksi_keluars/me';
      var headers = await Api.getHeaders();

      var response = await http.get(
        Uri.parse(apiUrl),
        headers: headers,
      );

      if (response.statusCode == 200) {
         var apiResponse = json.decode(response.body);
        if (apiResponse is List) {
          transaksi_keluar.assignAll(
              apiResponse.map((data) => Transaksi_Keluar.fromJson(data)).toList());
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

  //create
  Future<void> tambahTransaksikeluar(
    String tanggalKeluar,
    String jumlahKeluar,
    String kodeBarang,
  ) async {
    try {
      if (tanggalKeluar.isEmpty || jumlahKeluar.isEmpty || kodeBarang.isEmpty) {
        Get.snackbar('Error', 'Semua field harus diisi');
        return;
      }

      // Mendapatkan ID produk dari kode barang
      final productData = await barangController.getProductByKodeBarang(kodeBarang);
      if (productData != null) {
        final productId = productData.id;

        // Mendapatkan ID pengguna dari controller profil
        final userId = profilController.users['id'];

        // Melakukan penambahan transaksi dengan ID produk dan ID pengguna yang diperoleh
        var apiUrl = '${Api.baseUrl}transaksi_keluars';
        var headers = await Api.getHeaders();

        var response = await http.post(
          Uri.parse(apiUrl),
          headers: headers,
          body: {
            'tanggal_keluar': tanggalKeluar,
            'products_id': productId.toString(),
            'users_id': userId.toString(),
            'jumlah_keluar': jumlahKeluar,
          },
        );

        if (response.statusCode == 200) {
          Get.snackbar('Sukses', 'Transaksi berhasil ditambahkan');
          fetchData();
          Get.offAndToNamed(Routes.TRANSAKSI_KELUAR); // Redirect ke halaman Transaksi
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

  

  // Show
  void showTransaksiDetails(Transaksi_Keluar transaksi_keluar) {
    Get.to(() => DetailTransaksikeluarView(transaksi_keluar: transaksi_keluar));
  }

  


}