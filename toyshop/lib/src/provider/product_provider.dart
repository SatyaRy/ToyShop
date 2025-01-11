import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toyshop/src/data/product.dart';
import 'package:toyshop/src/model/product/product.dart';

final getProductProvider = FutureProvider<List<ProductModel>>((ref) {
  return ProductService().getPopularProduct();
});

final getToyTypeProvider = FutureProvider<List<ProductModel>>((ref) {
  return ProductService().getToyType();
});

final getTrendingToyProvider =
    StreamProvider.family<List<ProductModel>, String>((ref, productType) {
  return ProductService().getTrendingToy(productType);
});


final getProductsProvider = FutureProvider.family<List<ProductModel>,String>((ref,type){
  return ProductService().getFilteredProduct(type);
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
