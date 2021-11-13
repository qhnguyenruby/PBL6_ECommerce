import 'package:flutter/material.dart';
import 'package:online_shop_app/routes.dart';
import 'package:online_shop_app/screens/splash/splash_screen.dart';
import 'package:online_shop_app/theme.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PBL6 - ECommerce',
      theme: theme(),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
