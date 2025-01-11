import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toyshop/src/data/product.dart';

final initializeAppProvider = FutureProvider<void>((ref) async {
  final productService = ProductService();
  final initAllProduct = productService.getAllProducts();
  await Future.wait([initAllProduct]);
});
