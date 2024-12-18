import 'package:flutter/material.dart';
import 'package:toyshop/presentation/models/trending_model.dart';

class TrendingProvider extends ChangeNotifier {
  List<TrendingModel> trendingList = [
    TrendingModel(
        id: 1,
        quantity: 1,
        image: "lib/presentation/assets/icons/seaturtle.svg",
        name: "Sea Turtle",
        price: 0.95),
    TrendingModel(
        id: 2,
        quantity: 1,
        image: "lib/presentation/assets/icons/blackcat.svg",
        name: "Black Cat",
        price: 2.25),
    TrendingModel(
        id: 3,
        quantity: 1,
        image: "lib/presentation/assets/icons/unicorn.svg",
        name: "Unicorn",
        price: 1.5),
    TrendingModel(
        id: 4,
        quantity: 1,
        image: "lib/presentation/assets/icons/fuyucat.svg",
        name: "Fuyu Cat",
        price: 1.5),
  ];
  List<TrendingModel> favoriteList = [];
  List<TrendingModel> getTrendingList() {
    return trendingList;
  }

  List<TrendingModel> userFavorite() {
    return favoriteList;
  }

  void addFavorite(TrendingModel favorite, dynamic index) {
    favoriteList.add(favorite);
    removeDuplicated();
  }

  void removeCart(dynamic index) {
    favoriteList.removeAt(index);
  }

  void removeDuplicated() {
    final ids = favoriteList.map((value) => value.id).toSet();
    favoriteList.retainWhere((value) => ids.remove(value.id));
  }
}
