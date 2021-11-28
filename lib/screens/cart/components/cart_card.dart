import 'package:flutter/material.dart';
import 'package:online_shop_app/models/CartProduct.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class CartCard extends StatefulWidget {
  const CartCard({
    Key? key,
    required this.cartProduct,
    required this.available,
    required this.index,
  }) : super(key: key);

  final CartProduct cartProduct;
  final bool available;
  final int index;

  @override
  _CartCardState createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  List picked = [false, false, false, false, false, false, false];
  int count = 1;
  int totalAmount = 0;
  String reasonUnAvailable = "";

  void initState() {
    setInitReasonUnAvailable();
  }

  void setInitReasonUnAvailable() {
    if (!widget.cartProduct.isShopAvailable) {
      reasonUnAvailable = "Shop đã ngừng hoạt động";
    } else if (!widget.cartProduct.isProductDetailAvailable) {
      reasonUnAvailable = "Sản phẩm không tồn tại";
    } else if (!widget.cartProduct.isRemainInStock) {
      reasonUnAvailable = "Sản phẩm đã hết hàng";
    }
  }

  pickToggle(index) {
    setState(() {
      picked[index] = !picked[index];
      getTotalAmount();
    });
  }

  getTotalAmount() {
    var count = 0;
    for (int i = 0; i < picked.length; i++) {
      if (picked[i]) {
        count = count + 1;
      }
      if (i == picked.length - 1) {
        setState(() {
          totalAmount = 100 * count;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            if (widget.available) {
              pickToggle(widget.index);
              print(totalAmount);
            }
          },
          child: Container(
            height: 25.0,
            width: 25.0,
            decoration: BoxDecoration(
              color: widget.available
                  ? Colors.grey.withOpacity(0.4)
                  : Colors.red.withOpacity(0.4),
              borderRadius: BorderRadius.circular(12.5),
            ),
            child: Center(
              child: widget.available
                  ? Container(
                      height: 12.0,
                      width: 12.0,
                      decoration: BoxDecoration(
                          color: picked[widget.index]
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
              child: Image.asset(widget.cartProduct.image),
            ),
          ),
        ),
        SizedBox(width: 20),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.cartProduct.productName,
                style: TextStyle(color: Colors.black, fontSize: 16),
                maxLines: 2,
              ),
              Text(
                "Màu: ${widget.cartProduct.color}",
                style: TextStyle(color: Colors.black, fontSize: 16),
                maxLines: 2,
              ),
              Text(
                "Size: ${widget.cartProduct.size}",
                style: TextStyle(color: Colors.black, fontSize: 16),
                maxLines: 2,
              ),
              Text.rich(
                TextSpan(
                  text: "${widget.cartProduct.price} đ",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: kPrimaryColor),
                ),
              ),
              (widget.available)
                  ? _buildQuantityPart(setState)
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

  Widget _buildQuantityPart(setter) {
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
                  setter(() {
                    if (widget.cartProduct.quantity > 1) {
                      widget.cartProduct.quantity--;
                    }
                  });
                },
              ),
              Text(
                widget.cartProduct.quantity.toString(),
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              GestureDetector(
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onTap: () {
                  setter(() {
                    if (widget.cartProduct.quantity <
                        widget.cartProduct.stock) {
                      widget.cartProduct.quantity++;
                    }
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
