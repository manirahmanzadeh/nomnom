import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nomnom/src/models/food_model.dart';

import '../components/quantity_button.dart';

class MainInfoSection extends StatelessWidget {
  const MainInfoSection({
    super.key,
    required this.food,
    required this.color,
  });

  final FoodModel food;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          food.title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        RatingBar.builder(
          initialRating: food.rate,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          ignoreGestures: true,
          itemCount: 5,
          itemPadding: const EdgeInsets.only(right: 2.0),
          itemSize: 14,
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.black,
          ),
          onRatingUpdate: (rating) {},
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            QuantityButton(color: color),
            Text(
              '\$${food.price}',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
