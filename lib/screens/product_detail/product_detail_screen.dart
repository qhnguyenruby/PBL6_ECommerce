import 'package:flutter/material.dart';
import 'package:online_shop_app/screens/product_detail/components/body.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);
  static String routeName = "/product_detail";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

class ProductDetailsArguments {
  final ProductDetailScreen product;

  ProductDetailsArguments({required this.product});
}
