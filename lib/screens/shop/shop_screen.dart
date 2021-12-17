import 'package:flutter/material.dart';
import 'package:online_shop_app/models/Shop.dart';

import 'components/body.dart';

class ShopScreen extends StatelessWidget {
  static String routeName = "/shop_screen";

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Shop;
    return Scaffold(
      body: Body(shop: args),
    );
  }
}
