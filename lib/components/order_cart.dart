import 'package:flutter/material.dart';
import 'package:online_shop_app/models/Orders.dart';
import 'package:online_shop_app/screens/cart_payment/components/total_price_part.dart';

import '../constants.dart';
import '../size_config.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    Key? key,
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.orders,
    required this.totalPrice,
    required this.state,
  }) : super(key: key);

  final double width, aspectRetio;
  final List<OrderDetail> orders;
  final int totalPrice;
  final String state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 88,
              child: AspectRatio(
                aspectRatio: 0.88,
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                  decoration: BoxDecoration(
                      color: Color(0xFFF5F6F9),
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: (orders[0].image != "/storage/" &&
                                orders[0].image != "")
                            ? NetworkImage(
                                "${SERVER_IP}/apigateway/Products${orders[0].image}")
                            : AssetImage("assets/images/notfoundimage.png")
                                as ImageProvider,
                      )),
                  // child: Image.asset(cartProduct.image),
                ),
              ),
            ),
            SizedBox(width: 20),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: getProportionateScreenWidth(210),
                    child: Text(
                      orders[0].productName,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.black, fontSize: 14),
                      maxLines: 2,
                    ),
                  ),
                  Text(
                    "Màu: ${orders[0].color}",
                    style: TextStyle(color: Colors.black, fontSize: 14),
                    maxLines: 2,
                  ),
                  Text(
                    "Size: ${orders[0].size}",
                    style: TextStyle(color: Colors.black, fontSize: 14),
                    maxLines: 2,
                  ),
                  Text.rich(
                    TextSpan(
                      text: "${orders[0].price} đ",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      text: "${state}",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: (state == "Đã xác nhận")
                            ? Colors.green
                            : (state == "Đã hủy")
                                ? Colors.red
                                : kPrimaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        TotalPricePart(
          count: orders.length,
          totalPrice: totalPrice,
        )
      ],
    );
  }
}
