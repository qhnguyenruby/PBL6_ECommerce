import 'package:flutter/material.dart';
import 'package:online_shop_app/components/coustom_bottom_nav_bar.dart';
import 'package:online_shop_app/constants.dart';
import 'package:online_shop_app/screens/category_product/components/body.dart';

import '../../enums.dart';

class CategoryProductScreen extends StatelessWidget {
  const CategoryProductScreen({Key? key}) : super(key: key);
  static String routeName = "/category_product";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Danh mục"),
        backgroundColor: kPrimaryColor,
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.category),
    );
  }
}
