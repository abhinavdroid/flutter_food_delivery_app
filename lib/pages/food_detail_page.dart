import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_app/controller/cart_controller.dart';
import 'package:flutter_food_delivery_app/models/food.dart';
import 'package:provider/provider.dart';

class FoodDetailPage extends StatefulWidget {
  final Food food;

  const FoodDetailPage({super.key, required this.food});

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  late List<bool> _selectedAddons;

  @override
  void initState() {
    super.initState();
    _selectedAddons = List.filled(widget.food.availableAddons.length, false);
  }

  void _toggleAddon(int index) {
    setState(() {
      _selectedAddons[index] = !_selectedAddons[index];
    });
  }

  void _addToCart() {
    final cart = Provider.of<Cart>(context, listen: false);
    cart.addToCart(widget.food);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${widget.food.name} added to cart')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.food.name),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                widget.food.imagePath,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              widget.food.name,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8.0),
            Text(
              '\$${widget.food.price.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8.0),
            Text(
              widget.food.description,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 16,
                  ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Add-ons',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8.0),
            Expanded(
              child: ListView.builder(
                itemCount: widget.food.availableAddons.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    title: Text(widget.food.availableAddons[index].name),
                    subtitle: Text(
                        '\$${widget.food.availableAddons[index].price.toStringAsFixed(2)}'),
                    value: _selectedAddons[index],
                    onChanged: (bool? value) {
                      _toggleAddon(index);
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _addToCart,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.brown[800],
                  backgroundColor: Colors.orangeAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child:
                    const Text('Add to cart', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
