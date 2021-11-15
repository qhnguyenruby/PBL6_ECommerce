import 'dart:convert';

import 'package:online_shop_app/models/ProductHomeView.dart';

ProductPagingResponse productPagingResponseFromJson(String str) =>
    ProductPagingResponse.fromJson(json.decode(str));

String productPagingResponseToJson(ProductPagingResponse data) =>
    json.encode(data.toJson());

class ProductPagingResponse {
  ProductPagingResponse({
    required this.pageIndex,
    required this.pageSize,
    required this.totalRecords,
    required this.pageCount,
    required this.items,
  });

  int pageIndex;
  int pageSize;
  int totalRecords;
  int pageCount;
  List<ProductHomeView> items;

  factory ProductPagingResponse.fromJson(Map<String, dynamic> json) =>
      ProductPagingResponse(
        pageIndex: json['resultObj']["pageIndex"],
        pageSize: json['resultObj']["pageSize"],
        totalRecords: json['resultObj']["totalRecords"],
        pageCount: json['resultObj']["pageCount"],
        items: List<ProductHomeView>.from(
            json['resultObj']["items"].map((x) => ProductHomeView.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pageIndex": pageIndex,
        "pageSize": pageSize,
        "totalRecords": totalRecords,
        "pageCount": pageCount,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}
