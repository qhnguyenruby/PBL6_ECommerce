import 'package:flutter/material.dart';
import 'package:online_shop_app/components/order_cart.dart';
import 'package:online_shop_app/components/section_title.dart';
import 'package:online_shop_app/models/ApiResponse.dart';
import 'package:online_shop_app/models/Orders.dart';
import 'package:online_shop_app/screens/order_detail/order_detail_screen.dart';
import 'package:online_shop_app/services/order_service.dart';
import '../../../size_config.dart';

class WaitConfirmOrderWidget extends StatelessWidget {
  Future<ApiResponse> getOrders(String state) async {
    OrderService orderService = OrderService();
    var response = await orderService.getOrders(state);
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getOrders("Chờ xác nhận"),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data as ApiResponse;
          List<Orders> orderItems =
              (data.statusCode == 200) ? ordersFromJson(data.body) : [];
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...List.generate(
                    orderItems.length,
                    (index) {
                      int totalPrice = 0;

                      for (var item in orderItems[index].orderDetails) {
                        totalPrice += item.price * item.quantity;
                      }
                      return Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(20)),
                            child: SectionTitle(
                                title: "${orderItems[index].shopName}",
                                press: () {
                                  Navigator.pushNamed(
                                    context,
                                    OrderDetailScreen.routeName,
                                    arguments: orderItems[index],
                                  );
                                }),
                          ),
                          OrderCard(
                            orders: orderItems[index].orderDetails,
                            totalPrice: totalPrice,
                            state: orderItems[index].state,
                          ),
                        ],
                      );

                      // return SizedBox
                      //     .shrink(); // here by default width and height is 0
                    },
                  ),
                  SizedBox(width: getProportionateScreenWidth(20)),
                ],
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
