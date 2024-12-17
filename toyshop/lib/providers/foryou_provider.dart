import 'package:flutter/material.dart';
import 'package:toyshop/models/foryou_model.dart';

class ForyouProvider extends ChangeNotifier {
  List<ForYouModel> foryouList = [
    ForYouModel(
        image: "lib/assets/icons/crocodile.svg",
        name: "Crocodile",
        star: 5,
        price: 1.99),
    ForYouModel(
        image: "lib/assets/icons/mush.svg",
        name: "The Must",
        star: 3,
        price: 1.99),
    ForYouModel(
        image: "lib/assets/icons/fatcow.svg",
        name: "Fat Cow",
        star: 2,
        price: 1.99),
  ];
  List<ForYouModel> getForYouList() {
    return foryouList;
  }
}
