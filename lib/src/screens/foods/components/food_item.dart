import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nomnom/src/models/food_model.dart';
import 'package:nomnom/src/screens/food/food_screen.dart';

class FoodItem extends StatefulWidget {
  const FoodItem({
    super.key,
    required this.food,
    required this.color,
    required this.centerness,
  });

  final FoodModel food;
  final double centerness;
  final Color color;

  @override
  State<FoodItem> createState() => _FoodItemState();
}

class _FoodItemState extends State<FoodItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: goToFoodScreen,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Hero(
            tag: 'container_${widget.food.hashCode}',
            child: Container(
              width: MediaQuery.sizeOf(context).width / 2.1,
              height: double.maxFinite,
              margin: EdgeInsets.only(top: (MediaQuery.sizeOf(context).width / 2) / 2),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: widget.color,
                borderRadius: BorderRadius.circular(32),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            width: MediaQuery.sizeOf(context).width / 2.1,
            height: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Hero(
                    tag: 'plate_${widget.food.hashCode}',
                    child: Transform.rotate(
                      angle: widget.centerness * pi / 3,
                      child: Transform.scale(
                        scale: 0.7 + (widget.centerness * 0.3),
                        child: Image.asset(
                          widget.food.plateImageUrl,
                          width: MediaQuery.sizeOf(context).width / 2 - 50,
                          height: MediaQuery.sizeOf(context).width / 2 - 50,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                RatingBar.builder(
                  initialRating: widget.food.rate,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  ignoreGestures: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.only(right: 2.0),
                  itemSize: 10,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.white,
                  ),
                  onRatingUpdate: (rating) {},
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  widget.food.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: widget.centerness * 60,
                  child: Text(
                    widget.food.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Text(
                  '\$${widget.food.price}',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.add_shopping_cart,
                          color: Color(0xFF4A7E83),
                          size: 16,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'Add to bag',
                          style: TextStyle(
                            color: Color(0xFF4A7E83),
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void goToFoodScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => FoodScreen(
          food: widget.food,
          color: widget.color,
        ),
      ),
    );
  }
}
