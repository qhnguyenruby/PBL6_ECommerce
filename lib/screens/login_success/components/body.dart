import 'package:flutter/material.dart';
import 'package:online_shop_app/components/default_button.dart';
import 'package:online_shop_app/screens/screen_controller/screen_controller.dart';
import 'package:online_shop_app/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // String f(String x) => x;
    // String g(String? y) => f(y!);
    // String f(String x) => x;
    // String g(String? y) => f(y is String ? y : '');
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Image.asset(
          "assets/images/success.png",
          height: SizeConfig.screenHeight * 0.4, //40%
        ),
        // SizedBox(height: 8),
        // CircleAvatar(
        //   maxRadius: 25,
        //   backgroundImage: NetworkImage(
        //     g(user.photoURL),
        //   ),
        // ),
        // SizedBox(height: 8),
        // Text(
        //   'Name: ' + g(user.displayName),
        //   style: TextStyle(color: Colors.black),
        // ),
        // SizedBox(height: 8),
        // Text(
        //   'Email: ' + g(user.email),
        //   style: TextStyle(color: Colors.black),
        // ),
        SizedBox(height: SizeConfig.screenHeight * 0.08),
        Text(
          "Login Success",
          // ${LocalStorage('ecomSolution').getItem('userToken')
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(
            text: "Continue",
            press: () {
              Navigator.pushNamed(
                context,
                ScreenController.routeName,
              );
            },
          ),
        ),
        Spacer(),
      ],
    );
  }
}
