import '../models/clothes_model.dart';
import '../services/clothes_service.dart';

class ClothesRepo {
  final ClothesWebServices clothesWebServices;

  ClothesRepo({required this.clothesWebServices});

   Future<List<ProductItem>> getProducts() async {
    final products = await clothesWebServices.getProducts();
    return products.map((product) => ProductItem.fromJson(product)).toList();
   }
}