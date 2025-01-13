import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toyshop/src/data/transaction.dart';

//watch transactionService or repo
final transactionServiceProvider = Provider<TransactionService>((ref) {
  return TransactionService();
});

//stream item in cart
final cartStreamProvider = StreamProvider<List<double>>((ref) {
  final service = ref.watch(transactionServiceProvider);
  return service.getTransaction();
});

//calculate total cost
final totalProvider = Provider<double>((ref) {
  final cart = ref.watch(cartStreamProvider).value ?? [];
  final service = ref.watch(transactionServiceProvider);
  return service.calculateTotal(cart);
});

//calculate again when item decrement or increment
final reCalculate =
    FutureProvider.family<void, ProductParams>((ref, params) async {
  final service = ref.watch(transactionServiceProvider);
  await service.createTransaction(params.price, params.productID);
});

//delete item from cart in firebase
typedef DecrementParameter = ({String productID, int productQuantity});
final deleteOnDecrement =
    FutureProvider.family<void, DecrementParameter>((ref, argument) async {
  final service = ref.watch(transactionServiceProvider);
  await service.deleteSpecific(
    argument.productID,argument.productQuantity
  );
});

//calculate the quantity
final quantityProvider = StreamProvider((ref) {
  final service = ref.watch(transactionServiceProvider);
  return service.getQuantity();
});
final getQuantityProvider = Provider((ref) {
  final service = ref.watch(transactionServiceProvider);
  final quantityList = ref.watch(quantityProvider).value ?? [];
  return service.calculateQuanity(quantityList);
});

//class paramater
class ProductParams {
  final String productID;
  final dynamic price;
  ProductParams(this.productID, this.price);
}
