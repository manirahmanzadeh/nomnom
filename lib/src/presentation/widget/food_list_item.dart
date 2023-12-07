import 'package:flutter/material.dart';

import '../../domain/entity/food_entity.dart';
import '../page/food_details_page.dart';

class FoodListItem extends StatelessWidget {
  final FoodEntity foodItem;

  const FoodListItem({super.key, required this.foodItem});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(foodItem.name),
      subtitle: Text('\$${foodItem.price.toStringAsFixed(2)}'),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(foodItem.imageUrl),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FoodDetailsPage(foodId: foodItem.id),
          ),
        );
      },
    );
  }
}
