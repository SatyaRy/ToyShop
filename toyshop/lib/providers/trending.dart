import 'package:flutter/material.dart';
import 'package:toyshop/models/trending_model.dart';

class TrendingProvider extends ChangeNotifier {
  List<TrendingModel> trendingList = [
    TrendingModel(
        image: "lib/assets/icons/seaturtle.svg",
        name: "Sea Turtle",
        price: 0.95),
    TrendingModel(
        image: "lib/assets/icons/blackcat.svg", name: "Black Cat", price: 2.25),
    TrendingModel(
        image: "lib/assets/icons/unicorn.svg", name: "Unicorn", price: 1.5),
    TrendingModel(
        image: "lib/assets/icons/fuyucat.svg", name: "Fuyu Cat", price: 1.5),
  ];
  List<TrendingModel> favoriteList = [];
  List<TrendingModel> getTrendingList() {
    return trendingList;
  }

  List<TrendingModel> userFavorite() {
    return favoriteList;
  }

  void addFavorite(TrendingModel favorite) {
    favoriteList.add(favorite);
  }

  void removeCart(int index) {
    favoriteList.removeAt(index);
  }
}
