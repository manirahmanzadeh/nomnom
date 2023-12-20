import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nomnom/src/models/food_model.dart';

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

  int quantity = 0;

  @override
  void initState() {
    turningAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    );
    turningAnimationController.forward();
    turningAnimationController.addStatusListener((status) {
      switch (status) {
        case AnimationStatus.dismissed:
        case AnimationStatus.forward:
        case AnimationStatus.reverse:
        case AnimationStatus.completed:
          turningAnimationController.repeat();
      }
    });
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
          Hero(
            tag: 'container_${widget.food.hashCode}',
            child: Transform.rotate(
              angle: 0,
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: widget.color,
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 32),
            child: AnimatedBuilder(
              animation: CurvedAnimation(parent: turningAnimationController, curve: Curves.easeInOut),
              builder: (_, __) => Hero(
                tag: 'plate_${widget.food.hashCode}',
                child: Transform.rotate(
                  angle: CurvedAnimation(parent: turningAnimationController, curve: Curves.easeInOut).value * 2 * pi + pi / 3,
                  child: Transform.scale(
                    scale: 1,
                    child: Image.asset(
                      widget.food.plateImageUrl,
                      width: MediaQuery.sizeOf(context).width - 32,
                      height: MediaQuery.sizeOf(context).width - 32,
                    ),
                  ),
                ),
              ),
            ),
          ),
          ListView(
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 2,
              ),
              FadeInUpBig(
                duration: const Duration(milliseconds: 500),
                animate: animatePanel,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.food.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
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
                        initialRating: widget.food.rate,
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
                          Container(
                            decoration: BoxDecoration(
                              color: widget.color,
                              borderRadius: BorderRadius.circular(32),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                InkWell(
                                  onTap: decreaseQuantity,
                                  child: const Padding(
                                    padding: EdgeInsets.only(
                                      right: 16,
                                      left: 0,
                                      top: 4,
                                      bottom: 4,
                                    ),
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                      size: 10,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  quantity.toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                InkWell(
                                  onTap: increaseQuantity,
                                  child: const Padding(
                                    padding: EdgeInsets.only(
                                      right: 0,
                                      left: 16,
                                      top: 4,
                                      bottom: 4,
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 10,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            '\$${widget.food.price}',
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
                      const SizedBox(
                        height: 32,
                      ),
                      const Text(
                        'About this food',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        widget.food.description,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                              child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(border: Border.all(color: widget.color.withOpacity(0.3)), shape: BoxShape.circle),
                            child: Icon(
                              Icons.favorite_border,
                              color: widget.color,
                            ),
                          )),
                          Container(
                            decoration: BoxDecoration(color: widget.color, borderRadius: BorderRadius.circular(32)),
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.add_shopping_cart,
                                  color: Colors.white,
                                  size: 16,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  'Add to bug',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void increaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decreaseQuantity() {
    setState(() {
      if (quantity > 0) {
        quantity--;
      }
    });
  }
}
