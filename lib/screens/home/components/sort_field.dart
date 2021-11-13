import 'package:flutter/material.dart';
import 'package:online_shop_app/components/product_card.dart';
import 'package:online_shop_app/components/style.dart';
import 'package:online_shop_app/constants.dart';
import 'package:online_shop_app/models/Product.dart';
import 'package:online_shop_app/screens/home/components/list_category.dart';

import '../../../size_config.dart';

class SortField extends StatefulWidget {
  const SortField({Key? key}) : super(key: key);
  @override
  _SortFieldState createState() => _SortFieldState();
}

class _SortFieldState extends State<SortField> {
  int selectedCategory = 0;
  List selectedCategoryList = lastest;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: SizeConfig.blockSizeVertical * 7.5,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) => Container(
              padding: EdgeInsets.only(
                left: index == 0 ? 25 : 0,
                right: 20,
              ),
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedCategory = index;
                    selectedCategoryList =
                        categories[index]['arrayMappedname'] as List;
                  });
                },
                child: PrimaryText(
                  text: categories[index]['label'].toString(),
                  color: selectedCategory == index ? Colors.white : Colors.grey,
                  fontWeight: FontWeight.w500,
                  size: 18,
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 0,
                  primary: selectedCategory == index
                      ? kPrimaryColor
                      : Colors.grey[200],
                ),
              ),
            ),
          ),
        ),
        Center(
          child: Container(
            height: 570,
            child: GridView.count(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              crossAxisCount: 2,
              childAspectRatio: 2.0 / 3.0,
              children: [
                ...List.generate(
                  demoProducts.length,
                  (index) {
                    if (demoProducts[index].isPopular)
                      return ProductCard(product: demoProducts[index]);

                    return SizedBox
                        .shrink(); // here by default width and height is 0
                  },
                ),
                SizedBox(width: getProportionateScreenWidth(20)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
