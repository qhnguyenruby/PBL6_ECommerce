import 'dart:convert';

CartProduct cartFromJson(String str) => CartProduct.fromJson(json.decode(str));

String cartToJson(CartProduct data) => json.encode(data.toJson());

class CartProduct {
  CartProduct({
    required this.id,
    required this.productId,
    required this.productDetailId,
    required this.shopId,
    required this.productName,
    required this.color,
    required this.size,
    required this.shopName,
    required this.quantity,
    required this.stock,
    required this.price,
    required this.image,
    required this.isShopAvailable,
    required this.isProductDetailAvailable,
    required this.isRemainInStock,
  });

  int id;
  int productId;
  int productDetailId;
  int shopId;
  String productName;
  String color;
  String size;
  String shopName;
  int quantity;
  int stock;
  int price;
  String image;
  bool isShopAvailable;
  bool isProductDetailAvailable;
  bool isRemainInStock;

  factory CartProduct.fromJson(Map<String, dynamic> json) => CartProduct(
        id: json["resultObj"]["id"],
        productId: json["resultObj"]["productId"],
        productDetailId: json["resultObj"]["productDetail_Id"],
        shopId: json["resultObj"]["shopId"],
        productName: json["resultObj"]["productName"],
        color: json["resultObj"]["color"],
        size: json["resultObj"]["size"],
        shopName: json["resultObj"]["shopName"],
        quantity: json["resultObj"]["quantity"],
        stock: json["resultObj"]["stock"],
        price: json["resultObj"]["price"],
        image: json["resultObj"]["image"],
        isShopAvailable: json["resultObj"]["isShopAvailable"],
        isProductDetailAvailable: json["resultObj"]["isProductDetailAvailable"],
        isRemainInStock: json["resultObj"]["isRemainInStock"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "productId": productId,
        "productDetail_Id": productDetailId,
        "shopId": shopId,
        "productName": productName,
        "color": color,
        "size": size,
        "shopName": shopName,
        "quantity": quantity,
        "stock": stock,
        "price": price,
        "image": image,
        "isShopAvailable": isShopAvailable,
        "isProductDetailAvailable": isProductDetailAvailable,
        "isRemainInStock": isRemainInStock,
      };
}

List<CartProduct> demoCarts = [
  CartProduct(
    id: 1,
    productName: "Áo thun trơn XFire",
    color: "Đỏ",
    size: "M",
    quantity: 3,
    stock: 10,
    price: 140000,
    image: "assets/images/Ao1.jpg",
    isShopAvailable: true,
    isProductDetailAvailable: true,
    isRemainInStock: true,
    shopName: '',
    productDetailId: 1,
    productId: 1,
    shopId: 1,
  ),
  CartProduct(
    id: 2,
    productName: "Áo thun trơn XFire",
    color: "Xám",
    size: "S",
    quantity: 1,
    stock: 0,
    price: 210000,
    image: "assets/images/Ao2.jpg",
    isShopAvailable: false,
    isProductDetailAvailable: true,
    isRemainInStock: true,
    shopName: '',
    productDetailId: 1,
    productId: 1,
    shopId: 1,
  ),
  CartProduct(
    id: 3,
    productName: "Áo thun trơn XFire",
    color: "Xám",
    size: "S",
    quantity: 1,
    stock: 0,
    price: 210000,
    image: "assets/images/Ao2.jpg",
    isShopAvailable: true,
    isProductDetailAvailable: false,
    isRemainInStock: true,
    shopName: '',
    productDetailId: 1,
    productId: 1,
    shopId: 1,
  ),
  CartProduct(
    id: 4,
    productName: "Áo thun trơn XFire",
    color: "Xám",
    size: "S",
    quantity: 1,
    stock: 15,
    price: 210000,
    image: "assets/images/Ao2.jpg",
    isShopAvailable: true,
    isProductDetailAvailable: true,
    isRemainInStock: false,
    shopName: '',
    productDetailId: 1,
    productId: 1,
    shopId: 1,
  ),
  CartProduct(
    id: 5,
    productName: "Áo thun trơn XFire",
    color: "Xám",
    size: "S",
    quantity: 1,
    stock: 15,
    price: 210000,
    image: "assets/images/Ao2.jpg",
    isShopAvailable: true,
    isProductDetailAvailable: true,
    isRemainInStock: true,
    shopName: '',
    productDetailId: 1,
    productId: 1,
    shopId: 1,
  ),
  CartProduct(
    id: 6,
    productName: "Áo thun trơn XFire",
    color: "Xám",
    size: "S",
    quantity: 1,
    stock: 15,
    price: 210000,
    image: "assets/images/Ao2.jpg",
    isShopAvailable: false,
    isProductDetailAvailable: false,
    isRemainInStock: false,
    shopName: '',
    productDetailId: 1,
    productId: 1,
    shopId: 1,
  ),
  CartProduct(
    id: 7,
    productName: "Áo thun trơn XFire",
    color: "Xám",
    size: "S",
    quantity: 1,
    stock: 15,
    price: 210000,
    image: "assets/images/Ao2.jpg",
    isShopAvailable: true,
    isProductDetailAvailable: true,
    isRemainInStock: true,
    shopName: '',
    productDetailId: 1,
    productId: 1,
    shopId: 1,
  ),
];
