import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/food_bloc.dart';
import '../widget/food_list_item.dart';

class FoodListPage extends StatelessWidget {
  const FoodListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food List'),
      ),
      body: BlocBuilder<FoodBloc, FoodState>(
        builder: (context, state) {
          if (state is FoodLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is FoodLoadSuccess) {
            return ListView.builder(
              itemCount: state.foodList.length,
              itemBuilder: (context, index) {
                final foodItem = state.foodList[index];
                return FoodListItem(foodItem: foodItem);
              },
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
