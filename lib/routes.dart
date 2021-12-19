import 'package:flutter/widgets.dart';
import 'package:online_shop_app/screens/ChangePassword/change_password_screen.dart';
import 'package:online_shop_app/screens/cart/cart_screen.dart';
import 'package:online_shop_app/screens/cart_payment/cart_payment_screen.dart';
import 'package:online_shop_app/screens/category_detail/category_detail_screen.dart';
import 'package:online_shop_app/screens/category_product/category_product_screen.dart';
import 'package:online_shop_app/screens/category_product_detail/categoty_product_detail_screen.dart';
import 'package:online_shop_app/screens/change_address_order/change_address_order_screen.dart';
import 'package:online_shop_app/screens/comfirm_forgot_password/comfirm_forgot_password_screen.dart';
import 'package:online_shop_app/screens/disable_user/disable_user_screen.dart';
import 'package:online_shop_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:online_shop_app/screens/home/home_screen.dart';
import 'package:online_shop_app/screens/order_detail/order_detail_screen.dart';
import 'package:online_shop_app/screens/orders/order_screen.dart';
import 'package:online_shop_app/screens/product_detail/product_detail_screen.dart';
import 'package:online_shop_app/screens/profile/profile_screen.dart';
import 'package:online_shop_app/screens/profile_detail/profile_detail.dart';
import 'package:online_shop_app/screens/screen_controller/screen_controller.dart';
import 'package:online_shop_app/screens/search_product/search_product_screen.dart';
import 'package:online_shop_app/screens/shop/shop_screen.dart';
import 'package:online_shop_app/screens/sign_in/sign_in_screen.dart';
import 'package:online_shop_app/screens/sign_up/sign_up_screen.dart';
import 'package:online_shop_app/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  ProfileDetailScreen.routeName: (context) => ProfileDetailScreen(),
  ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
  CategoryProductScreen.routeName: (context) => CategoryProductScreen(),
  ScreenController.routeName: (context) => ScreenController(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  ConfirmForgotPasswordScreen.routeName: (context) =>
      ConfirmForgotPasswordScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  CartPayment.routeName: (context) => CartPayment(),
  OrderScreen.routeName: (context) => OrderScreen(),
  OrderDetailScreen.routeName: (context) => OrderDetailScreen(),
  SearchProductScreen.routName: (context) => SearchProductScreen(),
  ChangePasswordScreen.routeName: (context) => ChangePasswordScreen(),
  CategoryDetailScreen.routeName: (context) => CategoryDetailScreen(),
  CategoryProductDetailScreen.routeName: (context) =>
      CategoryProductDetailScreen(),
  ShopScreen.routeName: (context) => ShopScreen(),
  ChangeAddressOrderScreen.routeName: (context) => ChangeAddressOrderScreen(),
  DisableUser.routeName: (context) => DisableUser(),
};
