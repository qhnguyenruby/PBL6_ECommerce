import 'package:online_shop_app/constants.dart';
import 'package:http/http.dart' as http;
import 'package:online_shop_app/models/ProductHomeView.dart';
import 'package:online_shop_app/models/ProductPagingResponse.dart';
import 'package:online_shop_app/models/SortProductsRequest.dart';

class ProductService {
  ProductService() {}

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
}
