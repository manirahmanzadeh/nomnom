import 'package:flutter/material.dart';

class BGContainer extends StatelessWidget {
  const BGContainer({
    super.key,
    required this.color,
    required this.foodHashCode,
  });

  final Color color;
  final int foodHashCode;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'container_$foodHashCode',
      child: Transform.rotate(
        angle: 0,
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(0),
          ),
        ),
      ),
    );
  }
}
