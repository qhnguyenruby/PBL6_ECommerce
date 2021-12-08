import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Danh mục sản phẩm',
          style: TextStyle(fontSize: 60, color: Colors.orange),
        ),
      ),
    );
  }
}
