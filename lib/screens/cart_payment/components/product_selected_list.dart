import 'package:flutter/material.dart';
import 'package:online_shop_app/constants.dart';
import 'package:online_shop_app/models/CartProduct.dart';
import 'package:online_shop_app/screens/cart_payment/components/total_price_part.dart';
import 'package:online_shop_app/size_config.dart';

class ProductSelectedList extends StatefulWidget {
  ProductSelectedList({
    Key? key,
    required this.cartProducts,
  }) : super(key: key);

  List<CartProduct> cartProducts;

  @override
  _ProductSelectedListState createState() => _ProductSelectedListState();
}

class _ProductSelectedListState extends State<ProductSelectedList> {
  @override
  Widget build(BuildContext context) {
    int totalPrice = 0;
    for (int i = 0; i < widget.cartProducts.length; i++) {
      totalPrice +=
          widget.cartProducts[i].price * widget.cartProducts[i].quantity;
    }
    return Column(
      children: [
        SizedBox(
          height: getProportionateScreenHeight(500),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: ListView.builder(
              // scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: widget.cartProducts.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: ProductPaymentCard(
                  widget.cartProducts[index],
                ),
              ),
            ),
          ),
        ),
        TotalPricePart(
          count: widget.cartProducts.length,
          totalPrice: totalPrice,
        ),
      ],
    );
  }

  Widget ProductPaymentCard(cartProduct) {
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(10)),
              decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: (cartProduct.image != "/storage/" &&
                          cartProduct.image != "")
                      ? NetworkImage(
                          "${SERVER_IP}/apigateway/Products${cartProduct.image}")
                      : AssetImage("assets/images/notfoundimage.png")
                          as ImageProvider,
                  // image: AssetImage("assets/images/notfoundimage.png"),
                ),
              ),
              // child: Image.asset(cartProduct.image),
            ),
          ),
        ),
        SizedBox(width: 20),
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: getProportionateScreenWidth(230),
                child: Text(
                  cartProduct.productName,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.black, fontSize: 14),
                  maxLines: 2,
                ),
              ),
              Text(
                "Màu: ${cartProduct.color}",
                style: TextStyle(color: Colors.black, fontSize: 14),
                maxLines: 2,
              ),
              Text(
                "Size: ${cartProduct.size}",
                style: TextStyle(color: Colors.black, fontSize: 14),
                maxLines: 2,
              ),
              Text.rich(
                TextSpan(
                  text: "${cartProduct.price} đ x ${cartProduct.quantity}",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
