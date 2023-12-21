import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:nomnom/src/screens/foods/components/most_popular_section.dart';
import 'package:nomnom/src/screens/foods/components/restaurants_section.dart';
import 'package:nomnom/src/screens/foods/components/search_bar.dart';

class FoodsScreen extends StatefulWidget {
  const FoodsScreen({super.key});

  @override
  State<FoodsScreen> createState() => _FoodsScreenState();
}

class _FoodsScreenState extends State<FoodsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF9F7),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top + 16,
          ),
          FadeInLeft(
            child: const AppSearchBar(),
          ),
          const SizedBox(
            height: 16,
          ),
          FadeInRight(
            child: const RestaurantsSection(),
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: FadeInUp(
              child: const MostPopularSection(),
            ),
          ),
        ],
      ),
    );
  }
}
