import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toyshop/src/data/product.dart';

final initializeAppProvider = FutureProvider<void>((ref) async {
  final productService = ProductService();
  final initPopularProduct = productService.getProduct();
  final initToyType = productService.getToyType();
  final initFitlerProduct = productService.getTrendingToy("trendingToy").first;
  await Future.wait([initPopularProduct, initToyType, initFitlerProduct]);
});
