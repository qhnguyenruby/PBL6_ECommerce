// To parse this JSON data, do
//
//     final productDetail = productDetailFromJson(jsonString);

import 'dart:convert';

ProductDetail productDetailFromJson(String str) =>
    ProductDetail.fromJson(json.decode(str));

String productDetailToJson(ProductDetail data) => json.encode(data.toJson());

class ProductDetail {
  ProductDetail({
    required this.id,
    required this.name,
    required this.description,
    required this.gender,
    required this.price,
    required this.originalPrice,
    required this.viewCount,
    required this.dateCreated,
    required this.categoryName,
    required this.shopId,
    required this.shopName,
    required this.totalStock,
    required this.details,
    required this.images,
  });

  int id;
  String name;
  String description;
  int gender;
  int price;
  int originalPrice;
  int viewCount;
  DateTime dateCreated;
  String categoryName;
  int shopId;
  String shopName;
  int totalStock;
  List<Detail> details;
  List<ImageItem> images;

  factory ProductDetail.fromJson(Map<String, dynamic> json) => ProductDetail(
        id: json["resultObj"]["id"],
        name: json["resultObj"]["name"],
        description: json["resultObj"]["description"],
        gender: json["resultObj"]["gender"],
        price: json["resultObj"]["price"],
        originalPrice: json["resultObj"]["originalPrice"],
        viewCount: json["resultObj"]["viewCount"],
        dateCreated: DateTime.parse(json["resultObj"]["dateCreated"]),
        categoryName: json["resultObj"]["categoryName"],
        shopId: json["resultObj"]["shopId"],
        shopName: json["resultObj"]["shopName"],
        totalStock: json["resultObj"]["totalStock"],
        details: List<Detail>.from(
            json["resultObj"]["details"].map((x) => Detail.fromJson(x))),
        images: List<ImageItem>.from(
            json["resultObj"]["images"].map((x) => ImageItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "gender": gender,
        "price": price,
        "originalPrice": originalPrice,
        "viewCount": viewCount,
        "dateCreated": dateCreated.toIso8601String(),
        "categoryName": categoryName,
        "shopId": shopId,
        "shopName": shopName,
        "totalStock": totalStock,
        "details": List<dynamic>.from(details.map((x) => x.toJson())),
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
      };
}

class Detail {
  Detail({
    required this.id,
    required this.productId,
    required this.color,
    required this.size,
    required this.stock,
  });

  int id;
  int productId;
  String color;
  String size;
  int stock;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        id: json["id"],
        productId: json["productId"],
        color: json["color"],
        size: json["size"],
        stock: json["stock"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "productId": productId,
        "color": color,
        "size": size,
        "stock": stock,
      };
}

class ImageItem {
  ImageItem({
    required this.id,
    required this.productId,
    required this.imagePath,
    required this.isDefault,
    required this.colorName,
    required this.isSizeDetail,
  });

  int id;
  int productId;
  String imagePath;
  bool isDefault;
  String colorName;
  bool isSizeDetail;

  factory ImageItem.fromJson(Map<String, dynamic> json) => ImageItem(
        id: json["id"],
        productId: json["productId"],
        imagePath: json["imagePath"],
        isDefault: json["isDefault"],
        colorName: json["colorName"] == null ? "không màu" : json["colorName"],
        isSizeDetail: json["isSizeDetail"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "productId": productId,
        "imagePath": imagePath,
        "isDefault": isDefault,
        "colorName": colorName,
        "isSizeDetail": isSizeDetail,
      };
}
