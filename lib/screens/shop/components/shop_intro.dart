import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_shop_app/models/Shop.dart';
import 'package:online_shop_app/size_config.dart';

import '../../../constants.dart';

class ShopIntro extends StatelessWidget {
  const ShopIntro({Key? key, required this.shop}) : super(key: key);
  final Shop shop;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          SizedBox(
            height: 115,
            width: 115,
            child: Stack(
              fit: StackFit.expand,
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                  backgroundImage:
                      NetworkImage("$SERVER_IP/apigateway/Shops${shop.avatar}"),
                ),
              ],
            ),
          ),
          SizedBox(
            width: getProportionateScreenWidth(12),
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Container(
                width: getProportionateScreenWidth(200),
                child: Text(
                  "${shop.nameOfShop}",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(fontSize: 22),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
