import 'package:flutter/material.dart';

import '../components/add_to_bag_button.dart';

class ActionSection extends StatelessWidget {
  const ActionSection({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: color.withOpacity(0.3)),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.favorite_border,
              color: color,
            ),
          ),
        ),
        AddToBagButton(color: color),
      ],
    );
  }
}
