import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:online_shop_app/constants.dart';
import 'package:online_shop_app/local_storage/shared_preferences.dart';
import 'package:online_shop_app/screens/category_product/category_product_screen.dart';
import 'package:online_shop_app/screens/home/home_screen.dart';
import 'package:online_shop_app/screens/profile/profile_screen.dart';
import 'package:online_shop_app/screens/sign_in/sign_in_screen.dart';
// import 'package:provider/provider.dart';

class ScreenController extends StatefulWidget {
  const ScreenController({Key? key}) : super(key: key);
  static String routeName = "/screen_controller";

  @override
  _ScreenControllerState createState() => _ScreenControllerState();
}

class _ScreenControllerState extends State<ScreenController> {
  int index = 0;
  String currentToken = "";

  final screens = [
    HomeScreen(),
    CategoryProductScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(Icons.home, size: 30),
      Icon(Icons.category, size: 30),
      Icon(Icons.person, size: 30),
    ];

    // final provider = Provider.of<GoogleSignInProvider>(context);
    getTokenStorage();
    if (index == 2 && currentToken == "") {
      // index_screen = 4;
      return Scaffold(
        body: SignInScreen(),
      );
    }
    return Scaffold(
      // backgroundColor: Colors.blue,
      body: screens[index],
      bottomNavigationBar: CurvedNavigationBar(
        color: kPrimaryColor,
        buttonBackgroundColor: Colors.blue.shade200,
        backgroundColor: Colors.transparent,
        height: 60,
        index: index,
        items: items,
        onTap: (index) => setState(() {
          this.index = index;
        }),
      ),
    );
  }

  void getTokenStorage() async {
    LocalStorage accountService = LocalStorage();
    currentToken = await accountService.getTokenStorage();
  }
}
