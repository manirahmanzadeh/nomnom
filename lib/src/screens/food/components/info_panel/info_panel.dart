import 'package:flutter/material.dart';
import 'package:nomnom/src/models/food_model.dart';
import 'package:nomnom/src/screens/food/components/info_panel/sections/description_section.dart';
import 'package:nomnom/src/screens/food/components/info_panel/sections/main_info_section.dart';

import 'sections/action_section.dart';

class InfoPanel extends StatelessWidget {
  const InfoPanel({
    super.key,
    required this.food,
    required this.color,
  });

  final FoodModel food;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 16,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainInfoSection(
            food: food,
            color: color,
          ),
          const SizedBox(
            height: 32,
          ),
          DescriptionSection(
            description: food.description,
          ),
          const SizedBox(
            height: 32,
          ),
          ActionSection(
            color: color,
          ),
        ],
      ),
    );
  }
}
