import 'package:flutter/material.dart';
import 'package:online_shop_app/screens/sign_in/components/body.dart';
// import 'package:online_shop_app/screens/sign_in/sign_in_controller.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Sign In"),
      // ),
      // body: SignInController(),
      body: Body(),
    );
  }
}
