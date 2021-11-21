import 'dart:convert';

import 'package:online_shop_app/constants.dart';
import 'package:http/http.dart' as http;
import 'package:online_shop_app/function/local_storage.dart';

class CartService {
  CartService() {}

  Future<int> AddProductToCart(int productDetailId, int quantity) async {
    var url = "${SERVER_IP}/api/Cart";
    var token = await getTokenStorage();
    Map data = {
      "productDetail_Id": productDetailId,
      "quantity": quantity,
    };
    var res = await http.post(
      Uri.parse(url),
      body: json.encode(data),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    print('Response status: ${res.statusCode}');

    return res.statusCode;
  }
}
