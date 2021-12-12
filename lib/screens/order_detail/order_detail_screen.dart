import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:online_shop_app/components/default_button.dart';
import 'package:online_shop_app/function/dialog.dart';
import 'package:online_shop_app/models/CartProduct.dart';
import 'package:online_shop_app/models/Orders.dart';
import 'package:online_shop_app/services/order_service.dart';

import '../../size_config.dart';
import 'components/body.dart';

class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({Key? key}) : super(key: key);
  static String routeName = "/order_detail_screen";

  @override
  Widget build(BuildContext context) {
    OrderService orderService = OrderService();
    final args = ModalRoute.of(context)!.settings.arguments as Orders;
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(
        orderDetails: args.orderDetails,
      ),
      bottomNavigationBar: (args.state == "Chờ xác nhận")
          ? DefaultButton(
              text: "Hủy đơn hàng",
              press: () {
                orderService.CancelOrder(args.id, args.cancelReason)
                    .then((value) {
                  if (value.statusCode == 200) {
                    displayDialog(context, "Thông báo",
                        json.decode(value.body)["message"]);
                  } else if (value.statusCode == 500) {
                    displayDialog(context, "Thông báo", "Lỗi server!");
                  } else {
                    displayDialog(context, "Thông báo", value.body);
                  }
                });
                Navigator.pop(context);
              },
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
