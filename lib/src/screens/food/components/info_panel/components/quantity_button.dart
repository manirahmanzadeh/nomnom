import 'package:flutter/material.dart';

class QuantityButton extends StatefulWidget {
  const QuantityButton({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  State<QuantityButton> createState() => _QuantityButtonState();
}

class _QuantityButtonState extends State<QuantityButton> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(32),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
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
