import 'dart:math';

import 'package:flutter/material.dart';

class FoodImage extends StatelessWidget {
  const FoodImage({
    super.key,
    required this.imageUrl,
    required this.turningAnimationController,
    required this.foodHashCode,
  });

  final String imageUrl;
  final AnimationController turningAnimationController;
  final int foodHashCode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 32,
      ),
      child: AnimatedBuilder(
        animation: CurvedAnimation(
          parent: turningAnimationController,
          curve: Curves.easeInOut,
        ),
        builder: (_, __) => Hero(
          tag: 'plate_$foodHashCode',
          child: Transform.rotate(
            angle: CurvedAnimation(
                      parent: turningAnimationController,
                      curve: Curves.easeInOut,
                    ).value *
                    2 *
                    pi +
                pi / 3,
            child: Transform.scale(
              scale: 1,
              child: Image.asset(
                imageUrl,
                width: MediaQuery.sizeOf(context).width - 32,
                height: MediaQuery.sizeOf(context).width - 32,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
