import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/di/di.dart';
import 'config/routes/app_routes.dart';
import 'presentation/bloc/food_bloc.dart';
import 'presentation/page/food_details_page.dart';
import 'presentation/page/food_list_page.dart';


class NomNomApp extends StatelessWidget {
  const NomNomApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Set up dependency injection
    setupDependencyInjection();

    return BlocProvider(
      create: (context) => di<FoodBloc>(),
      child: MaterialApp(
        title: 'NomNom Food App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: AppRoutes.foodList,
        routes: {
          AppRoutes.foodList: (context) => const FoodListPage(),
          AppRoutes.foodDetails: (context) => const FoodDetailsPage(foodId: 0),
        },
      ),
    );
  }
}
