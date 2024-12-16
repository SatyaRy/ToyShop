import 'package:flutter/material.dart';
import 'package:toyshop/models/foryou_model.dart';

class ForyouProvider extends ChangeNotifier {
  List<ForYouModel> foryouList = [
    ForYouModel(
        image: "lib/assets/icons/ninja1.svg",
        name: "ninja 1",
        star: 5,
        price: 100),
    ForYouModel(
        image: "lib/assets/icons/ninja1.svg",
        name: "ninja 1",
        star: 3,
        price: 100),
    ForYouModel(
        image: "lib/assets/icons/ninja1.svg",
        name: "ninja 1",
        star: 2,
        price: 100),
  ];
  List<ForYouModel> getForYouList() {
    return foryouList;
  }
}
