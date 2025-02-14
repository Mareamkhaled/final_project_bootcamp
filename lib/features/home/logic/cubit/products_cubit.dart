
// import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import '../../data/models/clothes_model.dart';
import '../../data/repo/clothes_repo.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ClothesRepo clothesRepo;
  List<ProductItem> products = [];
  ProductsCubit(this.clothesRepo) : super(ProductsInitial());

  List<ProductItem> getProducts() {
    clothesRepo.getProducts().then((products) {
      emit(ProductsLoaded(products));
      this.products = products;
    });
    return products;
  }
}
