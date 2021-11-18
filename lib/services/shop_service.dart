import 'package:online_shop_app/constants.dart';
import 'package:http/http.dart' as http;
import 'package:online_shop_app/models/Shop.dart';

class ShopService {
  ShopService() {}

  Future<Shop> getShopById(int id) async {
    var url = "${SERVER_IP}/api/Shops/Id?userId=0&shopId=$id";
    var res = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    print('Response status: ${res.statusCode}');

    if (res.statusCode == 200) {
      return shopFromJson(res.body);
    } else {
      throw Exception("Failed to get product detail!");
    }
  }
}
