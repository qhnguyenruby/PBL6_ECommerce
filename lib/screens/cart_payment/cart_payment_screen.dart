import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:online_shop_app/components/default_button.dart';
import 'package:online_shop_app/constants.dart';
import 'package:online_shop_app/function/dialog.dart';
import 'package:online_shop_app/models/CartProduct.dart';
import 'package:online_shop_app/screens/cart_payment/components/body.dart';
import 'package:online_shop_app/services/order_service.dart';
import 'package:online_shop_app/services/user_service.dart';

class CartPayment extends StatefulWidget {
  const CartPayment({Key? key}) : super(key: key);
  static String routeName = "/cart_payment";

  @override
  _CartPaymentState createState() => _CartPaymentState();
}

class _CartPaymentState extends State<CartPayment> {
  @override
  Widget build(BuildContext context) {
    List<int> cartIds = [];
    final args =
        ModalRoute.of(context)!.settings.arguments as List<CartProduct>;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Thanh toán"),
        backgroundColor: kPrimaryColor,
      ),
      body: Body(cartProducts: args),
      bottomNavigationBar: DefaultButton(
        text: "Đặt hàng",
        press: () async {
          for (var item in args) {
            cartIds.add(item.id);
          }
          var shipInfo = await UserService().GetUserByToken();
          OrderService()
              .CreateOrder(cartIds, shipInfo.fullName, shipInfo.address,
                  shipInfo.phoneNumber)
              .then((value) {
            if (value.statusCode == 200) {
              displayDialog(
                context,
                "Thông báo",
                json.decode(value.body)['message'].toString(),
              );
            } else {
              displayDialog(
                context,
                "Thông báo",
                value.body,
              );
            }
          });
          // Navigator.popUntil(
          //     context, ModalRoute.withName(ProductDetailScreen.routeName));
        },
      ),
    );
  }
}
