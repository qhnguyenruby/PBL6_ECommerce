import 'package:flutter/material.dart';
import 'package:online_shop_app/constants.dart';
import 'components/body.dart';

class CategoryDetailScreen extends StatelessWidget {
  const CategoryDetailScreen({
    Key? key,
  }) : super(key: key);
  static String routeName = "/category_detail_screen";

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("$args"),
        backgroundColor: kPrimaryColor,
      ),
      body: Body(
        categoryName: args as String,
      ),
    );
  }
}
