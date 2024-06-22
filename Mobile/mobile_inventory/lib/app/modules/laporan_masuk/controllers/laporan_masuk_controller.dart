import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mobile_inventory/app/providers/api.dart';
import 'package:mobile_inventory/app/data/laporanmasuk_models.dart';

class LaporanMasukController extends GetxController {
  var laporan_masuk = <Laporan_Masuk>[].obs;
  var isLoggedIn = true.obs;
  

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
      var apiUrl = 'laporan_masuks/me'; // Sesuaikan dengan endpoint API yang benar
      var response =
          await http.get(Uri.parse(Api.baseUrl + apiUrl), headers: headers);

      if (response.statusCode == 200) {
        var apiResponse = json.decode(response.body);
        if (apiResponse is List) {
          laporan_masuk.assignAll(
              apiResponse.map((data) => Laporan_Masuk.fromJson(data)).toList());
        } else {
          throw Exception('Invalid response format');
        }
      } else {
        throw Exception('Failed to load product');
      }
    } catch (e) {
      print('Error during fetching product details: $e');
    } finally {
      isLoggedIn.value = false;
    }
  }
}
