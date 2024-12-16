import 'package:flutter/material.dart';

class CartItemProvider extends ChangeNotifier {
  List<int> cartItem = [];
  int itemCost = 0;
  void addToCart(int item) {
    cartItem.add(item);
    totalCost(cartItem);
  }
  int totalCost(List<int> item) {
    itemCost = item.reduce((value, element) => value + element);
    return itemCost;
  }
}
