import 'package:flutter/material.dart';
import 'package:online_shop_app/components/grid_product.dart';
import 'package:online_shop_app/components/product_card.dart';
import 'package:online_shop_app/models/SearchProductsRequest.dart';
import 'package:online_shop_app/screens/search_product/components/search_product_field.dart';
import 'package:online_shop_app/services/product_service.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List searchResult = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: getProportionateScreenHeight(30)),
        SearchProductField(),
        // SizedBox(height: getProportionateScreenHeight(10)),
        // SortProductField(),
        // SortField(
        //   lastestProducs: snapshot.data as List<ProductHomeView>,
        // ),
        // SearchResultField(),
        (searchResult.length != 0)
            ? GridProduct(inputHeight: 720, products: searchResult)
            : Container(
                height: getProportionateScreenHeight(720),
                child: Center(
                  child: Text(
                    "Không tìm thấy kết quả!",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
      ],
    );
  }

  Widget SearchProductField() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: SizeConfig.screenWidth * 0.7,
        decoration: BoxDecoration(
          color: kSecondaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          // onChanged: (value) => print(value),
          // onEditingComplete: () => ,
          onSubmitted: (value) {
            SearchProductsRequest searchProductsRequest = SearchProductsRequest(
                pageIndex: 1, pageSize: 10, key: "$value", sortBy: "latest");
            ProductService().SearchProduct(searchProductsRequest).then(
                  (result) => setState(
                    () {
                      searchResult = result;
                    },
                  ),
                );
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenWidth(9)),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: "Tìm kiếm",
            prefixIcon: Icon(Icons.search),
          ),
          // onTap: () {
          //   Navigator.pushNamed(context, SearchProductScreen.routName);
          // },
        ),
      ),
    );
  }

  // Widget SearchResultField() {
  //   return Center(
  //     child: Container(
  //       height: getProportionateScreenHeight(720),
  //       child: GridView.count(
  //         scrollDirection: Axis.vertical,
  //         shrinkWrap: true,
  //         crossAxisCount: 2,
  //         childAspectRatio: 2.0 / 3.0,
  //         children: [
  //           ...List.generate(
  //             searchResult.length,
  //             (index) {
  //               return ProductCard(product: searchResult[index]);

  //               // return SizedBox
  //               //     .shrink(); // here by default width and height is 0
  //             },
  //           ),
  //           // SizedBox(width: getProportionateScreenWidth(20)),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
