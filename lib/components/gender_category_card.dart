import 'package:flutter/material.dart';

import '../size_config.dart';

class GenderCategoryCard extends StatelessWidget {
  const GenderCategoryCard({
    Key? key,
    required this.image,
    required this.press,
  }) : super(key: key);

  final String image;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(11)),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: double.infinity,
          height: getProportionateScreenHeight(200),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              // width: MediaQuery.of(context).size.width,
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(image),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
