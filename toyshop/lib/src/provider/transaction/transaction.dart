import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toyshop/src/data/transaction.dart';
import 'package:toyshop/src/model/transaction/transaction.dart';

//watch transactionService or repo
final transactionServiceProvider = Provider<TransactionService>((ref) {
  return TransactionService();
});

final cartStreamProvider = StreamProvider<List<double>>((ref) {
  final service = ref.watch(transactionServiceProvider);
  return service.getTransaction();
});

final totalProvider = Provider<double>((ref) {
  final cart = ref.watch(cartStreamProvider).value ?? [];
  final service = ref.watch(transactionServiceProvider);
  return service.calculateTotal(cart);
});

final reCalculate =
  FutureProvider.family<void, ProductParams>((ref, params) async {
  final service = ref.watch(transactionServiceProvider);
  await service.createTransaction(params.price, params.productID);
});
final deleteOnDecrement =
  FutureProvider.family<void, String>((ref, productID) async {
  final service = ref.watch(transactionServiceProvider);
  await service.deleteSpecific(productID);
});

//class paramater
class ProductParams {
  final String productID;
  final dynamic price;
  ProductParams(this.productID, this.price);
}
