class ProductHomeView {
  ProductHomeView({
    required this.id,
    required this.name,
    required this.price,
    required this.viewCount,
    required this.totalStock,
    required this.thumbnailImage,
  });

  int id;
  String name;
  int price;
  int viewCount;
  int totalStock;
  String thumbnailImage;

  factory ProductHomeView.fromJson(Map<String, dynamic> json) =>
      ProductHomeView(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        viewCount: json["viewCount"],
        totalStock: json["totalStock"],
        thumbnailImage: json["thumbnailImage"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
        "viewCount": viewCount,
        "totalStock": totalStock,
        "thumbnailImage": thumbnailImage,
      };
}
