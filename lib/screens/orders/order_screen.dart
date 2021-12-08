import 'package:flutter/material.dart';
import 'package:online_shop_app/constants.dart';
import 'package:online_shop_app/screens/orders/components/all_order_widget.dart';
import 'package:online_shop_app/screens/orders/components/canceled_order_widget.dart';
import 'package:online_shop_app/screens/orders/components/confirmed_order_widget.dart';
import 'components/wait_confirm_order_widget.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);
  static String routeName = "/order_screen";

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        appBar: buildAppBar(context),
        body: TabBarView(
          children: <Widget>[
            AllOrderWidget(),
            WaitConfirmOrderWidget(),
            CanceledOrderWidget(),
            ConfirmedOrderWidget(),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "Đơn mua",
            style: TextStyle(color: Colors.black),
          ),
          // Text(
          //   "$count đơn hàng",
          //   style: Theme.of(context).textTheme.caption,
          // ),
        ],
      ),
      bottom: TabBar(
        // indicatorColor: Colors.lime,
        // onTap: (value) {
        //   setState(() {
        //     count = value;
        //   });
        // },
        isScrollable: true,
        labelColor: kPrimaryColor,
        unselectedLabelColor: Colors.black,
        tabs: <Widget>[
          Tab(text: "Tất cả"),
          Tab(text: "Chờ xác nhận"),
          Tab(text: "Đã hủy"),
          Tab(text: "Đã xác nhận"),
        ],
      ),
    );
  }
}
// class OrderScreen extends StatelessWidget {
//   static String routeName = "/order_screen";

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       initialIndex: 0,
//       length: 4,
//       child: Scaffold(
//         appBar: buildAppBar(context),
//         body: TabBarView(
//           children: <Widget>[
//             AllOrderWidget(),
//             WaitConfirmOrderWidget(),
//             CanceledOrderWidget(),
//             ConfirmedOrderWidget(),
//           ],
//         ),
//       ),
//     );
//   }

//   AppBar buildAppBar(BuildContext context) {
//     int val;
//     return AppBar(
//       title: Column(
//         children: [
//           Text(
//             "Đơn mua",
//             style: TextStyle(color: Colors.black),
//           ),
//           Text(
//             "10 đơn hàng",
//             style: Theme.of(context).textTheme.caption,
//           ),
//         ],
//       ),
//       bottom: const TabBar(
//         // indicatorColor: Colors.lime,
//         onTap: (value) => {val = value;},
//         isScrollable: true,
//         labelColor: kPrimaryColor,
//         unselectedLabelColor: Colors.black,
//         tabs: <Widget>[
//           Tab(text: "Tất cả"),
//           Tab(text: "Chờ xác nhận"),
//           Tab(text: "Đã hủy"),
//           Tab(text: "Đã xác nhận"),
//         ],
//       ),
//     );
//   }
// }
