import 'package:flutter/material.dart';
import 'package:online_shop_app/components/product_card.dart';

import '../size_config.dart';

class GridProduct extends StatelessWidget {
  const GridProduct({
    Key? key,
    required this.inputHeight,
    required this.products,
  }) : super(key: key);

  final double inputHeight;
  final List products;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: getProportionateScreenHeight(inputHeight),
        child: GridView.count(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          crossAxisCount: 2,
          childAspectRatio: 2.0 / 3.0,
          children: [
            ...List.generate(
              products.length,
              (index) {
                return ProductCard(product: products[index]);

                // return SizedBox
                //     .shrink(); // here by default width and height is 0
              },
            ),
            // SizedBox(width: getProportionateScreenWidth(20)),
          ],
        ),
      ),
    );
  }
}
