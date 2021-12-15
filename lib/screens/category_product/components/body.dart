import 'package:flutter/material.dart';
import 'package:online_shop_app/components/gender_category_card.dart';
import 'package:online_shop_app/components/section_title.dart';
import 'package:online_shop_app/screens/category_detail/category_detail_screen.dart';

import '../../../size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            padding: EdgeInsets.all(12.0),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20)),
                  child: SectionTitle(
                    title: "Thời trang nam",
                    press: () {
                      Navigator.pushNamed(
                        context,
                        CategoryDetailScreen.routeName,
                        arguments: "Thời trang nam",
                      );
                    },
                  ),
                ),
                SizedBox(height: getProportionateScreenWidth(12)),
                GenderCategoryCard(
                  image:
                      "https://taru.vn/image/cat_images/hmv-thoitrangnam.jpg",
                  press: () {},
                ),
                SizedBox(height: getProportionateScreenWidth(20)),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20)),
                  child: SectionTitle(
                    title: "Thời trang nữ",
                    press: () {
                      Navigator.pushNamed(
                        context,
                        CategoryDetailScreen.routeName,
                        arguments: "Thời trang nữ",
                      );
                    },
                  ),
                ),
                SizedBox(height: getProportionateScreenWidth(12)),
                GenderCategoryCard(
                  image: "https://taru.vn/image/cat_images/hmv-thoitrangnu.jpg",
                  press: () {},
                ),
              ],
            )),
      ),
    );
  }
}
