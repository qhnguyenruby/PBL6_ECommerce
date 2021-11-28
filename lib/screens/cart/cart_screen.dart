import 'package:flutter/material.dart';
import 'package:online_shop_app/models/ApiResponse.dart';
import 'package:online_shop_app/models/CartProduct.dart';
import 'package:online_shop_app/models/Carts.dart';
import 'package:online_shop_app/services/cart_service.dart';
import 'components/body.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";

  Future<ApiResponse> getCart() async {
    CartService cartService = CartService();
    var response = await cartService.GetCart();
    return response;
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: buildAppBar(context),
    //   body: Body(),
    //   // bottomNavigationBar: CheckoutCard(),
    // );
    return FutureBuilder(
      future: getCart(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data as ApiResponse;
          List<CartProduct> cartItems = (data.statusCode == 200)
              ? cartsFromJson(data.body).cartItems
              : [];
          return Scaffold(
              appBar: buildAppBar(
                context,
                cartItems,
              ),
              body: (data.statusCode == 200)
                  ? Body(cartItems: cartItems)
                  : Center(
                      child: Text(
                        "${data.body}",
                        textAlign: TextAlign.center,
                      ),
                    )
              // bottomNavigationBar: CheckoutCard(),
              );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  AppBar buildAppBar(BuildContext context, List<CartProduct> cartItems) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "Giỏ hàng",
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "${cartItems.length} sản phẩm",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
