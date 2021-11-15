import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class ProductDetailField extends StatefulWidget {
  final String image;
  final String name;
  final double price;
  ProductDetailField(
      {required this.image, required this.name, required this.price});
  @override
  _ProductDetailFieldState createState() => _ProductDetailFieldState();
}

class _ProductDetailFieldState extends State<ProductDetailField> {
  int count = 1;

  Widget _buildColorProduct({required Color color}) {
    return Container(
      height: 40,
      width: 40,
      color: color,
    );
  }

  final TextStyle myStyle = TextStyle(
    fontSize: 18,
  );
  Widget _buildImage() {
    return Center(
      child: Container(
        width: 380,
        child: Card(
          child: Container(
            padding: EdgeInsets.all(13),
            child: Container(
              height: 260,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(widget.image),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNameToDescriptionPart() {
    return Container(
      height: 100,
      child: Row(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(widget.name, style: myStyle),
              Text(
                "\$ ${widget.price.toString()}",
                style: TextStyle(
                    color: Color(0xff9b96d6),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Text("Description", style: myStyle),
            ],
          ),
        ],
      ),
    );
  }

  // Widget _buildDiscription() {
  //   return Container(
  //     height: 200,
  //     child: Wrap(
  //       children: <Widget>[
  //         Text(
  //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ",
  //           style: TextStyle(fontSize: 16),
  //         )
  //       ],
  //     ),
  //   );
  // }

  Widget _buildDiscription() {
    return ReadMoreText(
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      trimLines: 5,
      trimMode: TrimMode.Line,
      trimCollapsedText: 'Đọc thêm',
      trimExpandedText: 'Ẩn bớt',
      style: TextStyle(fontSize: 16),
    );
  }

  List<bool> sized = [true, false, false, false];
  List<bool> colored = [true, false, false, false];
  int sizeIndex = 0;
  String size = "S";
  void getSize() {
    if (sizeIndex == 0) {
      setState(() {
        size = "S";
      });
    } else if (sizeIndex == 1) {
      setState(() {
        size = "M";
      });
    } else if (sizeIndex == 2) {
      setState(() {
        size = "L";
      });
    } else if (sizeIndex == 3) {
      setState(() {
        size = "XL";
      });
    }
  }

  int colorIndex = 0;
  String color = "Black";
  void getColor() {
    if (colorIndex == 0) {
      setState(() {
        color = "Light Blue";
      });
    } else if (colorIndex == 1) {
      setState(() {
        color = "Light Green";
      });
    } else if (colorIndex == 2) {
      setState(() {
        color = "Light Yellow";
      });
    } else if (colorIndex == 3) {
      setState(() {
        color = "Cyan";
      });
    }
  }

  Widget _buildSizePart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Size",
          style: myStyle,
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          width: 265,
          child: ToggleButtons(
            children: [
              Text("S"),
              Text("M"),
              Text("L"),
              Text("XL"),
            ],
            onPressed: (int index) {
              setState(() {
                for (int indexBtn = 0; indexBtn < sized.length; indexBtn++) {
                  if (indexBtn == index) {
                    sized[indexBtn] = true;
                  } else {
                    sized[indexBtn] = false;
                  }
                }
              });
              setState(() {
                sizeIndex = index;
              });
            },
            isSelected: sized,
          ),
        ),
      ],
    );
  }

  Widget _buildColorPart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Text(
          "Color",
          style: myStyle,
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          width: 265,
          child: ToggleButtons(
            fillColor: Color(0xff746bc9),
            renderBorder: false,
            children: [
              _buildColorProduct(color: Colors.blue[200]!),
              _buildColorProduct(color: Colors.green[200]!),
              _buildColorProduct(color: Colors.yellow[200]!),
              _buildColorProduct(color: Colors.cyan[300]!),
            ],
            onPressed: (int index) {
              setState(() {
                for (int indexBtn = 0; indexBtn < colored.length; indexBtn++) {
                  if (indexBtn == index) {
                    colored[indexBtn] = true;
                  } else {
                    colored[indexBtn] = false;
                  }
                }
              });
              setState(() {
                colorIndex = index;
              });
            },
            isSelected: colored,
          ),
        ),
      ],
    );
  }

  Widget _buildQuentityPart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Text(
          "Quentity",
          style: myStyle,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 40,
          width: 130,
          decoration: BoxDecoration(
            color: Color(0xff746bc9),
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
                    if (count > 1) {
                      count--;
                    }
                  });
                },
              ),
              Text(
                count.toString(),
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              GestureDetector(
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onTap: () {
                  setState(() {
                    count++;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Widget _buildButtonPart() {
  //   return Container(
  //     height: 60,
  //     child: MyButton(
  //       name: "Add To Cart",
  //       onPressed: () {
  //         getSize();
  //         getColor();
  //         productProvider.getCheckOutData(
  //           image: widget.image,
  //           color: color,
  //           size: size,
  //           name: widget.name,
  //           price: widget.price,
  //           quentity: count,
  //         );
  //         Navigator.of(context).pushReplacement(
  //           MaterialPageRoute(
  //             builder: (ctx) => CheckOut(),
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _buildImage(),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildNameToDescriptionPart(),
                _buildDiscription(),
                _buildSizePart(),
                _buildColorPart(),
                _buildQuentityPart(),
                SizedBox(
                  height: 15,
                ),
                // _buildButtonPart(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
