part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}
final class ProductsLoaded extends ProductsState {
  final List<ProductItem> products;

  ProductsLoaded(this.products);
}
