import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_shop_app/components/default_button.dart';
import 'package:online_shop_app/function/dialog.dart';
import 'package:online_shop_app/models/CartProduct.dart';
import 'package:online_shop_app/screens/cart_payment/cart_payment_screen.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({
    Key? key,
    required this.totalAmount,
    required this.cartProducts,
  }) : super(key: key);

  final int totalAmount;
  final List<CartProduct> cartProducts;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(15),
        horizontal: getProportionateScreenWidth(30),
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        // borderRadius: BorderRadius.only(
        //   topLeft: Radius.circular(30),
        //   topRight: Radius.circular(30),
        // ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "Tổng tiền:\n",
                    children: [
                      TextSpan(
                        text: "$totalAmount đ",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(190),
                  child: DefaultButton(
                    text: "Mua hàng",
                    press: () {
                      if (cartProducts.length > 0) {
                        Navigator.pushNamed(
                          context,
                          CartPayment.routeName,
                          arguments: cartProducts,
                        );
                      } else {
                        displayDialog(
                          context,
                          "Thông báo",
                          "Chọn sản phẩm muốn thanh toán!",
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
