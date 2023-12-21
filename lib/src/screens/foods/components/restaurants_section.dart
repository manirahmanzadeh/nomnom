import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nomnom/mock_data.dart';

class RestaurantsSection extends StatefulWidget {
  const RestaurantsSection({super.key});

  @override
  State<RestaurantsSection> createState() => _RestaurantsSectionState();
}

class _RestaurantsSectionState extends State<RestaurantsSection> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Restaurants',
            style: TextStyle(
              color: Color(0xFF4F4D4E),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).width / 5 - 10,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: categories
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsetsDirectional.only(end: 16),
                      child: InkWell(
                        onTap: () => changeIndex(categories.indexOf(e)),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width / 5,
                          decoration: BoxDecoration(
                            color: categories.indexOf(e) == _index ? const Color(0xFFFF8E20) : Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.01),
                                spreadRadius: 2,
                                blurRadius: 4,
                              )
                            ],
                          ),
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  e.icon,
                                  color: categories.indexOf(e) == _index ? Colors.white : const Color(0xFFA5A3A4),
                                  height: 32,
                                ),
                                if (categories.indexOf(e) == _index)
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        e.title,
                                        style: const TextStyle(
                                          fontSize: 10,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  changeIndex(int index) {
    setState(() {
      _index = index;
    });
  }
}
