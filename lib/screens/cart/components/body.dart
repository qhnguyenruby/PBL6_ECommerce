import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_shop_app/constants.dart';
import 'package:online_shop_app/models/CartProduct.dart';
import 'package:online_shop_app/screens/cart/components/check_out_card.dart';

import '../../../size_config.dart';
// import 'cart_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List picked = [false, false, false, false, false, false, false];
  int count = 1;
  int totalAmount = 0;

  pickToggle(index) {
    setState(() {
      picked[index] = !picked[index];
      getTotalAmount();
    });
  }

  getTotalAmount() {
    totalAmount = 0;
    for (int i = 0; i < picked.length; i++) {
      if (picked[i]) {
        totalAmount += demoCarts[i].price * demoCarts[i].quantity;
      }
      // if (i == picked.length - 1) {
      //   setState(() {
      //     totalAmount = 100 * count;
      //   });
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: getProportionateScreenHeight(640),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: ListView.builder(
              // scrollDirection: Axis.vertical,
              // shrinkWrap: true,
              itemCount: demoCarts.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Dismissible(
                  key: Key(demoCarts[index].id.toString()),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    setState(() {
                      demoCarts.removeAt(index);
                    });
                  },
                  background: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFE6E6),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Spacer(),
                        SvgPicture.asset("assets/icons/Trash.svg"),
                      ],
                    ),
                  ),
                  child: CartCard(
                    demoCarts[index],
                    (!demoCarts[index].isShopAvailable ||
                            !demoCarts[index].isProductDetailAvailable ||
                            !demoCarts[index].isRemainInStock)
                        ? false
                        : true,
                    index,
                    (!demoCarts[index].isShopAvailable)
                        ? "Shop đã ngừng hoạt động"
                        : (!demoCarts[index].isProductDetailAvailable)
                            ? "Sản phẩm không tồn tại"
                            : (!demoCarts[index].isRemainInStock)
                                ? "Sản phẩm đã hết hàng"
                                : "",
                  ),
                ),
              ),
            ),
          ),
        ),
        CheckoutCard(totalAmount: totalAmount),
      ],
    );
  }

  Widget CartCard(cartProduct, available, index, reasonUnAvailable) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            if (available) {
              pickToggle(index);
              print(totalAmount);
            }
          },
          child: Container(
            height: 25.0,
            width: 25.0,
            decoration: BoxDecoration(
              color: available
                  ? Colors.grey.withOpacity(0.4)
                  : Colors.red.withOpacity(0.4),
              borderRadius: BorderRadius.circular(12.5),
            ),
            child: Center(
              child: available
                  ? Container(
                      height: 12.0,
                      width: 12.0,
                      decoration: BoxDecoration(
                          color: picked[index]
                              ? Colors.green
                              : Colors.grey.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(6.0)),
                    )
                  : Container(),
            ),
          ),
        ),
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(10)),
              decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(cartProduct.image),
            ),
          ),
        ),
        SizedBox(width: 20),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cartProduct.productName,
                style: TextStyle(color: Colors.black, fontSize: 16),
                maxLines: 2,
              ),
              Text(
                "Màu: ${cartProduct.color}",
                style: TextStyle(color: Colors.black, fontSize: 16),
                maxLines: 2,
              ),
              Text(
                "Size: ${cartProduct.size}",
                style: TextStyle(color: Colors.black, fontSize: 16),
                maxLines: 2,
              ),
              Text.rich(
                TextSpan(
                  text: "${cartProduct.price} đ",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: kPrimaryColor,
                  ),
                ),
              ),
              (available)
                  ? _buildQuantityPart(cartProduct)
                  : Text(
                      "${reasonUnAvailable}",
                      style: TextStyle(color: Colors.red, fontSize: 16),
                      maxLines: 2,
                    ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildQuantityPart(cartProduct) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // SizedBox(
        //   height: 10,
        // ),
        Container(
          height: 40,
          width: 130,
          decoration: BoxDecoration(
            color: kPrimaryColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                child: Icon(
                  Icons.remove,
                  color: Colors.white,
                ),
                onTap: () {
                  setState(() {
                    if (cartProduct.quantity > 1) {
                      cartProduct.quantity--;
                    }
                    getTotalAmount();
                  });
                },
              ),
              Text(
                cartProduct.quantity.toString(),
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              GestureDetector(
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onTap: () {
                  setState(() {
                    if (cartProduct.quantity < cartProduct.stock) {
                      cartProduct.quantity++;
                    }
                    getTotalAmount();
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
