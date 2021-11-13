import 'package:flutter/material.dart';
import 'package:online_shop_app/constants.dart';
import 'package:online_shop_app/screens/profile_detail/components/body.dart';

class ProfileDetailScreen extends StatelessWidget {
  const ProfileDetailScreen({Key? key}) : super(key: key);
  static String routeName = "/profile_detail";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Thông tin cá nhân"),
        backgroundColor: kPrimaryColor,
        automaticallyImplyLeading: false,
        // actions: [
        //   IconBtnWithCounter(
        //     svgSrc: "assets/icons/login.svg",
        //     press: () {},
        //     // press: () => Navigator.pushNamed(context, CartScreen.routeName),
        //   ),
        // ],
      ),
      body: Body(),
    );
  }
}
