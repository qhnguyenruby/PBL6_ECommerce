import 'package:flutter/material.dart';
import 'package:online_shop_app/screens/product_detail/components/product_detail_field.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProductDetailField(
            image:
                'http://192.168.1.91:8082/storage/7bf398f2-af1e-4ad8-8937-bab6d11a3606.jpg',
            name: 'Áo mưa',
            price: 120000,
          ),
        ],
      ),
    );
  }
}
