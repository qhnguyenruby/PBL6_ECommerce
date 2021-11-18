import 'package:flutter/material.dart';
import 'package:online_shop_app/components/default_button.dart';
import 'package:online_shop_app/screens/sign_in/sign_in_screen.dart';

import '../../../size_config.dart';

class ConfirmForgotPassForm extends StatefulWidget {
  @override
  _ConfirmForgotPassFormState createState() => _ConfirmForgotPassFormState();
}

class _ConfirmForgotPassFormState extends State<ConfirmForgotPassForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Text(
              "Chúng tôi đã gửi thông tin đặt lại mật khẩu đến email của bạn. Vui lòng kiểm tra email và làm theo hướng dẫn!"),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          DefaultButton(
            text: "OK",
            press: () {
              Navigator.popUntil(
                  context, ModalRoute.withName(SignInScreen.routeName));
            },
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
        ],
      ),
    );
  }
}
