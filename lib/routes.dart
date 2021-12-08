import 'package:flutter/widgets.dart';
import 'package:online_shop_app/screens/cart/cart_screen.dart';
import 'package:online_shop_app/screens/cart_payment/cart_payment_screen.dart';
import 'package:online_shop_app/screens/category_product/category_product_screen.dart';
import 'package:online_shop_app/screens/comfirm_forgot_password/comfirm_forgot_password_screen.dart';
import 'package:online_shop_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:online_shop_app/screens/home/home_screen.dart';
import 'package:online_shop_app/screens/login_success/login_success_screen.dart';
import 'package:online_shop_app/screens/order_detail/order_detail_screen.dart';
import 'package:online_shop_app/screens/orders/order_screen.dart';
import 'package:online_shop_app/screens/product_detail/product_detail_screen.dart';
import 'package:online_shop_app/screens/profile/profile_screen.dart';
import 'package:online_shop_app/screens/profile_detail/profile_detail.dart';
import 'package:online_shop_app/screens/screen_controller/screen_controller.dart';
import 'package:online_shop_app/screens/sign_in/sign_in_screen.dart';
import 'package:online_shop_app/screens/sign_up/sign_up_screen.dart';
import 'package:online_shop_app/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
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
};
