import 'package:flutter/material.dart';
import 'package:online_shop_app/components/custom_dialog.dart';
import 'package:online_shop_app/local_storage/shared_preferences.dart';
import 'package:online_shop_app/screens/ChangePassword/change_password_screen.dart';
import 'package:online_shop_app/screens/cart/cart_screen.dart';
import 'package:online_shop_app/screens/disable_user/disable_user_screen.dart';
import 'package:online_shop_app/screens/orders/order_screen.dart';
import 'package:online_shop_app/screens/profile_detail/profile_detail.dart';
import 'package:online_shop_app/services/user_service.dart';
import '../../../size_config.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          SizedBox(height: getProportionateScreenHeight(40)),
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "Thông tin cá nhân",
            icon: "assets/icons/User Icon.svg",
            press: () => {
              Navigator.pushNamed(context, ProfileDetailScreen.routeName),
            },
          ),
          ProfileMenu(
            text: "Giỏ hàng",
            icon: "assets/icons/Cart Icon.svg",
            press: () async {
              UserService userService = UserService();
              var currentUser = await userService.GetCurrentUser();
              if (currentUser.disable == false) {
                Navigator.pushNamed(context, CartScreen.routeName);
              } else {
                Navigator.pushNamed(context, DisableUser.routeName);
              }
            },
          ),
          ProfileMenu(
            text: "Đơn mua",
            icon: "assets/icons/history.svg",
            press: () async {
              UserService userService = UserService();
              var currentUser = await userService.GetCurrentUser();
              if (currentUser.disable == false) {
                Navigator.pushNamed(context, OrderScreen.routeName);
              } else {
                Navigator.pushNamed(context, DisableUser.routeName);
              }
            },
          ),
          ProfileMenu(
            text: "Đổi mật khẩu",
            icon: "assets/icons/exchange.svg",
            press: () async {
              UserService userService = UserService();
              var currentUser = await userService.GetCurrentUser();
              if (currentUser.disable == false) {
                Navigator.pushNamed(context, ChangePasswordScreen.routeName);
              } else {
                Navigator.pushNamed(context, DisableUser.routeName);
              }
            },
          ),
          ProfileMenu(
            text: "Đăng xuất",
            icon: "assets/icons/Log out.svg",
            press: () async {
              // LocalStorage().removeToken();
              // Navigator.pop(context);
              final action = await Dialogs.yesAbortDialog(
                context,
                'Thông báo',
                'Bạn có chắc muốn đăng xuất tài khoản này!',
              );
              if (action == DialogAction.yes) {
                LocalStorage().removeToken();
                Navigator.pop(context);
              }
            },
          ),
        ],
      ),
    );
  }
}
