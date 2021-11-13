import 'package:flutter/material.dart';
import 'package:online_shop_app/components/coustom_bottom_nav_bar.dart';
import 'package:online_shop_app/screens/home/components/body.dart';
import '../../enums.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Home"),
      //   backgroundColor: Colors.blue.shade200,
      // ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
