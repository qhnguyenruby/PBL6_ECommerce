// To parse this JSON data, do
//
//     final orders = ordersFromJson(jsonString);

import 'dart:convert';

List<Orders> ordersFromJson(String str) => List<Orders>.from(
    json.decode(str)["resultObj"].map((x) => Orders.fromJson(x)));

String ordersToJson(List<Orders> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Orders {
  Orders({
    required this.id,
    required this.userId,
    required this.shopId,
    required this.shopName,
    required this.state,
    required this.cancelReason,
    required this.shipName,
    required this.shipAddress,
    required this.shipPhone,
    required this.orderDetails,
    required this.totalPrice,
  });

  int id;
  int userId;
  int shopId;
  String shopName;
  String state;
  dynamic cancelReason;
  String shipName;
  String shipAddress;
  String shipPhone;
  List<OrderDetail> orderDetails;
  int totalPrice;

  factory Orders.fromJson(Map<String, dynamic> json) => Orders(
        id: json["id"],
        userId: json["userId"],
        shopId: json["shopId"],
        shopName: json["shopName"],
        state: json["state"],
        cancelReason: json["cancelReason"],
        shipName: json["shipName"],
        shipAddress: json["shipAddress"],
        shipPhone: json["shipPhone"],
        orderDetails: List<OrderDetail>.from(
            json["orderDetails"].map((x) => OrderDetail.fromJson(x))),
        totalPrice: json["totalPrice"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "shopId": shopId,
        "shopName": shopName,
        "state": state,
        "cancelReason": cancelReason,
        "shipName": shipName,
        "shipAddress": shipAddress,
        "shipPhone": shipPhone,
        "orderDetails": List<dynamic>.from(orderDetails.map((x) => x.toJson())),
        "totalPrice": totalPrice,
      };
}

class OrderDetail {
  OrderDetail({
    required this.orderId,
    required this.productDetailId,
    required this.price,
    required this.quantity,
    required this.productName,
    required this.color,
    required this.size,
    required this.image,
  });

  int orderId;
  int productDetailId;
  int price;
  int quantity;
  String productName;
  String color;
  String size;
  String image;

  factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
        orderId: json["orderId"],
        productDetailId: json["productDetail_Id"],
        price: json["price"],
        quantity: json["quantity"],
        productName: json["productName"],
        color: json["color"],
        size: json["size"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "orderId": orderId,
        "productDetail_Id": productDetailId,
        "price": price,
        "quantity": quantity,
        "productName": productName,
        "color": color,
        "size": size,
        "image": image,
      };
}

List<Orders> demoOrders = [
  Orders(
    id: 35,
    userId: 7,
    shopId: 1,
    shopName: "Tuấn's Fashion",
    state: "Chờ xác nhận",
    cancelReason: null,
    shipName: "Trần Thi Trang Thảo",
    shipAddress: "Hà Nội",
    shipPhone: "0789079834",
    orderDetails: [
      OrderDetail(
        orderId: 35,
        productDetailId: 887,
        price: 49000,
        quantity: 1,
        productName: "Nón lưỡi trai Adidas",
        color: "Trắng",
        size: "XL",
        image: "/storage/1e1bfb7d-62e0-484e-9e91-08fc8d3e6e10.jpg",
      ),
    ],
    totalPrice: 49000,
  ),
  Orders(
    id: 34,
    userId: 7,
    shopId: 2,
    shopName: "Đạt's Fashion",
    state: "Chờ xác nhận",
    cancelReason: null,
    shipName: "Trần Thi Trang Thảo",
    shipAddress: "Hà Nội",
    shipPhone: "0789079834",
    orderDetails: [
      OrderDetail(
          orderId: 34,
          productDetailId: 879,
          price: 40000,
          quantity: 1,
          productName: "Áo sơ mi lụa cổ buộc nơ to tay bồng nhẹ ",
          color: "Đen",
          size: "XL",
          image: "/storage/444c6053-5305-4310-adff-f4d96e8542de.jpg"),
      OrderDetail(
          orderId: 34,
          productDetailId: 906,
          price: 39000,
          quantity: 1,
          productName: "Áo lót nam cotton",
          color: "Trắng",
          size: "XL",
          image: "/storage/eb347346-fa1f-4dce-9d99-8876fad4d06f.jpg"),
    ],
    totalPrice: 49000,
  ),
  Orders(
    id: 34,
    userId: 7,
    shopId: 2,
    shopName: "Đạt's Fashion",
    state: "Chờ xác nhận",
    cancelReason: null,
    shipName: "Trần Thi Trang Thảo",
    shipAddress: "Hà Nội",
    shipPhone: "0789079834",
    orderDetails: [
      OrderDetail(
          orderId: 34,
          productDetailId: 879,
          price: 40000,
          quantity: 1,
          productName: "Áo sơ mi lụa cổ buộc nơ to tay bồng nhẹ ",
          color: "Đen",
          size: "XL",
          image: "/storage/444c6053-5305-4310-adff-f4d96e8542de.jpg"),
      OrderDetail(
          orderId: 34,
          productDetailId: 906,
          price: 39000,
          quantity: 1,
          productName: "Áo lót nam cotton",
          color: "Trắng",
          size: "XL",
          image: "/storage/eb347346-fa1f-4dce-9d99-8876fad4d06f.jpg"),
    ],
    totalPrice: 49000,
  ),
  Orders(
    id: 34,
    userId: 7,
    shopId: 2,
    shopName: "Đạt's Fashion",
    state: "Chờ xác nhận",
    cancelReason: null,
    shipName: "Trần Thi Trang Thảo",
    shipAddress: "Hà Nội",
    shipPhone: "0789079834",
    orderDetails: [
      OrderDetail(
          orderId: 34,
          productDetailId: 879,
          price: 40000,
          quantity: 1,
          productName: "Áo sơ mi lụa cổ buộc nơ to tay bồng nhẹ ",
          color: "Đen",
          size: "XL",
          image: "/storage/444c6053-5305-4310-adff-f4d96e8542de.jpg"),
      OrderDetail(
          orderId: 34,
          productDetailId: 906,
          price: 39000,
          quantity: 1,
          productName: "Áo lót nam cotton",
          color: "Trắng",
          size: "XL",
          image: "/storage/eb347346-fa1f-4dce-9d99-8876fad4d06f.jpg"),
    ],
    totalPrice: 49000,
  ),
];
