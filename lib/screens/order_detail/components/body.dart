import 'package:flutter/material.dart';
import 'package:online_shop_app/models/Orders.dart';
import 'package:online_shop_app/screens/order_detail/components/order_detail_cart.dart';

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
