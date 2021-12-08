import 'package:flutter/material.dart';
import 'package:online_shop_app/components/order_cart.dart';
import 'package:online_shop_app/components/section_title.dart';
import 'package:online_shop_app/models/CartProduct.dart';
import 'package:online_shop_app/models/Orders.dart';
import 'package:online_shop_app/screens/cart_payment/components/product_selected_list.dart';
import 'package:online_shop_app/screens/order_detail/components/order_detail_cart.dart';
import 'package:online_shop_app/screens/order_detail/order_detail_screen.dart';

import '../../../size_config.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.orderDetails,
  }) : super(key: key);
  final List<OrderDetail> orderDetails;

  @override
  Widget build(BuildContext context) {
    return OrderDetailCart(orderDetails: orderDetails);
  }
}
