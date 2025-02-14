class ProductItem {
  String? imagePath;
  String? title;
  dynamic price;
  int? id;
  String? description;

  ProductItem.fromJson(Map<String, dynamic> json) {
    imagePath = "https://orientonline.info${json['img']}";

    title = json['name'];

    price = json['price'];
    id = json['id'];
    description = json['description'];
  }
}
