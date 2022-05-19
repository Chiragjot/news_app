class Products {
  Products(
      {required this.id,
      required this.productName,
      required this.productUrl,
      required this.productrating,
      required this.productDescription});

  String id;
  String productName;
  String productUrl;
  String productrating;
  String productDescription;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        id: json["id"],
        productName: json["productName"],
        productUrl: json["productUrl"],
        productrating: json["productrating"],
        productDescription: json["productDescription"],
      );
}
