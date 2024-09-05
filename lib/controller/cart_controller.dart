import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_app/models/food.dart';

class Cart extends ChangeNotifier {
  final List<Food> _cartItems = [];
  final StreamController<List<Food>> _cartController =
      StreamController<List<Food>>.broadcast();

  Cart() {
    _cartController.add(_cartItems);
  }

  Stream<List<Food>> get cartStream => _cartController.stream;

  void addToCart(Food food) {
    _cartItems.add(food);
    _cartController.sink.add(List.from(_cartItems));
    notifyListeners();
  }

  void removeFromCart(Food food) {
    _cartItems.remove(food);
    _cartController.sink.add(List.from(_cartItems));
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    _cartController.sink.add(List.from(_cartItems));
    notifyListeners();
  }

  @override
  void dispose() {
    _cartController.close();
    super.dispose();
  }
}
