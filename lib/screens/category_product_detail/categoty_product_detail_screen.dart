import 'package:flutter/material.dart';
import 'package:online_shop_app/components/grid_product.dart';
import 'package:online_shop_app/constants.dart';
import 'package:online_shop_app/models/ProductHomeView.dart';
import 'package:online_shop_app/models/SortProductsRequest.dart';
import 'package:online_shop_app/services/product_service.dart';

// class CategoryProductDetailScreen extends StatefulWidget {
//   const CategoryProductDetailScreen({Key? key}) : super(key: key);
//   static String routeName = "/category_product_detail_screen";

//   @override
//   _CategoryProductDetailScreenState createState() =>
//       _CategoryProductDetailScreenState();
// }

// class _CategoryProductDetailScreenState
//     extends State<CategoryProductDetailScreen> {
//   // int count = 0;

// }

class CategoryProductDetailScreen extends StatelessWidget {
  const CategoryProductDetailScreen({Key? key}) : super(key: key);
  static String routeName = "/category_product_detail_screen";

  Future<List<ProductHomeView>> getProductCategory(
      int gender, int idCate) async {
    // List<ProductHomeView> list = [];
    ProductService productService = ProductService();
    var res = await productService.GetProductPaging(
      SortProductsRequest(
        pageIndex: 1,
        pageSize: 10,
        gender: gender,
        categoryId: idCate,
      ),
    );
    return res.toList();
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    String categoryName = args["categoryName"];
    // int gender = args["gender"];
    int tabCount =
        (categoryName == "Áo") ? 4 : (categoryName == "Đầm/váy" ? 2 : 3);
    int categoryIndex = (categoryName == "Áo"
        ? 0
        : (categoryName == "Quần")
            ? 1
            : (categoryName == "Phụ kiện")
                ? 3
                : 2);

    List<List<ProductHomeView>> listListProduct = args["listListProduct"];

    return DefaultTabController(
      initialIndex: 0,
      length: tabCount,
      child: Scaffold(
        appBar: buildAppBar(
            context, tabCount, categoryIndex, subCategories, categoryName),
        body: TabBarView(
          children: <Widget>[
            ...List.generate(
              tabCount,
              (index) {
                return GridProduct(
                  inputHeight: 550,
                  products: listListProduct[index],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context, int tabCount, int categoryIndex,
      List<Map<String, dynamic>> subCategories, String categoryName) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "$categoryName",
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
      // backgroundColor: kPrimaryColor,
      bottom: TabBar(
        // indicatorColor: Colors.lime,
        isScrollable: true,
        labelColor: kPrimaryColor,
        unselectedLabelColor: Colors.black,
        tabs: <Widget>[
          ...List.generate(
            tabCount,
            (index) {
              return Tab(
                text: subCategories[categoryIndex]["$categoryName"][index],
              );
            },
          ),
        ],
      ),
    );
  }
}
