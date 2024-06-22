import 'package:mobile_inventory/app/data/user_models.dart';
// import 'package:belajar_getx/app/modules/profile/views/profile_view.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mobile_inventory/app/providers/api.dart';

class ProfilController extends GetxController {
  //TODO: Implement ProfilController

  var isLoggedIn = true.obs;
  var users = {}.obs;
  
  

  @override
  void onInit(){
    super.onInit();
    fetchUserDetails();
  }

   Future<void> fetchUserDetails() async {
    try {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      var token = localStorage.getString('token');

      if (token == null) {
        throw Exception('Token not found');
      }

      var headers = {'Authorization': 'Bearer $token'};

      var apiUrl = 'auth/me'; // Adjust the API endpoint as needed
      var response = await http.get(Uri.parse(Api.baseUrl + apiUrl), headers: headers);

      if (response.statusCode == 200) {
        var apiResponse = json.decode(response.body);
        users.value = apiResponse;
      } else {
        throw Exception('Failed to load user detail');
      }
    } catch (e) {
      print('Error during fetching user details: $e');
    } finally {
      isLoggedIn.value = false;
    }
  }

  // Future<void> fecthUser(
  //   Users users,
    
  // ) async {
  //   try {

  //     SharedPreferences localStorage = await SharedPreferences.getInstance();
  //     var token = localStorage.getString('token');

  //     if (token == null) {
  //       throw Exception('Token not foud');
  //     } 
      
  //     var apiUrl = '${Api.baseUrl}user/${users.id}';
  //     var headers = await Api.getHeaders();

  //     var response = await http.put(
  //       Uri.parse(apiUrl),
  //       headers: headers,
  //     );

  //     if (response.statusCode == 200) {
  //       Get.snackbar('Sukses', 'Transaksi berhasil diubah');
  //       fetchUserDetails(); // Refresh the TransaksiList
  //       // Get.offAndToNamed(Routes.TRANSAKSI_MSK);
  //       Get.to(() => ProfileView(users: users));
  //     } else {
  //       throw Exception('Failed to edit Transaksi');
  //     }
  //   } catch (e) {
  //     print('Error during edit Transaksi: $e');
  //   }
  // }

  

  Future<void> logout() async{
    try {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.remove('token');
      localStorage.remove('user');

      Get.offAllNamed('/login');
    } catch (e) {
      print('Error during logout: $e');
    }
  }
}