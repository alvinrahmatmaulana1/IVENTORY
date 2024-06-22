import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mobile_inventory/app/providers/api.dart';
import 'package:mobile_inventory/app/data/barang_models.dart';

class BarangController extends GetxController {
  var barang = <Barang>[].obs;
  var isLoggedIn = true.obs;
  var filteredBarang = <Barang>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      var token = localStorage.getString('token');

      if (token == null) {
        throw Exception('Token not found');
      }

      var headers = {'Authorization': 'Bearer $token'};

      var apiUrl = 'products'; // Sesuaikan dengan endpoint API yang benar
      var response = await http.get(Uri.parse(Api.baseUrl + apiUrl), headers: headers);

      if (response.statusCode == 200) {
        var apiResponse = json.decode(response.body)['rows'];
        List<Barang> listBarang = [];
        for (var item in apiResponse) {
          listBarang.add(Barang.fromJson(item));
        }
        barang.value = listBarang;
        filteredBarang.value = listBarang; // Inisialisasi filteredBarang dengan semua barang
      } else {
        throw Exception('Failed to load product');
      }
    } catch (e) {
      print('Error during fetching product details: $e');
    } finally {
      isLoggedIn.value = false;
    }
  }

  Future<Barang?> getProductByKodeBarang(String kodeBarang) async {
    try {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      var token = localStorage.getString('token');

      if (token == null) {
        throw Exception('Token not found');
      }

      var headers = {'Authorization': 'Bearer $token'};

      var apiUrl = 'products/$kodeBarang'; // Endpoint untuk mendapatkan produk berdasarkan kode barang
      var response = await http.get(Uri.parse(Api.baseUrl + apiUrl), headers: headers);

      if (response.statusCode == 200) {
        var apiResponse = json.decode(response.body);
        var barang = Barang.fromJson(apiResponse);
        return barang;
      } else if (response.statusCode == 404) {
        return null; // Produk tidak ditemukan berdasarkan kode barang
      } else {
        throw Exception('Failed to load product');
      }
    } catch (e) {
      print('Error during fetching product details: $e');
      return null;
    }
  }

  void searchBarang(String searchText) {
    String query = searchText.toLowerCase();
    var result = barang.where((barang) => barang.namaBarang!.toLowerCase().contains(query)).toList();
    filteredBarang.assignAll(result);
  }
}
