import 'package:flutter/material.dart';
import 'package:online_shop_app/components/custom_btn.dart';
import 'package:online_shop_app/components/default_button.dart';
import 'package:online_shop_app/constants.dart';
import 'package:online_shop_app/models/CartProduct.dart';
import 'package:online_shop_app/screens/cart_payment/components/body.dart';

class CartPayment extends StatelessWidget {
  const CartPayment({Key? key}) : super(key: key);
  static String routeName = "/cart_payment";

  @override
  Widget build(BuildContext context) {
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
        press: () {},
      ),
    );
  }
}
