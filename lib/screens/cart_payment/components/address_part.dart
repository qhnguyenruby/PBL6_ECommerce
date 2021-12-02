import 'package:flutter/material.dart';
import 'package:online_shop_app/components/custom_btn.dart';
import 'package:online_shop_app/models/UserUpdate.dart';
import 'package:online_shop_app/services/user_service.dart';

import '../../../size_config.dart';

class AddressPart extends StatefulWidget {
  const AddressPart({Key? key}) : super(key: key);

  @override
  _AddressPartState createState() => _AddressPartState();
}

class _AddressPartState extends State<AddressPart> {
  Future<UserUpdate> getCurrentUserUpdate() async {
    UserService userService = new UserService();
    UserUpdate userUpdate = await userService.GetUserByToken();
    return userUpdate;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getCurrentUserUpdate(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var currentUser = snapshot.data as UserUpdate;
          return Container(
            // height: 90,
            width: double.infinity,
            // padding: EdgeInsets.symmetric(
            //   horizontal: getProportionateScreenWidth(20),
            //   vertical: getProportionateScreenWidth(15),
            // ),
            // decoration: BoxDecoration(
            //   color: Color(0xfffea200),
            //   borderRadius: BorderRadius.circular(4),
            // ),
            child: Row(
              children: [
                Container(
                  // decoration: BoxDecoration(
                  //   color: Color(0xfffea200),
                  //   borderRadius: BorderRadius.circular(4),
                  // ),
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
                          "${currentUser.fullName} | ${currentUser.phoneNumber}",
                          style: TextStyle(
                              // color: Color(0xff9b96d6),
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${currentUser.address}",
                          style: TextStyle(
                              // color: Color(0xff9b96d6),
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                CustomButton(
                  color: Colors.lightBlue.shade100,
                  press: () {},
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

        // By default, show a loading spinner.
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
