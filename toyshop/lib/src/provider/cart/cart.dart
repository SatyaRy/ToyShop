
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:toyshop/src/data/cart.dart";
import "package:toyshop/src/model/product/product.dart";
part "cart.g.dart";

@riverpod
Future<void> addToCart(
    Ref ref, CartModel cartDetail, String productID, int quantity) async {
  await CartService().addToCart(cartDetail, productID, quantity);
}

@riverpod
Stream<List<CartModel>> getCartItems(ref) {
  return CartService().getCartItems();
}

@riverpod
Future<void> deleteCart(Ref ref, String cartID, dynamic cost) async {
  await CartService().deleteItem(cartID, cost);
}

//access to cart service
final cartServiceProvider = Provider<CartService>((ref) {
  return CartService();
});
