import 'package:flutter/material.dart';
import 'package:online_shop_app/models/ProductHomeView.dart';
import 'package:online_shop_app/models/SortProductsRequest.dart';
import 'package:online_shop_app/screens/home/components/sort_field.dart';
import 'package:online_shop_app/services/product_service.dart';
import '../../../size_config.dart';
import 'home_header.dart';

class Body extends StatelessWidget {
  Future<List<ProductHomeView>> getInitProductList() async {
    ProductService productService = ProductService();
    var response = await productService.GetProductPaging(
      SortProductsRequest(
        pageIndex: 1,
        pageSize: 10,
        sortBy: "lastest",
      ),
    );
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getInitProductList(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              SizedBox(height: getProportionateScreenHeight(30)),
              HomeHeader(),
              // SizedBox(height: getProportionateScreenHeight(10)),
              // SortProductField(),
              SortField(
                lastestProducs: snapshot.data as List<ProductHomeView>,
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const Center(child: CircularProgressIndicator());
      },
    );

    // return Column(
    //   children: [
    //     SizedBox(height: getProportionateScreenHeight(30)),
    //     HomeHeader(),
    //     // SizedBox(height: getProportionateScreenHeight(10)),
    //     // SortProductField(),

    //     SafeArea(
    //       child: Column(
    //         children: [
    //           SortField(lastestProducs: lastProducts),
    //           // DiscountBanner(),
    //           // Categories(),
    //           // SpecialOffers(),
    //           // SizedBox(height: getProportionateScreenWidth(30)),
    //           // LastestProducts(),
    //           // PopularProducts(),
    //         ],
    //       ),
    //     ),
    //   ],
    // );
  }
}
