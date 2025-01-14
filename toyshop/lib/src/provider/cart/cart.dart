import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:toyshop/src/data/cart.dart";
import "package:toyshop/src/model/product/product.dart";
part "cart.g.dart";

//access to cart service
final cartServiceProvider = Provider<CartService>((ref) {
  return CartService();
});

@riverpod
Future<void> addToCart(Ref ref, CartModel cartDetail) async {
  return await CartService().addToCart(cartDetail);
}



final getCartItemsProvider = StreamProvider((ref) {
  final service = ref.watch(cartServiceProvider);
  return service.getCartItems();
});

typedef DeleteParameter = ({String cartID, dynamic cost});
final deleteCartProvider =
    FutureProvider.family<void, DeleteParameter>((ref, argument) {
  final service = ref.watch(cartServiceProvider);
  return service.deleteItem(argument.cartID, argument.cost);
});
