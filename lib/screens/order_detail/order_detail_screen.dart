import 'package:flutter/material.dart';
import 'package:online_shop_app/components/default_button.dart';
import 'package:online_shop_app/models/CartProduct.dart';
import 'package:online_shop_app/models/Orders.dart';

import '../../size_config.dart';
import 'components/body.dart';

class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({Key? key}) : super(key: key);
  static String routeName = "/order_detail_screen";

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Orders;
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(
        orderDetails: args.orderDetails,
      ),
      bottomNavigationBar: (args.state == "Chờ xác nhận")
          ? DefaultButton(
              text: "Hủy đơn hàng",
              press: () {},
            )
          : SizedBox(
              width: double.infinity,
              height: getProportionateScreenHeight(20),
            ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "Chi tiết đơn hàng",
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
