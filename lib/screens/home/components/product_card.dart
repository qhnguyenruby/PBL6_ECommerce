import 'package:flutter/material.dart';
import 'package:online_shop_app/components/style.dart';
import 'package:online_shop_app/constants.dart';

import '../../../size_config.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.image,
    required this.label,
    required this.price,
  }) : super(key: key);
  final String image;
  final String label;
  final String price;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => ProductDetail(image)));
      },
      child: Hero(
        tag: image,
        child: Container(
          padding: EdgeInsets.all(10),
          width: (SizeConfig.screenWidth - 80) / 2,
          height: SizeConfig.blockSizeVertical * 30,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PrimaryText(text: label, color: Colors.red, size: 16),
                        SizedBox(height: 5),
                        PrimaryText(
                            text: price, size: 18, fontWeight: FontWeight.w700),
                        SizedBox(height: 5),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 10,
                    bottom: 0,
                    child: RawMaterialButton(
                        onPressed: () {},
                        elevation: 0,
                        constraints: BoxConstraints(
                          minWidth: 0,
                        ),
                        shape: CircleBorder(),
                        fillColor: kPrimaryColor,
                        padding: EdgeInsets.all(5),
                        child: Icon(Icons.add, size: 16, color: Colors.white)),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
