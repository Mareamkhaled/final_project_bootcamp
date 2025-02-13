import 'dart:developer';

import 'package:dio/dio.dart' show Dio, Response;

class ProductApi {
  final Dio dio;
  ProductApi(this.dio);

  Future<List<ProductItem>> getProducts() async {
    try {
      Response response =
          await dio.get("https://orientonline.info/api/products");
      List<ProductItem> products = (response.data['products'] as List)
          .map((item) => ProductItem.fromJson(item))
          .toList();
      return products;
    } catch (e) {
      log(e.toString());
      throw Exception('Oops, there was an error. Try later.');
    }
  }
}

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
    print(json['img']);
    return ProductItem(
      imagePath: "https://orientonline.info${json['img']}",
      title: json['name'], // Adjusted key for title
      price: json['price'],
    );
  }
}
