import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_shop_app/constants.dart';
import 'package:online_shop_app/function/dialog.dart';
import 'package:online_shop_app/models/CartProduct.dart';
import 'package:online_shop_app/models/Carts.dart';
import 'package:online_shop_app/screens/cart/components/check_out_card.dart';
import 'package:online_shop_app/services/cart_service.dart';

import '../../../size_config.dart';
// import 'cart_card.dart';

class Body extends StatefulWidget {
  final List<CartProduct> cartItems;
  Body({
    required this.cartItems,
  });
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List picked = [];
  int count = 1;
  int totalAmount = 0;
  List<CartProduct> productPickedList = [];

  void initState() {
    setInitPicked();
  }

  void setInitPicked() {
    for (int i = 0; i < widget.cartItems.length; i++) {
      picked.add(false);
    }
  }

  pickToggle(index) {
    setState(() {
      picked[index] = !picked[index];
      getTotalAmount();
      productPickedList.clear();
      for (int i = 0; i < picked.length; i++) {
        if (picked[i]) {
          productPickedList.add(widget.cartItems[i]);
        }
      }
    });
  }

  getTotalAmount() {
    totalAmount = 0;
    for (int i = 0; i < picked.length; i++) {
      if (picked[i]) {
        totalAmount += widget.cartItems[i].price * widget.cartItems[i].quantity;
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
              itemCount: widget.cartItems.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Dismissible(
                  key: Key(widget.cartItems[index].id.toString()),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) async {
                    CartService cartService = new CartService();
                    var response = await cartService.DeleteProductFromCart(
                        widget.cartItems[index].id);
                    if (response.statusCode == 200) {
                      displayDialog(
                        context,
                        "Thông báo",
                        "${json.decode(response.body)["message"]}",
                      );
                    } else {
                      displayDialog(
                        context,
                        "Thông báo",
                        "${response.body}",
                      );
                    }
                    setState(() {
                      widget.cartItems.removeAt(index);
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
                    widget.cartItems[index],
                    (!widget.cartItems[index].isShopAvailable ||
                            !widget.cartItems[index].isProductDetailAvailable ||
                            !widget.cartItems[index].isRemainInStock)
                        ? false
                        : true,
                    index,
                    (!widget.cartItems[index].isShopAvailable)
                        ? "Shop đã ngừng hoạt động"
                        : (!widget.cartItems[index].isProductDetailAvailable)
                            ? "Sản phẩm không tồn tại"
                            : (!widget.cartItems[index].isRemainInStock)
                                ? "Sản phẩm đã hết hàng"
                                : "",
                  ),
                ),
              ),
            ),
          ),
        ),
        CheckoutCard(totalAmount: totalAmount, cartProducts: productPickedList),
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
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: (cartProduct.image != "/storage/" &&
                            cartProduct.image != "")
                        ? NetworkImage(
                            "${SERVER_IP}/apigateway/Products${cartProduct.image}")
                        : AssetImage("assets/images/notfoundimage.png")
                            as ImageProvider,
                  )),
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
                width: getProportionateScreenWidth(210),
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
                  CartService cartService = CartService();
                  cartService.UpdateQuantityCartProduct(
                      cartProduct.id, cartProduct.quantity);
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
                  CartService cartService = CartService();
                  cartService.UpdateQuantityCartProduct(
                      cartProduct.id, cartProduct.quantity);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
