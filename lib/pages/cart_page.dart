import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_app/controller/cart_controller.dart';
import 'package:flutter_food_delivery_app/models/food.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Consumer<Cart>(
        builder: (context, cart, child) {
          return StreamBuilder<List<Food>>(
            stream: cart.cartStream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('Your cart is empty.'));
              }
              final cartItems = snapshot.data!;
              return ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final food = cartItems[index];
                  return ListTile(
                    leading: Image.asset(
                      food.imagePath,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(food.name),
                    subtitle: Text('\$${food.price.toStringAsFixed(2)}'),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
