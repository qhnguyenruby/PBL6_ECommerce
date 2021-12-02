import 'package:flutter/material.dart';
import 'package:online_shop_app/models/CartProduct.dart';
import 'package:online_shop_app/screens/cart_payment/components/address_part.dart';
import 'package:online_shop_app/screens/cart_payment/components/product_selected_list.dart';
import 'package:online_shop_app/screens/cart_payment/components/total_price_part.dart';

class Body extends StatelessWidget {
  final List<CartProduct> cartProducts;

  const Body({
    Key? key,
    required this.cartProducts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          AddressPart(),
          ProductSelectedList(cartProducts: cartProducts),
          // TotalPricePart(),
        ],
      ),
    );
  }
}
