import 'package:flutter/material.dart';
import 'package:online_shop_app/screens/home/components/sort_field.dart';
import 'package:online_shop_app/screens/home/components/special_offers.dart';
import '../../../size_config.dart';
import 'home_header.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: getProportionateScreenHeight(30)),
        HomeHeader(),
        // SizedBox(height: getProportionateScreenHeight(10)),
        // SortProductField(),

        SafeArea(
          child: Column(
            children: [
              SortField(),
              // DiscountBanner(),
              // Categories(),
              // SpecialOffers(),
              // SizedBox(height: getProportionateScreenWidth(30)),
              // LastestProducts(),
              // PopularProducts(),
            ],
          ),
        ),
      ],
    );
  }
}
