import 'package:flutter/material.dart';
import 'package:online_shop_app/components/custom_btn.dart';
import 'package:online_shop_app/models/AddressOrderUpdate.dart';
import 'package:online_shop_app/models/UserUpdate.dart';
import 'package:online_shop_app/screens/change_address_order/change_address_order_screen.dart';
import 'package:online_shop_app/services/user_service.dart';

import '../../../size_config.dart';

class AddressPart extends StatefulWidget {
  const AddressPart({
    Key? key,
    required this.functionUpdateCurrentUser,
  }) : super(key: key);
  final functionUpdateCurrentUser;
  @override
  _AddressPartState createState() => _AddressPartState();
}

class _AddressPartState extends State<AddressPart> {
  Future<UserUpdate> getCurrentUserUpdate() async {
    UserService userService = new UserService();
    UserUpdate userUpdate = await userService.GetUserByToken();
    return userUpdate;
  }

  AddressOrderUpdate currentUserAddress = AddressOrderUpdate(
    fullName: "",
    phoneNumber: "",
    address: "",
  );
  // void updateCurrentUser(AddressOrderUpdate newAddress) {
  //   setState(() {
  //     currentUserAddress = newAddress;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // currentUserAddress = AddressOrderUpdate(
    //   fullName: "",
    //   phoneNumber: "",
    //   address: "",
    // );
    return FutureBuilder(
      future: getCurrentUserUpdate(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (currentUserAddress.fullName == "") {
            UserUpdate currentUser = snapshot.data as UserUpdate;
            currentUserAddress = AddressOrderUpdate(
              fullName: currentUser.fullName,
              phoneNumber: currentUser.phoneNumber,
              address: currentUser.address,
            );
          }

          return Container(
            width: double.infinity,
            child: Row(
              children: [
                Container(
                  width: getProportionateScreenWidth(280),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(15),
                      vertical: getProportionateScreenWidth(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Địa chỉ nhận hàng:",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "${currentUserAddress.fullName} | ${currentUserAddress.phoneNumber}",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${currentUserAddress.address}",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                CustomButton(
                  color: Colors.lightBlue.shade100,
                  press: () async {
                    var newUpdate = await Navigator.pushNamed(
                        context, ChangeAddressOrderScreen.routeName,
                        arguments: [
                          widget.functionUpdateCurrentUser,
                          currentUserAddress
                        ]);
                    setState(() {
                      currentUserAddress = newUpdate as AddressOrderUpdate;
                    });
                    print("fullName: ${currentUserAddress.fullName}");
                  },
                  text: "Thay đổi",
                  height: 40,
                  width: 80,
                )
              ],
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
