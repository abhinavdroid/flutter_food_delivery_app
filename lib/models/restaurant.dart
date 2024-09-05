import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_app/database/database_service.dart';
import 'package:flutter_food_delivery_app/models/food.dart';

class Restaurant extends ChangeNotifier {
  final List<Food> _menu = [
    // Burgers
    Food(
      name: "Veg Burger",
      description:
          "A delicious plant-based burger made with a variety of flavorful ingredients like beans, lentils, vegetables, and grains.",
      imagePath: "lib/images/veg_burger.png",
      price: 50,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 20),
        Addon(name: "Extra Sauce", price: 10),
        Addon(name: "Extra Vegetables", price: 30),
      ],
    ),
    Food(
      name: "Cheese Burger",
      description:
          "A classic burger topped with a generous layer of melted cheese.",
      imagePath: "lib/images/veg_burger.png",
      price: 60,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Patty", price: 40),
        Addon(name: "Bacon", price: 30),
      ],
    ),
    Food(
      name: "Spicy Veg Burger",
      description:
          "A burger with a spicy kick, loaded with jalapeños and a spicy sauce.",
      imagePath: "lib/images/veg_burger.png",
      price: 55,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Jalapeños", price: 15),
        Addon(name: "Spicy Sauce", price: 10),
      ],
    ),
    Food(
      name: "Mushroom Burger",
      description: "A savory burger topped with sautéed mushrooms and onions.",
      imagePath: "lib/images/veg_burger.png",
      price: 65,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Mushrooms", price: 25),
        Addon(name: "Onion Rings", price: 20),
      ],
    ),
    Food(
      name: "BBQ Veg Burger",
      description:
          "A smoky BBQ-flavored burger with caramelized onions and crispy lettuce.",
      imagePath: "lib/images/veg_burger.png",
      price: 70,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra BBQ Sauce", price: 15),
        Addon(name: "Grilled Onions", price: 20),
      ],
    ),

    // Pizzas
    Food(
      name: "Margherita Pizza",
      description:
          "A simple yet delicious pizza topped with fresh tomatoes, mozzarella, and basil.",
      imagePath: "lib/images/pizza.png",
      price: 100,
      category: FoodCategory.pizzas,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 30),
        Addon(name: "Basil", price: 15),
      ],
    ),
    Food(
      name: "Veggie Pizza",
      description:
          "A pizza loaded with a variety of fresh vegetables and mozzarella cheese.",
      imagePath: "lib/images/pizza.png",
      price: 120,
      category: FoodCategory.pizzas,
      availableAddons: [
        Addon(name: "Extra Veggies", price: 25),
        Addon(name: "Olives", price: 20),
      ],
    ),
    Food(
      name: "BBQ Paneer Pizza",
      description:
          "A delicious BBQ-flavored pizza topped with paneer and onions.",
      imagePath: "lib/images/pizza.png",
      price: 140,
      category: FoodCategory.pizzas,
      availableAddons: [
        Addon(name: "Extra Paneer", price: 35),
        Addon(name: "BBQ Sauce", price: 20),
      ],
    ),
    Food(
      name: "Mushroom Pizza",
      description:
          "A pizza topped with sautéed mushrooms, mozzarella, and garlic.",
      imagePath: "lib/images/pizza.png",
      price: 130,
      category: FoodCategory.pizzas,
      availableAddons: [
        Addon(name: "Extra Mushrooms", price: 30),
        Addon(name: "Garlic", price: 15),
      ],
    ),
    Food(
      name: "Spicy Veggie Pizza",
      description:
          "A pizza with a spicy sauce, topped with jalapeños, onions, and peppers.",
      imagePath: "lib/images/pizza.png",
      price: 125,
      category: FoodCategory.pizzas,
      availableAddons: [
        Addon(name: "Extra Jalapeños", price: 20),
        Addon(name: "Spicy Sauce", price: 15),
      ],
    ),

    // Desserts
    Food(
      name: "Chocolate Cake",
      description:
          "A rich and moist chocolate cake topped with creamy chocolate frosting.",
      imagePath: "lib/images/deserts.png",
      price: 80,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra Frosting", price: 20),
        Addon(name: "Chocolate Chips", price: 15),
      ],
    ),
    Food(
      name: "Vanilla Ice Cream",
      description:
          "Classic vanilla ice cream with a smooth and creamy texture.",
      imagePath: "lib/images/deserts.png",
      price: 60,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Chocolate Syrup", price: 10),
        Addon(name: "Sprinkles", price: 10),
      ],
    ),
    Food(
      name: "Apple Pie",
      description:
          "A traditional apple pie with a flaky crust and cinnamon-spiced apple filling.",
      imagePath: "lib/images/deserts.png",
      price: 70,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Whipped Cream", price: 15),
        Addon(name: "Vanilla Ice Cream", price: 20),
      ],
    ),
    Food(
      name: "Brownie",
      description: "A fudgy brownie with a rich chocolate flavor.",
      imagePath: "lib/images/deserts.png",
      price: 65,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Walnuts", price: 20),
        Addon(name: "Ice Cream", price: 25),
      ],
    ),
    Food(
      name: "Cheesecake",
      description:
          "A creamy cheesecake with a graham cracker crust and a hint of lemon.",
      imagePath: "lib/images/deserts.png",
      price: 90,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Berry Sauce", price: 15),
        Addon(name: "Whipped Cream", price: 10),
      ],
    ),

    // Drinks
    Food(
      name: "Coca-Cola",
      description: "A refreshing carbonated soft drink.",
      imagePath: "lib/images/cold_drink.png",
      price: 30,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Extra Ice", price: 5),
        Addon(name: "Lemon Slice", price: 5),
      ],
    ),
    Food(
      name: "Lemonade",
      description: "A cool and refreshing lemonade made with fresh lemons.",
      imagePath: "lib/images/cold_drink.png",
      price: 40,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Mint Leaves", price: 10),
        Addon(name: "Sugar", price: 5),
      ],
    ),
    Food(
      name: "Iced Tea",
      description: "A chilled tea with a hint of lemon.",
      imagePath: "lib/images/cold_drink.png",
      price: 35,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Lemon Slice", price: 5),
        Addon(name: "Honey", price: 10),
      ],
    ),
    Food(
      name: "Orange Juice",
      description: "Freshly squeezed orange juice with pulp.",
      imagePath: "lib/images/cold_drink.png",
      price: 50,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Extra Pulp", price: 10),
        Addon(name: "Mint Leaves", price: 5),
      ],
    ),
    Food(
      name: "Coffee",
      description: "A strong and aromatic brewed coffee.",
      imagePath: "lib/images/cold_drink.png",
      price: 45,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Extra Shot", price: 15),
        Addon(name: "Milk", price: 10),
      ],
    ),
  ];

  final _menuController = StreamController<List<Food>>.broadcast();
  final DatabaseService _dbService = DatabaseService();

  Stream<List<Food>> get menuStream => _menuController.stream;

  List<Food> get menu => _menu;

  Restaurant() {
    _initMenu();
  }

  Future<void> _initMenu() async {
    await _dbService.init();
    final fetchedMenu = await _dbService.getMenu();
    _menu.addAll(fetchedMenu);
    _menuController.sink.add(_menu);
    notifyListeners();
  }

  Future<void> addFood(Food food) async {
    await _dbService.addFood(food);
    _menu.add(food);
    _menuController.sink.add(_menu);
    notifyListeners();
  }

  Future<void> clearMenu() async {
    await _dbService.clearMenu();
    _menu.clear();
    _menuController.sink.add(_menu);
    notifyListeners();
  }

  @override
  void dispose() {
    _menuController.close();
    super.dispose();
  }
}
