import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import '../size_config.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    Key? key,
    this.text,
    this.color,
    required this.items,
  }) : super(key: key);
  final String? text;
  final Color? color;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(90),
      height: getProportionateScreenHeight(43),
      child: DropDown(
        items: items,
        hint: Text(
          text!,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(11),
            color: Colors.black,
          ),
        ),
        icon: Icon(
          Icons.expand_more,
          color: color,
        ),
        onChanged: (String? value) {
          print(value);
        },
      ),
    );
  }
}
