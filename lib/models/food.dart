enum FoodCategory { burgers, pizzas, desserts, drinks }

class Food {
  final String name;
  final String description;
  final String imagePath;
  final double price;
  final FoodCategory category;
  final List<Addon> availableAddons;

  Food({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.category,
    required this.availableAddons,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'imagePath': imagePath,
      'price': price,
      'category': category.index,
      'availableAddons': availableAddons.map((addon) => addon.toMap()).toList(),
    };
  }

  static Food fromMap(Map<String, dynamic> map) {
    return Food(
      name: map['name'],
      description: map['description'],
      imagePath: map['imagePath'],
      price: map['price'],
      category: FoodCategory.values[map['category']],
      availableAddons: List<Addon>.from(
        (map['availableAddons'] as List)
            .map((addonMap) => Addon.fromMap(addonMap)),
      ),
    );
  }
}

class Addon {
  final String name;
  final double price;

  Addon({
    required this.name,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
    };
  }

  static Addon fromMap(Map<String, dynamic> map) {
    return Addon(
      name: map['name'],
      price: map['price'],
    );
  }
}
