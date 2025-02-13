class ProductItem {
  final String? imagePath;
  final String? title;
  final dynamic price; 

  ProductItem({
    required this.imagePath,
    required this.title,
    required this.price,
  });

  factory ProductItem.fromJson(Map<String, dynamic> json) {
    return ProductItem(
      imagePath: json['image'],
      title: json['title'],
      price: json['price'],
    );
  }
}
