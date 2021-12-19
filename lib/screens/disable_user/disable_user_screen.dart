import 'package:flutter/material.dart';

class DisableUser extends StatelessWidget {
  const DisableUser({Key? key}) : super(key: key);
  static String routeName = "/disable_user";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // centerTitle: true,
          // title: Text("Thanh toán"),
          // backgroundColor: kPrimaryColor,
          ),
      body: Center(
        child: Text(
          "Tài khoản của bạn đã bị vô hiệu hóa!",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
