import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/food_bloc.dart';

class FoodDetailsPage extends StatelessWidget {
  final int foodId;

  const FoodDetailsPage({super.key, required this.foodId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Details'),
      ),
      body: BlocBuilder<FoodBloc, FoodState>(
        builder: (context, state) {
          if (state is FoodLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is FoodDetailsLoadSuccess) {
            final foodDetails = state.foodDetails;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(foodDetails.imageUrl),
                  const SizedBox(height: 16),
                  Text(
                    foodDetails.name,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    foodDetails.description,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '\$${foodDetails.price.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            );
          } else if (state is FoodLoadFailure) {
            return Center(
              child: Text('Error: ${state.errorMessage}'),
            );
          } else {
            return Container(); // Placeholder for other states
          }
        },
      ),
    );
  }
}
