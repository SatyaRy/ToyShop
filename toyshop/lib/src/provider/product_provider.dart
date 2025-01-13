import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toyshop/src/data/product.dart';
import 'package:toyshop/src/model/product/product.dart';

//service provider
final productServiceProvider = Provider((ref) {
  return ProductService();
});
//popular toy provider
final getProductProvider = FutureProvider<List<ProductModel>>((ref) {
  final service = ref.watch(productServiceProvider);
  return service.getPopularProduct();
});

//toy list provider
final getToyTypeProvider = FutureProvider<List<ProductModel>>((ref) {
  final service = ref.watch(productServiceProvider);
  return service.getToyType();
});

//toy type provider
final getTrendingToyProvider =
    StreamProvider.family<List<ProductModel>, String>((ref, productType) {
  final service = ref.watch(productServiceProvider);
  return service.getTrendingToy(productType);
});

//filtering
final getProductsProvider =
    FutureProvider.family<List<ProductModel>, String>((ref, type) {
  final service = ref.watch(productServiceProvider);
  return service.getFilteredProduct(type);
});

final getProductDetailProvider =
    FutureProvider.family<dynamic, String>((ref, productID) {
  final service = ref.watch(productServiceProvider);
  return service.getProductDetail(productID);
});

//method
class FilterNotifier extends StateNotifier<String> {
  FilterNotifier() : super("Trending");
  void changeFilter(String productType) {
    state = productType;
  }
}

//provider
final filterProvider = StateNotifierProvider<FilterNotifier, String>((ref) {
  return FilterNotifier();
});
