import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toyshop/src/data/favorite.dart';
import 'package:toyshop/src/model/product/product.dart';

final favoriteService = Provider((ref) {
  return FavoriteService();
});


//create
typedef FavoriteParameter = ({String productID, FavoriteModel model});
final addToFavoriteProvider =
    FutureProvider.family<void, FavoriteParameter>((ref, arguments) async {
  final service = ref.watch(favoriteService);
  await service.addFavoriteProduct(arguments.productID, arguments.model);
});

//read
final getFavoriteProvider = StreamProvider<List<FavoriteModel>>((ref) {
  final service = ref.watch(favoriteService);
  return service.getFavoriteProduct();
});

//delete
final deleteFavoriteProvider =
    FutureProvider.family<void, String>((ref, productID) {
  final service = ref.watch(favoriteService);
  return service.deleteFromFavorite(productID);
});
