import 'package:flutter/material.dart';
import 'package:online_shop_app/components/product_card.dart';
import 'package:online_shop_app/components/style.dart';
import 'package:online_shop_app/constants.dart';
import 'package:online_shop_app/models/SortProductsRequest.dart';
import 'package:online_shop_app/services/product_service.dart';
import '../../../size_config.dart';

class SortField extends StatefulWidget {
  const SortField({Key? key}) : super(key: key);
  @override
  _SortFieldState createState() => _SortFieldState();
}

class _SortFieldState extends State<SortField> {
  List categories = [
    {"label": 'Mới nhất', "arrayMappedname": 'lastest'},
    {"label": 'Phổ biến', "arrayMappedname": 'popular'},
    {"label": 'Giá thấp đến cao', "arrayMappedname": 'priceUp'},
    {"label": 'Giá cao đến thấp', "arrayMappedname": 'priceDown'},
  ];
  int selectedCategory = 0;
  List selectedCategoryList = [];

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
                onPressed: () async {
                  ProductService productService = ProductService();
                  var response = await productService.GetProductPaging(
                    SortProductsRequest(
                      pageIndex: 1,
                      pageSize: 10,
                      sortBy: categories[index]['arrayMappedname'].toString(),
                    ),
                  );
                  // for (int i = 0; i < response.length; i++) {
                  //   print("Product $i: ${response[i].name}");
                  // }
                  setState(() {
                    selectedCategory = index;
                    selectedCategoryList = response;
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
                  selectedCategoryList.length,
                  (index) {
                    return ProductCard(product: selectedCategoryList[index]);

                    // return SizedBox
                    //     .shrink(); // here by default width and height is 0
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
