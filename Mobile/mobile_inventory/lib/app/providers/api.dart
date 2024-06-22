import 'package:shared_preferences/shared_preferences.dart';

class Api {
  static final String baseUrl = 'http://192.168.253.94:3000/api/v1/';

  static Future<Map<String, String>> getHeaders() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String? token = localStorage.getString('token');

    if(token !=  null) {
       return {'Authorization': 'Bearer $token'};
    } else {
      return{};
}
}
}