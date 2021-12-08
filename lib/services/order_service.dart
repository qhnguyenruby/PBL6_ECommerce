import 'dart:convert';

import 'package:online_shop_app/constants.dart';
import 'package:http/http.dart' as http;
import 'package:online_shop_app/function/local_storage.dart';
import 'package:online_shop_app/models/ApiResponse.dart';

class OrderService {
  // CartService() {}

  static final OrderService _singleton = OrderService._internal();

  factory OrderService() {
    return _singleton;
  }

  OrderService._internal();

  Future<ApiResponse> CreateOrder(List<int> cartIds, String shipName,
      String shipAddress, String shipPhone) async {
    var url = "${SERVER_IP}/api/Orders";
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {
      "cartIds": cartIds,
      "shipName": shipName,
      "shipAddress": shipAddress,
      "shipPhone": shipPhone,
    };
    var token = await getTokenStorage();
    var res = await http.post(
      Uri.parse(url),
      body: json.encode(data),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    print('Response status: ${res.statusCode}');
    return new ApiResponse(statusCode: res.statusCode, body: res.body);
  }
}
