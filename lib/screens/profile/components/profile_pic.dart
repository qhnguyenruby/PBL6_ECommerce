import 'package:flutter/material.dart';
import 'package:online_shop_app/size_config.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionateScreenWidth(300.0),
      height: getProportionateScreenHeight(90.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Logo 3@2x.png'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
