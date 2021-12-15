import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_shop_app/models/ProductHomeView.dart';
import 'package:online_shop_app/models/SortProductsRequest.dart';
import 'package:online_shop_app/screens/category_product_detail/categoty_product_detail_screen.dart';
import 'package:online_shop_app/services/product_service.dart';

import '../../../size_config.dart';

class Categories extends StatelessWidget {
  const Categories({
    Key? key,
    required this.categoryName,
  }) : super(key: key);
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categoriesMan = [
      {
        "icon": "assets/icons/polo-shirt.svg",
        "text": "Áo",
        "gender": 1,
        "categoryIdList": [1, 2, 3, 12]
      },
      {
        "icon": "assets/icons/trousers.svg",
        "text": "Quần",
        "gender": 1,
        "categoryIdList": [4, 8, 9]
      },
      {
        "icon": "assets/icons/watches.svg",
        "text": "Phụ kiện",
        "gender": 1,
        "categoryIdList": [5, 10, 11]
      },
    ];
    List<Map<String, dynamic>> categoriesWoman = [
      {
        "icon": "assets/icons/polo-shirt.svg",
        "text": "Áo",
        "gender": 2,
        "categoryIdList": [1, 2, 3, 12]
      },
      {
        "icon": "assets/icons/trousers.svg",
        "text": "Quần",
        "gender": 2,
        "categoryIdList": [4, 8, 9]
      },
      {
        "icon": "assets/icons/dress.svg",
        "text": "Đầm/váy",
        "gender": 2,
        "categoryIdList": [6, 7]
      },
      {
        "icon": "assets/icons/earrings.svg",
        "text": "Phụ kiện",
        "gender": 2,
        "categoryIdList": [5, 10, 11]
      },
    ];
    List<Map<String, dynamic>> categories =
        (categoryName == "Thời trang nam") ? categoriesMan : categoriesWoman;
    List<List<ProductHomeView>> listListProduct = [];
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          categories.length,
          (index) => CategoryCard(
            icon: categories[index]["icon"],
            text: categories[index]["text"],
            press: () async {
              print(categories[index]["text"]);
              listListProduct.clear();
              for (var i in categories[index]["categoryIdList"]) {
                var data =
                    await ProductService().GetProductPaging(SortProductsRequest(
                  pageIndex: 1,
                  pageSize: 10,
                  gender: (categoryName == "Thời trang nam") ? 1 : 2,
                  categoryId: i,
                ));
                listListProduct.add(data);
              }
              Map<String, dynamic> data = {
                "categoryName": categories[index]["text"],
                "gender": (categoryName == "Thời trang nam") ? 1 : 2,
                "listListProduct": listListProduct,
              };
              Navigator.pushNamed(
                context,
                CategoryProductDetailScreen.routeName,
                arguments: data,
              );
            },
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String? icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(85),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              height: getProportionateScreenWidth(55),
              width: getProportionateScreenWidth(55),
              decoration: BoxDecoration(
                color: Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(icon!),
            ),
            SizedBox(height: 5),
            Text(text!, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
