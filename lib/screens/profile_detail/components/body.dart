import 'package:flutter/material.dart';
import 'package:online_shop_app/models/UserUpdate.dart';
import 'package:online_shop_app/screens/profile_detail/components/update_form.dart';
import 'package:online_shop_app/services/user_service.dart';

import '../../../size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          SizedBox(height: getProportionateScreenHeight(10)),
          // ProfilePic(),
          SizedBox(height: 20),
          FutureBuilder(
            future: getCurrentUserUpdate(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return UpdateForm(
                    currentUserUpdate: snapshot.data as UserUpdate);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const Center(child: CircularProgressIndicator());
            },
          ),
          // UpdateForm(),
        ],
      ),
    );
  }

  Future<UserUpdate> getCurrentUserUpdate() async {
    UserService userService = new UserService();
    UserUpdate userUpdate = await userService.GetUserByToken();
    return userUpdate;
  }
}
