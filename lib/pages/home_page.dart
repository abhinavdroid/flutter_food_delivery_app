import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_app/components/my_current_location.dart';
import 'package:flutter_food_delivery_app/components/my_description_box.dart';
import 'package:flutter_food_delivery_app/components/my_drawer.dart';
import 'package:flutter_food_delivery_app/components/my_food_tile.dart';
import 'package:flutter_food_delivery_app/components/my_sliver_app_bar.dart';
import 'package:flutter_food_delivery_app/components/my_tab_bar.dart';
import 'package:flutter_food_delivery_app/models/food.dart';
import 'package:flutter_food_delivery_app/models/restaurant.dart';
import 'package:flutter_food_delivery_app/pages/cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late Restaurant _restaurant;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: FoodCategory.values.length, vsync: this);
    _restaurant = Restaurant();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _restaurant.dispose();
    super.dispose();
  }

  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);

      return ListView.builder(
        itemCount: categoryMenu.length,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return MyFoodTile(food: categoryMenu[index]);
        },
      );
    }).toList();
  }

  void _navigateToCartPage() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => CartPage()),
    );
  }

  Stream<List<Food>> get menuStream async* {
    await Future.delayed(const Duration(seconds: 3));
    yield _restaurant.menu;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
            title: MyTabBar(
              tabController: _tabController,
            ),
            onCartButtonPressed: _navigateToCartPage,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(
                  indent: 25,
                  endIndent: 25,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                const MyCurrentLoaction(),
                const MyDescriptionBox(),
              ],
            ),
          ),
        ],
        body: StreamBuilder<List<Food>>(
          stream: menuStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No food items available.'));
            }
            return TabBarView(
              controller: _tabController,
              children: getFoodInThisCategory(snapshot.data!),
            );
          },
        ),
      ),
    );
  }
}
