import 'package:flutter/material.dart';
import 'package:online_shop_app/models/Shop.dart';
import 'package:online_shop_app/screens/shop/components/shop_intro.dart';
import 'package:online_shop_app/screens/shop/components/shop_tab_bar.dart';
import 'package:online_shop_app/size_config.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.shop,
  }) : super(key: key);
  final Shop shop;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(color: Colors.lime),
          height: getProportionateScreenHeight(200),
          child: ShopIntro(shop: shop),
        ),
        ShopTabbar(shop: shop),
      ],
    );
  }
}
