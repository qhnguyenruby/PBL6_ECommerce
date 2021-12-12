import 'dart:convert';

import 'package:online_shop_app/constants.dart';
import 'package:http/http.dart' as http;
import 'package:online_shop_app/function/local_storage.dart';
import 'package:online_shop_app/models/ApiResponse.dart';

class CartService {
  // CartService() {}

  static final CartService _singleton = CartService._internal();

  factory CartService() {
    return _singleton;
  }

  CartService._internal();

  Future<ApiResponse> AddProductToCart(
      int productDetailId, int quantity) async {
    var url = "${SERVER_IP}/api/Carts";
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
    return new ApiResponse(statusCode: res.statusCode, body: res.body);
  }

  Future<ApiResponse> GetCart() async {
    var url = "${SERVER_IP}/api/Carts/me";
    var token = await getTokenStorage();
    var res = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    print('Response status: ${res.statusCode}');

    return new ApiResponse(statusCode: res.statusCode, body: res.body);
  }

  Future<ApiResponse> DeleteProductFromCart(int cartItemId) async {
    var url = "${SERVER_IP}/api/Carts";
    var token = await getTokenStorage();
    List<int> productIds = [];
    productIds.add(cartItemId);
    var res = await http.delete(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: json.encode(productIds),
    );
    print('Response status: ${res.statusCode}');

    return ApiResponse(statusCode: res.statusCode, body: res.body);
  }

  Future<ApiResponse> UpdateQuantityCartProduct(
      int cartProductId, int quantity) async {
    var url = "${SERVER_IP}/api/Carts";
    var token = await getTokenStorage();
    Map data = {
      "cartId": cartProductId,
      "quantity": quantity,
    };
    var res = await http.patch(
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
