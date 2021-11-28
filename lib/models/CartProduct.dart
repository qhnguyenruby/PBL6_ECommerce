import 'dart:convert';

CartProduct cartProductFromJson(String str) =>
    CartProduct.fromJson(json.decode(str));

String cartProductToJson(CartProduct data) => json.encode(data.toJson());

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
        id: json["id"],
        productId: json["productId"],
        productDetailId: json["productDetail_Id"],
        shopId: json["shopId"],
        productName: json["productName"],
        color: json["color"],
        size: json["size"],
        shopName: json["shopName"],
        quantity: json["quantity"],
        stock: json["stock"],
        price: json["price"],
        image: json["image"],
        isShopAvailable: json["isShopAvailable"],
        isProductDetailAvailable: json["isProductDetailAvailable"],
        isRemainInStock: json["isRemainInStock"],
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
