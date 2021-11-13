import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:online_shop_app/constants.dart';
import 'package:online_shop_app/local_storage/shared_preferences.dart';
import 'package:online_shop_app/models/LoginRequest.dart';
import 'package:online_shop_app/models/RegisterRequest.dart';

class AccountService {
  AccountService() {}

  Future<int> Login(LoginRequest loginRequest) async {
    // var url = Uri.https('$SERVER_IP', '/api/Accounts/login', {'q': '{http}'});
    // var url = Uri.parse("${SERVER_IP}/api/Accounts/login");
    var url = "${SERVER_IP}/api/Accounts/login";
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {
      "username": loginRequest.username,
      "password": loginRequest.password,
    };
    var jsonResponse = null;
    var res = await http.post(
      Uri.parse(url),
      body: json.encode(data),
      headers: {'Content-Type': 'application/json'},
    );
    print('Response status: ${res.statusCode}');

    if (res.statusCode == 200) {
      jsonResponse = json.decode(res.body);
      print('Response status: ${res.statusCode}');
      print('Response body: ${res.body}');
      if (jsonResponse != null) {
        LocalStorage().saveToken(jsonResponse['resultObj']);
        print('token: ${jsonResponse['resultObj']}');
      }
    }
    return res.statusCode;
  }
}
