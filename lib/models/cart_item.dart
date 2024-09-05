import 'package:flutter_food_delivery_app/models/food.dart';

class CartItem {
  final Food food;
  final List<bool> selectedAddons;

  CartItem({
    required this.food,
    required this.selectedAddons,
  });

  double get totalPrice {
    double addonsPrice = 0.0;
    for (int i = 0; i < selectedAddons.length; i++) {
      if (selectedAddons[i]) {
        addonsPrice += food.availableAddons[i].price;
      }
    }
    return food.price + addonsPrice;
  }
}
