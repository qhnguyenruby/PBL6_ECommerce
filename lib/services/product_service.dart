import 'package:online_shop_app/constants.dart';
import 'package:http/http.dart' as http;
import 'package:online_shop_app/models/ProductDetail.dart';
import 'package:online_shop_app/models/ProductHomeView.dart';
import 'package:online_shop_app/models/ProductPagingResponse.dart';
import 'package:online_shop_app/models/SearchProductsRequest.dart';
import 'package:online_shop_app/models/SortProductsRequest.dart';

class ProductService {
  // ProductService() {}

  static final ProductService _singleton = ProductService._internal();

  factory ProductService() {
    return _singleton;
  }

  ProductService._internal();

  Future<List<ProductHomeView>> GetProductPaging(
      SortProductsRequest sortProductsRequest) async {
    var pageIndex = sortProductsRequest.pageIndex;
    var pageSize = sortProductsRequest.pageSize;
    var sortBy = sortProductsRequest.sortBy;
    var url =
        "${SERVER_IP}/api/Products/paging?PageIndex=${pageIndex}&PageSize=${pageSize}&SortBy=${sortBy}";
    var res = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    print('Response status: ${res.statusCode}');

    if (res.statusCode == 200) {
      return productPagingResponseFromJson(res.body).items;
    } else {
      throw Exception("Failed to get product paging!");
    }
  }

  Future<List<ProductHomeView>> SearchProduct(
      SearchProductsRequest searchProductsRequest) async {
    var pageIndex = searchProductsRequest.pageIndex;
    var pageSize = searchProductsRequest.pageSize;
    var sortBy = searchProductsRequest.sortBy;
    var key = searchProductsRequest.key;
    var url =
        "${SERVER_IP}/api/Products/paging?PageIndex=${pageIndex}&PageSize=${pageSize}&SortBy=${sortBy}&Keyword=${key}";
    var res = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    print('Response status: ${res.statusCode}');

    if (res.statusCode == 200) {
      return productPagingResponseFromJson(res.body).items;
    } else if (res.statusCode == 204) {
      return [];
    } else {
      throw Exception("Failed to search product!");
    }
  }

  Future<ProductDetail> getProductDetailById(int id) async {
    var url = "${SERVER_IP}/api/Products/$id";
    var res = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    print('Response status: ${res.statusCode}');

    if (res.statusCode == 200) {
      return productDetailFromJson(res.body);
    } else {
      throw Exception("Failed to get product detail!");
    }
  }
}
