import 'package:flutter/material.dart';
import 'package:nomnom/src/models/food_model.dart';
import 'package:nomnom/src/screens/foods/components/food_item.dart';

class MostPopularSection extends StatefulWidget {
  const MostPopularSection({super.key});

  @override
  State<MostPopularSection> createState() => _MostPopularSectionState();
}

class _MostPopularSectionState extends State<MostPopularSection> {
  List<FoodModel> foods = [
    const FoodModel(
      plateImageUrl: 'assets/foods/1.png',
      title: 'Garlic Aioli Chicken Wings + Glazed Yams',
      description: 'Savor the perfect blend of savory and sweet with Garlic Aioli Chicken Wings and Glazed Yams',
      price: 12.99,
      rate: 4.5,
    ),
    const FoodModel(
      plateImageUrl: 'assets/foods/1.png',
      title: 'Garlic Aioli Chicken Wings + Glazed Yams',
      description: 'Savor the perfect blend of savory and sweet with Garlic Aioli Chicken Wings and Glazed Yams',
      price: 12.99,
      rate: 4.5,
    ),
    const FoodModel(
      plateImageUrl: 'assets/foods/1.png',
      title: 'Garlic Aioli Chicken Wings + Glazed Yams',
      description: 'Savor the perfect blend of savory and sweet with Garlic Aioli Chicken Wings and Glazed Yams',
      price: 12.99,
      rate: 4.5,
    ),
  ];

  late final PageController controller;

  @override
  void initState() {
    controller = PageController(
      initialPage: foods.length ~/ 2,
      viewportFraction: 0.6,
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Most',
                style: TextStyle(
                  color: Color(0xFF4F4D4E),
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Text(
                'Popular Food',
                style: TextStyle(
                  color: Color(0xFF4F4D4E),
                  fontSize: 32,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        _buildItems(context),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }

  _buildItems(BuildContext context) {
    return Expanded(
      child: PageView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        children: foods
            .map(
              (food) => FoodItem(
                food: food,
              ),
            )
            .toList(),
      ),
    );
  }
}