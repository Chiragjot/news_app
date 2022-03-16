class Products {
  Products({
      this.id,
      this.productName,
      this.productUrl,
      this.productrating,
      this.productDescription
  });

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
