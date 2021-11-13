import 'package:flutter/material.dart';
import 'package:online_shop_app/screens/category_product/components/body.dart';

class CategoryProductScreen extends StatelessWidget {
  const CategoryProductScreen({Key? key}) : super(key: key);
  static String routeName = "/category_product";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Category"),
        backgroundColor: Colors.blue.shade200,
        automaticallyImplyLeading: false,
      ),
      body: Body(),
    );
  }
}
