import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toyshop/src/data/product.dart';
import 'package:toyshop/src/model/product/product.dart';

//service 
final productServiceProvider = Provider((ref) {
  return ProductService();
});


//popular toy  
final getProductProvider = FutureProvider<List<ProductModel>>((ref) {
  final service = ref.watch(productServiceProvider);
  return service.getPopularProduct();
});


//type of toy
final getToyTypeProvider = FutureProvider<List<ProductModel>>((ref) {
  final service = ref.watch(productServiceProvider);
  return service.getToyType();
});


//filtering
final getProductsProvider =
    FutureProvider.family<List<ProductModel>, String>((ref, type) {
  final service = ref.watch(productServiceProvider);
  return service.getFilteredProduct(type);
});

//detail of toy
final getProductDetailProvider =
    FutureProvider.family<dynamic, String>((ref, productID) {
  final service = ref.watch(productServiceProvider);
  return service.getProductDetail(productID);
});

//provider  and filter key word
final filterProvider = StateNotifierProvider<FilterNotifier, String>((ref) {
  return FilterNotifier();
});
class FilterNotifier extends StateNotifier<String> {
  FilterNotifier() : super("Trending");
  void changeFilter(String productType) {
    state = productType;
  }
}


