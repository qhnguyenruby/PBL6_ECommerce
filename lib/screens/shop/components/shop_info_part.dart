import 'package:flutter/material.dart';
import 'package:online_shop_app/constants.dart';
import 'package:online_shop_app/models/Shop.dart';
import 'package:readmore/readmore.dart';

class ShopInfoPart extends StatelessWidget {
  const ShopInfoPart({Key? key, required this.shop}) : super(key: key);
  final Shop shop;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Địa chỉ: ",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
              ),
            ),
            Text(
              "${shop.address}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              "Số liên lạc: ",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
              ),
            ),
            Text(
              "${shop.phoneNumber}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              "Mô tả shop: ",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
              ),
            ),
            ReadMoreText(
              "${shop.description}",
              trimLines: 8,
              trimMode: TrimMode.Line,
              trimCollapsedText: 'Đọc thêm',
              trimExpandedText: 'Ẩn bớt',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Text("Mô tả sản phẩm: ", style: myStyle),
          ],
        ),
      ),
    );
  }
}
