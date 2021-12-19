import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:online_shop_app/constants.dart';
import 'package:online_shop_app/local_storage/shared_preferences.dart';
import 'package:online_shop_app/models/ApiResponse.dart';
import 'package:online_shop_app/models/LoginRequest.dart';
import 'package:online_shop_app/models/RegisterRequest.dart';

class AccountService {
  // AccountService() {}

  static final AccountService _singleton = AccountService._internal();

  factory AccountService() {
    return _singleton;
  }

  AccountService._internal();

  Future<ApiResponse> Login(LoginRequest loginRequest) async {
    // var url = "${SERVER_IP}/api/Accounts/login";
    var url = "${SERVER_IP}/apigateway/Authen/login";
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
    return ApiResponse(statusCode: res.statusCode, body: res.body);
  }

  Future<ApiResponse> Register(RegisterRequest registerRequest) async {
    // var url = "${SERVER_IP}/api/Accounts/register";
    var url = "${SERVER_IP}/apigateway/Authen/register";
    Map data = {
      "fullName": registerRequest.fullName,
      "email": registerRequest.email,
      "phoneNumber": registerRequest.phoneNumber,
      "address": registerRequest.address,
      "username": registerRequest.username,
      "password": registerRequest.password,
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
        // sharedPreferences.setString("token", jsonResponse['resultObj']);
        LocalStorage().saveToken(jsonResponse['resultObj']);
      }
    }
    return ApiResponse(statusCode: res.statusCode, body: res.body);
  }
}
