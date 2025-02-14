import 'dart:developer';
import 'package:dio/dio.dart';

class ClothesWebServices {
  late Dio dio;

  ClothesWebServices() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://orientonline.info/api/",
        connectTimeout: const Duration(seconds: 20),
        receiveDataWhenStatusError: true,
        receiveTimeout: const Duration(seconds: 20),
      ),
    );
  }

  Future<List<dynamic>> getProducts() async {
    try {
      Response response = await dio.get("products");
      log(response.data.toString());
      return response.data['products'] as List<dynamic>;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
}
