import 'package:flutter/material.dart';
import 'package:online_shop_app/components/grid_product.dart';
import 'package:online_shop_app/models/ApiResponse.dart';
import 'package:online_shop_app/models/ProductHomeView.dart';
import 'package:online_shop_app/models/SortProductsRequest.dart';
import 'package:online_shop_app/services/product_service.dart';

import '../../../size_config.dart';
import 'categories.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
    required this.categoryName,
  }) : super(key: key);
  final String categoryName;

  @override
  _BodyState createState() => _BodyState();
}

Future<List<ProductHomeView>> GetProductByGender(
    SortProductsRequest genderFilterRequest) async {
  ProductService productService = ProductService();
  var response = await productService.GetProductPaging(genderFilterRequest);
  return response;
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(0),
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenWidth(10)),
            Categories(
              categoryName: widget.categoryName,
            ),
            SizedBox(height: getProportionateScreenWidth(10)),
            FutureBuilder(
              future: GetProductByGender(SortProductsRequest(
                  pageIndex: 1,
                  pageSize: 10,
                  sortBy: "",
                  gender: (widget.categoryName == "Thời trang nam".trim())
                      ? 1
                      : 2)),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var data = snapshot.data as List<ProductHomeView>;
                  // List<CartProduct> cartItems = (data.statusCode == 200)
                  //     ? cartsFromJson(data.body).cartItems
                  //     : [];
                  return GridProduct(inputHeight: 618, products: data);
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const Center(child: CircularProgressIndicator());
              },
            )
          ],
        ),
      ),
    );
  }
}
