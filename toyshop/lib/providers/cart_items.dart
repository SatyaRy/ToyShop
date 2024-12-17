import 'package:flutter/material.dart';

class CartItemProvider extends ChangeNotifier {
  List<dynamic> cartItem = [];
  dynamic itemCost = 0;
  void addToCart(dynamic item) {
    cartItem.add(item);
    totalCost(cartItem);
  }

  void removeCart(int index) {
    cartItem.removeAt(index);
    totalCost(cartItem);
  }

  dynamic totalCost(List<dynamic> item) {
    if (item.isEmpty) {
      itemCost = 0;
      return itemCost;
    }
    itemCost = item.reduce((value, element) => value + element);
    return itemCost;
  }
}
