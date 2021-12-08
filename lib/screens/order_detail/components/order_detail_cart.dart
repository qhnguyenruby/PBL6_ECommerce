import 'package:flutter/material.dart';
import 'package:online_shop_app/constants.dart';
import 'package:online_shop_app/models/CartProduct.dart';
import 'package:online_shop_app/models/Orders.dart';
import 'package:online_shop_app/screens/cart_payment/components/total_price_part.dart';
import 'package:online_shop_app/size_config.dart';

class OrderDetailCart extends StatefulWidget {
  OrderDetailCart({
    Key? key,
    required this.orderDetails,
  }) : super(key: key);

  List<OrderDetail> orderDetails;

  @override
  _OrderDetailCartState createState() => _OrderDetailCartState();
}

class _OrderDetailCartState extends State<OrderDetailCart> {
  @override
  Widget build(BuildContext context) {
    int totalPrice = 0;
    for (int i = 0; i < widget.orderDetails.length; i++) {
      totalPrice +=
          widget.orderDetails[i].price * widget.orderDetails[i].quantity;
    }
    return Column(
      children: [
        SizedBox(
          height: getProportionateScreenHeight(610),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: ListView.builder(
              // scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: widget.orderDetails.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: OrderDetailCard(
                  widget.orderDetails[index],
                ),
              ),
            ),
          ),
        ),
        TotalPricePart(
          count: widget.orderDetails.length,
          totalPrice: totalPrice,
        ),
      ],
    );
  }

  Widget OrderDetailCard(cartProduct) {
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
                      ? NetworkImage("${SERVER_IP}${cartProduct.image}")
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
