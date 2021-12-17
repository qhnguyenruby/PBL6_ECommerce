import 'package:flutter/material.dart';
import 'package:online_shop_app/constants.dart';
import 'package:online_shop_app/models/ProductHomeView.dart';
import 'package:online_shop_app/models/Shop.dart';
import 'package:online_shop_app/models/SortProductsRequest.dart';
import 'package:online_shop_app/screens/shop/components/product_of_shop_part.dart';
import 'package:online_shop_app/screens/shop/components/shop_info_part.dart';
import 'package:online_shop_app/services/product_service.dart';
import 'package:online_shop_app/size_config.dart';

class ShopTabbar extends StatelessWidget {
  const ShopTabbar({Key? key, required this.shop}) : super(key: key);
  final Shop shop;

  @override
  Widget build(BuildContext context) {
    List<List<ProductHomeView>> listListProduct = [];
    getProductOfShop(int shopId) async {
      for (var i in ["lastest", "popular", "priceUp", "priceDown"]) {
        var res = await ProductService().GetProductPaging(
          SortProductsRequest(
              pageIndex: 1, pageSize: 10, shopId: shopId, sortBy: i),
        );
        listListProduct.add(res);
      }
    }

    getProductOfShop(shop.shopId);

    return Container(
      height: getProportionateScreenHeight(612),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: TabBar(
            labelColor: kPrimaryColor,
            unselectedLabelColor: Colors.blueGrey,
            tabs: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Thông tin shop",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Sản phẩm",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
          body: TabBarView(
            children: [
              ShopInfoPart(shop: shop),
              ProductOfShopPart(listListProduct: listListProduct),
            ],
          ),
        ),
      ),
    );
  }
}
