import 'package:flutter/material.dart';
import '../size_config.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.text,
    this.press,
    this.color,
  }) : super(key: key);
  final String? text;
  final Function? press;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(90),
      height: getProportionateScreenHeight(40),
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          primary: Colors.white,
          backgroundColor: color!,
        ),
        onPressed: press as void Function()?,
        child: Text(
          text!,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(11),
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
