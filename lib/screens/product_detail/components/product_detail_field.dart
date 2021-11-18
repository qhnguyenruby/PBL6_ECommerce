import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:online_shop_app/components/custom_btn.dart';
import 'package:online_shop_app/components/default_button.dart';
import 'package:online_shop_app/models/ProductDetail.dart';
import 'package:online_shop_app/models/Shop.dart';
import 'package:online_shop_app/services/shop_service.dart';
import 'package:readmore/readmore.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class ProductDetailField extends StatefulWidget {
  final ProductDetail product;
  ProductDetailField({
    required this.product,
  });
  @override
  _ProductDetailFieldState createState() => _ProductDetailFieldState();
}

class _ProductDetailFieldState extends State<ProductDetailField> {
  int count = 1;
  int _current = 0;
  final CarouselController _controller = CarouselController();
  final List<String> imgPathList = [];
  int currentStock = 0;
  String currentImageWithColor = "";
  List<ImageItem> imageList = [];
  List<Detail> detailList = [];

  List<bool> sized = [];
  int sizeIndex = 0;
  List<String> sizeList = [];
  String size = "";

  List<bool> colored = [];
  int colorIndex = 0;
  List<String> colorList = [];
  String color = "";

  void initState() {
    imageList = widget.product.images;
    detailList = widget.product.details;
    setThumbnailList();
    setInitColorList();
    setInitColored();
    setInitSizeList();
    setInitSized();
    color = colorList[0];
    size = sizeList[0];
    setCurrentStock();
    setImageWithColor();
    super.initState();
  }

  void setImageWithColor() {
    for (int i = 0; i < imageList.length; i++) {
      if (imageList[i].colorName == color) {
        currentImageWithColor = imageList[i].imagePath;
      }
    }
  }

  void setCurrentStock() {
    for (int i = 0; i < detailList.length; i++) {
      if (detailList[i].color == color && detailList[i].size == size) {
        currentStock = detailList[i].stock;
      }
    }
  }

  void setThumbnailList() {
    for (int i = 0; i < imageList.length; i++) {
      if (imageList[i].isDefault || imageList[i].colorName == "không màu") {
        imgPathList.add('${SERVER_IP}${imageList[i].imagePath}');
      }
    }
  }

  void setInitSizeList() {
    for (int i = 0; i < detailList.length; i++) {
      if (!sizeList.contains(detailList[i].size)) {
        sizeList.add(detailList[i].size);
      }
    }
  }

  void setInitSized() {
    sized.add(true);
    for (int i = 1; i < sizeList.length; i++) {
      sized.add(false);
    }
  }

  void setInitColorList() {
    for (int i = 0; i < detailList.length; i++) {
      if (!colorList.contains(detailList[i].color)) {
        colorList.add(detailList[i].color);
      }
    }
  }

  void setInitColored() {
    colored.add(true);
    for (int i = 1; i < colorList.length; i++) {
      colored.add(false);
    }
  }

  final TextStyle myStyle = TextStyle(
    fontSize: 18,
  );

  // Widget _buildImage() {
  //   return Center(
  //     child: Container(
  //       width: 380,
  //       child: Card(
  //         child: Container(
  //           padding: EdgeInsets.all(13),
  //           child: Container(
  //             height: 260,
  //             decoration: BoxDecoration(
  //               image: DecorationImage(
  //                 fit: BoxFit.fill,
  //                 image: NetworkImage(
  //                     "${SERVER_IP}${widget.product.images[0].imagePath}"),
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _buildImage() {
    return SingleChildScrollView(
      child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 2.0,
              viewportFraction: 1,
              onPageChanged: (index, carouselReson) {
                setState(() {
                  _current = index;
                });
              },
              enlargeCenterPage: true,
            ),
            items: imgPathList
                .map((item) => Container(
                      child: Container(
                        margin: EdgeInsets.all(5.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          child: Image.network(item,
                              fit: BoxFit.contain, width: 1000.0),
                        ),
                      ),
                    ))
                .toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgPathList.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 12.0,
                  height: 12.0,
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black)
                          .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                ),
              );
            }).toList(),
          ),
        ],
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
              Text(widget.product.name, style: myStyle),
              Text(
                "${widget.product.price.toString()} đ",
                style: TextStyle(
                    color: Color(0xff9b96d6),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              // Text("Mô tả sản phẩm: ", style: myStyle),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDiscription() {
    return ReadMoreText(
      widget.product.description,
      trimLines: 5,
      trimMode: TrimMode.Line,
      trimCollapsedText: 'Đọc thêm',
      trimExpandedText: 'Ẩn bớt',
      style: TextStyle(fontSize: 16),
    );
  }

  // List<bool> sized = [true, false, false, false, false];

  void getSize(setter) {
    setter(() {
      size = sizeList[sizeIndex];
    });
  }
  // void getSize() {
  //   if (sizeIndex == 0) {
  //     setState(() {
  //       size = "S";
  //     });
  //   } else if (sizeIndex == 1) {
  //     setState(() {
  //       size = "M";
  //     });
  //   } else if (sizeIndex == 2) {
  //     setState(() {
  //       size = "L";
  //     });
  //   } else if (sizeIndex == 3) {
  //     setState(() {
  //       size = "XL";
  //     });
  //   }
  // }

  void getColor(setter) {
    setter(() {
      color = colorList[colorIndex];
    });
  }
  // void getColor() {
  //   if (colorIndex == 0) {
  //     setState(() {
  //       color = "Light Blue";
  //     });
  //   } else if (colorIndex == 1) {
  //     setState(() {
  //       color = "Light Green";
  //     });
  //   } else if (colorIndex == 2) {
  //     setState(() {
  //       color = "Light Yellow";
  //     });
  //   } else if (colorIndex == 3) {
  //     setState(() {
  //       color = "Cyan";
  //     });
  //   }
  // }

  void getCurrentStock(setter) {
    List<Detail> detailList = widget.product.details;
    for (int i = 0; i < detailList.length; i++) {
      if (detailList[i].color == color && detailList[i].size == size) {
        setter(() {
          currentStock = detailList[i].stock;
        });
      }
    }
  }

  Widget _buildSizePart(setter) {
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
              // Text("  ${sizeList[0]}  "),
              // Text("  Đỏ chét  "),
              // Text("L"),
              // Text("XL"),
              ...List.generate(
                sizeList.length,
                (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(sizeList[index]),
                  );

                  // return SizedBox
                  //     .shrink(); // here by default width and height is 0
                },
              ),
            ],
            onPressed: (int index) {
              setter(() {
                for (int indexBtn = 0; indexBtn < sized.length; indexBtn++) {
                  if (indexBtn == index) {
                    sized[indexBtn] = true;
                  } else {
                    sized[indexBtn] = false;
                  }
                }
              });
              setter(() {
                sizeIndex = index;
              });
              getSize(setter);
              getCurrentStock(setter);
              print("Color value: $color");
              print("Size value: $size");
            },
            isSelected: sized,
          ),
        ),
      ],
    );
  }

  void getImageWithColor(setter) {
    List<ImageItem> imageList = widget.product.images;
    for (int i = 0; i < imageList.length; i++) {
      if (imageList[i].colorName == color) {
        setter(() {
          currentImageWithColor = imageList[i].imagePath;
        });
      }
    }
  }

  Widget _buildColorPart(setter) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Màu",
          style: myStyle,
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          width: 265,
          child: ToggleButtons(
            children: [
              ...List.generate(
                colorList.length,
                (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(colorList[index]),
                  );

                  // return SizedBox
                  //     .shrink(); // here by default width and height is 0
                },
              ),
            ],
            onPressed: (int index) {
              setter(() {
                for (int indexBtn = 0; indexBtn < colored.length; indexBtn++) {
                  if (indexBtn == index) {
                    colored[indexBtn] = true;
                  } else {
                    colored[indexBtn] = false;
                  }
                }
              });
              setter(() {
                colorIndex = index;
              });
              getColor(setter);
              getCurrentStock(setter);
              getImageWithColor(setter);
              print("Color value: $color");
              print("Size value: $size");
            },
            isSelected: colored,
          ),
        ),
      ],
    );
  }

  Widget _buildQuantityPart(setter) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Text(
          "Số lượng",
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
                  setter(() {
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
                  setter(() {
                    if (count < currentStock) {
                      count++;
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

  Future<Shop> getShopByShopId(int id) async {
    ShopService shopService = ShopService();
    var shopDetail = await shopService.getShopById(id);
    return shopDetail;
  }

  Widget _buildShopPart() {
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        FutureBuilder(
          future: getShopByShopId(widget.product.shopId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                // height: 90,
                width: double.infinity,
                // padding: EdgeInsets.symmetric(
                //   horizontal: getProportionateScreenWidth(20),
                //   vertical: getProportionateScreenWidth(15),
                // ),
                // decoration: BoxDecoration(
                //   color: Color(0xfffea200),
                //   borderRadius: BorderRadius.circular(4),
                // ),
                child: Row(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.grey.shade400, width: 1),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(13),
                        child: Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  "${SERVER_IP}${(snapshot.data as Shop).avatar}"),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      // decoration: BoxDecoration(
                      //   color: Color(0xfffea200),
                      //   borderRadius: BorderRadius.circular(4),
                      // ),
                      width: getProportionateScreenWidth(180),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(10),
                          vertical: getProportionateScreenWidth(15),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "${(snapshot.data as Shop).nameOfShop}",
                              style: TextStyle(
                                  // color: Color(0xff9b96d6),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${(snapshot.data as Shop).address}",
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    CustomButton(
                      color: Colors.red,
                      press: () {},
                      text: "Xem Shop",
                      height: 40,
                      width: 80,
                    )
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ],
    );
  }

  Widget _buildProductImageWithColor(StateSetter setter) {
    return Row(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.grey.shade400, width: 1),
          ),
          child: Container(
            padding: EdgeInsets.all(13),
            child: Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage("${SERVER_IP}${currentImageWithColor}"),
                ),
              ),
            ),
          ),
        ),
        Container(
          // decoration: BoxDecoration(
          //   color: Color(0xfffea200),
          //   borderRadius: BorderRadius.circular(4),
          // ),
          width: getProportionateScreenWidth(180),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(10),
              vertical: getProportionateScreenWidth(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Giá: ${widget.product.price.toString()} đ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Text("Kho: ${currentStock}"),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSelectColorAndSizeForm(mySetState, typeForm) {
    return SingleChildScrollView(
      child: Container(
        height: getProportionateScreenHeight(500),
        color: Colors.white10,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildProductImageWithColor(mySetState),
              _buildColorPart(mySetState),
              _buildSizePart(mySetState),
              _buildQuantityPart(mySetState),
              SizedBox(
                height: 15,
              ),
              typeForm == "addCart"
                  ? DefaultButton(
                      text: "Thêm giỏ hàng",
                      press: () {},
                    )
                  : DefaultButton(
                      text: "Mua ngay",
                      press: () {},
                    ),
              // _buildButtonPart(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButtonPart() {
    return Row(
      children: [
        CustomButton(
          text: "Thêm giỏ hàng",
          press: () {
            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return StatefulBuilder(
                  builder: (context, mySetState) {
                    return _buildSelectColorAndSizeForm(mySetState, "addCart");
                  },
                );
              },
            );
          },
          color: kPrimaryColor,
          width: 160,
          height: 60,
        ),
        SizedBox(
          width: 13,
        ),
        CustomButton(
          text: "Mua ngay",
          press: () {
            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return StatefulBuilder(
                  builder: (context, mySetState) {
                    return _buildSelectColorAndSizeForm(mySetState, "");
                  },
                );
              },
            );
          },
          color: kPrimaryColor,
          width: 160,
          height: 60,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _buildImage(),
          // ProductImages(),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildNameToDescriptionPart(),
                // _buildColorPart(),
                // _buildSizePart(),
                // _buildQuantityPart(),
                _buildShopPart(),
                _buildDiscription(),
                SizedBox(
                  height: 15,
                ),
                _buildButtonPart(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
