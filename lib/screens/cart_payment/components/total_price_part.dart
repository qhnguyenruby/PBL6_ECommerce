import 'package:flutter/material.dart';
import 'package:online_shop_app/size_config.dart';

class TotalPricePart extends StatelessWidget {
  const TotalPricePart({
    Key? key,
    required this.count,
    required this.totalPrice,
  }) : super(key: key);
  final int count;
  final int totalPrice;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: getProportionateScreenHeight(38),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Color(0xFFBBBBBB)),
            bottom: BorderSide(color: Color(0xFFBBBBBB)),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Text(
                "${count} sản phẩm",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            // SizedBox(
            //   width: getProportionateScreenWidth(120),
            // ),
            Flexible(
              child: Text(
                "Tổng tiền: $totalPrice đ",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
