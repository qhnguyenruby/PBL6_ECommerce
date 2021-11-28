import 'dart:convert';

import 'package:online_shop_app/models/CartProduct.dart';

Carts cartsFromJson(String str) => Carts.fromJson(json.decode(str));

String cartsToJson(Carts data) => json.encode(data.toJson());

class Carts {
  Carts({
    required this.cartItems,
  });

  List<CartProduct> cartItems;

  factory Carts.fromJson(Map<String, dynamic> json) => Carts(
        cartItems: List<CartProduct>.from(
            json["resultObj"].map((x) => CartProduct.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "resultObj": List<dynamic>.from(cartItems.map((x) => x.toJson())),
      };
}
