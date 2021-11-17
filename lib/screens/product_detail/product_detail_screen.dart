import 'package:flutter/material.dart';
import 'package:online_shop_app/models/ProductDetail.dart';
import 'package:online_shop_app/screens/product_detail/components/body.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);
  static String routeName = "/product_detail";

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments agrs =
        ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments;
    return Scaffold(
      body: Body(
        product: agrs.product,
      ),
    );
  }
}

class ProductDetailsArguments {
  final ProductDetail product;

  ProductDetailsArguments({required this.product});
}
