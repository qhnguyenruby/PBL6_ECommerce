import 'package:flutter/material.dart';
import 'package:online_shop_app/constants.dart';

import 'components/body.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);
  static String routeName = "/change_password_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Đổi mật khẩu"),
        backgroundColor: kPrimaryColor,
        automaticallyImplyLeading: false,
      ),
      body: Body(),
    );
  }
}
