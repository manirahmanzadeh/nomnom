import 'package:flutter/material.dart';

import '../../domain/entity/food_entity.dart';

class FoodDetailsWidget extends StatelessWidget {
  final FoodEntity foodDetails;

  const FoodDetailsWidget({super.key, required this.foodDetails});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(foodDetails.imageUrl),
          const SizedBox(height: 16),
          Text(
            foodDetails.name,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            foodDetails.description,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text(
            '\$${foodDetails.price.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
