import 'dart:convert';

Shop shopFromJson(String str) => Shop.fromJson(json.decode(str));

String shopToJson(Shop data) => json.encode(data.toJson());

class Shop {
  Shop({
    required this.shopId,
    required this.nameOfShop,
    required this.avatar,
    required this.phoneNumber,
    required this.address,
    required this.description,
  });

  int shopId;
  String nameOfShop;
  String avatar;
  String phoneNumber;
  String address;
  String description;

  factory Shop.fromJson(Map<String, dynamic> json) => Shop(
        shopId: json["resultObj"]["shopId"],
        nameOfShop: json["resultObj"]["nameOfShop"],
        avatar: json["resultObj"]["avatar"],
        phoneNumber: json["resultObj"]["phoneNumber"],
        address: json["resultObj"]["address"],
        description: json["resultObj"]["description"],
      );

  Map<String, dynamic> toJson() => {
        "shopId": shopId,
        "nameOfShop": nameOfShop,
        "avatar": avatar,
        "phoneNumber": phoneNumber,
        "address": address,
        "description": description,
      };
}
