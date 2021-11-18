import 'package:flutter/material.dart';

import 'components/body.dart';

class ConfirmForgotPasswordScreen extends StatelessWidget {
  static String routeName = "/confirm_forgot_password";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text("Forgot Password"),
          ),
      body: Body(),
    );
  }
}
