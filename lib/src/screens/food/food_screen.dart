import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:nomnom/src/models/food_model.dart';
import 'package:nomnom/src/screens/food/components/bg_container.dart';
import 'package:nomnom/src/screens/food/components/food_image.dart';

import 'components/info_panel/info_panel.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({
    super.key,
    required this.food,
    required this.color,
  });

  final FoodModel food;
  final Color color;

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> with SingleTickerProviderStateMixin {
  late final AnimationController turningAnimationController;

  bool animatePanel = false;

  @override
  void initState() {
    turningAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    );

    turningAnimationController.forward();

    turningAnimationController.addStatusListener(
      (status) {
        switch (status) {
          case AnimationStatus.dismissed:
          case AnimationStatus.forward:
          case AnimationStatus.reverse:
          case AnimationStatus.completed:
            turningAnimationController.repeat();
        }
      },
    );

    animatePanel = true;
    super.initState();
  }

  @override
  void dispose() {
    turningAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          BGContainer(
            color: widget.color,
            foodHashCode: widget.food.hashCode,
          ),
          FoodImage(
            imageUrl: widget.food.plateImageUrl,
            turningAnimationController: turningAnimationController,
            foodHashCode: widget.food.hashCode,
          ),
          ListView(
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 2,
              ),
              FadeInUpBig(
                duration: const Duration(milliseconds: 500),
                animate: animatePanel,
                child: InfoPanel(
                  food: widget.food,
                  color: widget.color,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
