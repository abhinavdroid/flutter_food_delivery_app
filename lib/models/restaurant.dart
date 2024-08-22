import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_app/models/food.dart';

class Restaurant extends ChangeNotifier {
  final List<Food> _menu = [
    Food(
      name: "Veg Burger",
      description:
          "A delicious plant-based burger made with a variety of flavorful ingredients like beans, lentils, vegetables, and grains",
      imagePath: "lib/images/burgers/veg_burger.png",
      price: 50,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 20),
        Addon(name: "Extra Sauce", price: 10),
        Addon(name: "Extra Vegetables", price: 30),
      ],
    ),
    Food(
      name: "Veg Burger",
      description:
          "A delicious plant-based burger made with a variety of flavorful ingredients like beans, lentils, vegetables, and grains",
      imagePath: "lib/images/burgers/veg_burger.png",
      price: 50,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 20),
        Addon(name: "Extra Sauce", price: 10),
        Addon(name: "Extra Vegetables", price: 30),
      ],
    ),
    Food(
      name: "Veg Burger",
      description:
          "A delicious plant-based burger made with a variety of flavorful ingredients like beans, lentils, vegetables, and grains",
      imagePath: "lib/images/burgers/veg_burger.png",
      price: 50,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 20),
        Addon(name: "Extra Sauce", price: 10),
        Addon(name: "Extra Vegetables", price: 30),
      ],
    ),
  ];

  List<Food> get menu => _menu;
}
