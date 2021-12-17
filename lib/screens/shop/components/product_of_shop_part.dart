import 'package:flutter/material.dart';
import 'package:online_shop_app/components/grid_product.dart';
import 'package:online_shop_app/constants.dart';
import 'package:online_shop_app/models/ProductHomeView.dart';

import '../../../size_config.dart';

class ProductOfShopPart extends StatelessWidget {
  const ProductOfShopPart({Key? key, required this.listListProduct})
      : super(key: key);

  final List<List<ProductHomeView>> listListProduct;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(612),
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: TabBar(
            isScrollable: true,
            labelColor: kPrimaryColor,
            unselectedLabelColor: Colors.blueGrey,
            tabs: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Mới nhất",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Phổ biến",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Giá thấp đến cao",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Giá cao đến thấp",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
          body: TabBarView(
            children: [
              ...List.generate(
                4,
                (index) {
                  return GridProduct(
                    inputHeight: 550,
                    products: listListProduct[index],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
