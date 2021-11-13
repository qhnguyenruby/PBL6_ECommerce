import 'package:flutter/widgets.dart';
import 'package:online_shop_app/screens/category_product/category_product_screen.dart';
import 'package:online_shop_app/screens/home/home_screen.dart';
import 'package:online_shop_app/screens/login_success/login_success_screen.dart';
import 'package:online_shop_app/screens/profile/profile_screen.dart';
import 'package:online_shop_app/screens/screen_controller/screen_controller.dart';
import 'package:online_shop_app/screens/sign_in/sign_in_screen.dart';
import 'package:online_shop_app/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  // SignUpScreen.routeName: (context) => SignUpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  // ProfileDetailScreen.routeName: (context) => ProfileDetailScreen(),
  CategoryProductScreen.routeName: (context) => CategoryProductScreen(),
  ScreenController.routeName: (context) => ScreenController(),
  SignInScreen.routeName: (context) => SignInScreen(),
};
