import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toyshop/src/data/product.dart';
import 'package:toyshop/src/model/product/product.dart';
import "package:riverpod_annotation/riverpod_annotation.dart";
part "product_provider.g.dart";

@riverpod
Stream<List<ProductModel>> getProduct(Ref ref) {
  return ProductService().getProduct();
}

@riverpod
Stream<List<ToyTypeModel>> getToyType(Ref ref) {
  return ProductService().getToyType();
}

@riverpod
Stream<List<ProductModel>> getTrendingToy(Ref ref, String productType) {
  return ProductService().getTrendingToy(productType);
}

//method
class FilterNotifier extends StateNotifier<String> {
  FilterNotifier() : super("trendingToy");
  void changeFilter(String productType) {
    state = productType;
  }
}

//provider
final filterProvider = StateNotifierProvider<FilterNotifier, String>((ref) {
  return FilterNotifier();
});
