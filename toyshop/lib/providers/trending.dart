import 'package:flutter/material.dart';
import 'package:toyshop/models/trending_model.dart';

class TrendingProvider extends ChangeNotifier {
  List<TrendingModel> trendingList = [
    TrendingModel(
        image: "lib/assets/icons/ninja1.svg",
        name: "Dark Blue Ninja",
        price: 1000),
    TrendingModel(
        image: "lib/assets/icons/ninja.svg", name: "Hero Go", price: 1000),
    TrendingModel(
        image: "lib/assets/icons/ninja.svg", name: "DarkKnight", price: 1200),
    TrendingModel(
        image: "lib/assets/icons/ninja.svg", name: "WebearBar", price: 110),
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
}
