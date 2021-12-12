import 'dart:convert';

import 'package:online_shop_app/constants.dart';
import 'package:online_shop_app/function/local_storage.dart';
import 'package:http/http.dart' as http;
import 'package:online_shop_app/models/ApiResponse.dart';
import 'package:online_shop_app/models/ChangePassword.dart';
import 'package:online_shop_app/models/UserUpdate.dart';
import 'package:online_shop_app/screens/ChangePassword/components/change_pass_form.dart';

class UserService {
  // UserService() {}

  static final UserService _singleton = UserService._internal();

  factory UserService() {
    return _singleton;
  }

  UserService._internal();

  Future<UserUpdate> GetUserByToken() async {
    var url = "${SERVER_IP}/api/Users/me";
    var token = await getTokenStorage();
    var res = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    print('Response status: ${res.statusCode}');

    if (res.statusCode == 200) {
      return UserUpdate.fromJson(json.decode(res.body));
    } else {
      throw Exception("Failed to get current user!");
    }
  }

  Future<ApiResponse> UpdateUser(UserUpdate userUpdate) async {
    var url = "${SERVER_IP}/api/Users/me";
    Map data = {
      "fullName": userUpdate.fullName,
      "email": userUpdate.email,
      "phoneNumber": userUpdate.phoneNumber,
      "address": userUpdate.address,
    };
    var token = await getTokenStorage();
    var res = await http.put(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: json.encode(data),
    );
    print('Response reponse update: ${res.body}');

    // return json.decode(res.body);
    return ApiResponse(statusCode: res.statusCode, body: res.body);
  }

  Future<int> ForgotPassword(String email) async {
    var url = "${SERVER_IP}/api/Users/$email/ForgetPassword";
    var res = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
    );
    print('Response status: ${res.statusCode}');

    // if (res.statusCode == 200) {
    //   jsonResponse = json.decode(res.body);
    //   if (jsonResponse != null) {
    //   }
    // }
    return res.statusCode;
  }

  Future<ApiResponse> ChangePass(ChangePassword changePassword) async {
    var url = "${SERVER_IP}/api/Users/Password";
    Map data = {
      "currentPassword": changePassword.currentPass,
      "newPassword": changePassword.newPass,
    };
    var token = await getTokenStorage();
    var res = await http.patch(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: json.encode(data),
    );
    print('Response reponse update: ${res.body}');

    // return json.decode(res.body);
    return ApiResponse(statusCode: res.statusCode, body: res.body);
  }
}
