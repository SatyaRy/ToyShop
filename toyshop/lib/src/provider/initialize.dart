// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toyshop/src/data/product.dart';

final initializeAppProvider = FutureProvider<void>((
  ref,
) async {
  final navigator = ref.read(navigatorKeyProvider);
  final context = navigator.currentContext;
  if (context != null) {
    try {
      final productService = ProductService();
      final initAllProduct = productService.getAllProducts();
      final products = await initAllProduct;
      final cache = DefaultCacheManager();
      await Future.wait([initAllProduct]);
      for (var product in products) {
        final imageURL = product.productImage;
        await cache.getSingleFile(imageURL);
        debugPrint("successfully cache");
      }
    } catch (e, stackTrace) {
      debugPrint('Error during initialization: $e');
      debugPrint("$stackTrace");
    }
  } else {
    debugPrint("cannot be cache");
  }
});

final navigatorKeyProvider = Provider<GlobalKey<NavigatorState>>((ref) {
  return GlobalKey<NavigatorState>();
});
