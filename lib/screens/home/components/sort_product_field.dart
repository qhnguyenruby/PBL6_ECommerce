import 'package:flutter/material.dart';
import 'package:online_shop_app/components/custom_btn.dart';
import 'package:online_shop_app/components/custom_drop_down.dart';
import 'package:online_shop_app/constants.dart';
import '../../../size_config.dart';

class SortProductField extends StatelessWidget {
  const SortProductField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Text(
          //   "Sắp xếp theo:",
          //   style: TextStyle(
          //     fontSize: 20,
          //   ),
          // ),
          CustomButton(
            text: "Mới nhất",
            color: kPrimaryColor,
            press: () {},
          ),
          CustomButton(
            text: "Phổ biến",
            color: kPrimaryColor,
            press: () {},
          ),
          CustomDropDown(
            items: ["Giá tăng", "Giá giảm"],
            text: "Giá",
            color: kPrimaryColor,
          ),

          // DropDown(),
          // CustomButton(
          //   text: "Giá cao đến thấp",
          //   color: kPrimaryColor,
          //   press: () {},
          // ),

          // SizedBox(
          //   width: getProportionateScreenWidth(85),
          //   height: getProportionateScreenHeight(43),
          //   child: DropDown(
          //     items: ["Giá cao đến thấp", "Giá thấp đến cao"],
          //     hint: Text("Giá"),
          //     icon: Icon(
          //       Icons.expand_more,
          //       color: Colors.blue,
          //     ),
          //     onChanged: (String? value) {
          //       print(value);
          //     },
          //   ),
          // ),

          // DefaultButton(
          //   text: "Mới nhất",
          //   press: () {},
          // ),
        ],
      ),
    );
  }
}
