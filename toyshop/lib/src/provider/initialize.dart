// ignore_for_file: use_build_context_synchronously
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toyshop/src/data/product.dart';
import 'package:toyshop/src/provider/cart/cart.dart';
import 'package:toyshop/src/provider/favorite.dart';
import 'package:toyshop/src/provider/profile.dart';
import 'package:toyshop/src/provider/transaction.dart';

final initializeAppProvider = FutureProvider<void>((
  ref,
) async {
  //refresh provider to newest updated data
  ref.invalidate(getCartItemsProvider);
  ref.invalidate(totalProvider);
  ref.invalidate(quantityProvider);
  ref.invalidate(cartStreamProvider);
  ref.invalidate(getFavoriteProvider);
  ref.invalidate(getUserInfoProvider);
  final productService = ProductService();
  final toyType = productService.getToyType();
  final popular = productService.getPopularProduct();
  await Future.wait([toyType, popular]);
});
