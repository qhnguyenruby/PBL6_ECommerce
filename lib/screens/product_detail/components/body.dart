import 'package:flutter/material.dart';
import 'package:online_shop_app/models/ProductDetail.dart';
import 'package:online_shop_app/screens/product_detail/components/product_detail_field.dart';

class Body extends StatelessWidget {
  final ProductDetail product;

  const Body({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProductDetailField(
            product: product,
          ),
        ],
      ),
    );
  }
}
