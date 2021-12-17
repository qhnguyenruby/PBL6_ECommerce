import 'package:flutter/material.dart';
import 'package:online_shop_app/screens/change_address_order/components/update_address_order_form.dart';

import '../../constants.dart';

class ChangeAddressOrderScreen extends StatelessWidget {
  const ChangeAddressOrderScreen({Key? key}) : super(key: key);
  static String routeName = "/change_address_order_screen";

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      body: UpdateAddressOrderForm(functionUpdateAddress: args),
      appBar: AppBar(
        title: Text(
          "Thay đổi địa chỉ nhận hàng",
        ),
        backgroundColor: kPrimaryColor,
      ),
    );
  }
}
