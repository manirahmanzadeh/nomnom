import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entity/food_entity.dart';
import '../../domain/usecase/get_all_food_usecase.dart';
import '../../domain/usecase/get_food_details_usecase.dart';
part '../event/food_event.dart';
part '../state/food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  final GetAllFoodUseCase getAllFoodUseCase;
  final GetFoodDetailsUseCase getFoodDetailsUseCase;

  FoodBloc({
    required this.getAllFoodUseCase,
    required this.getFoodDetailsUseCase,
  }) : super(FoodInitial());

  @override
  Stream<FoodState> add(
      FoodEvent event,
      ) async* {
    if (event is GetAllFoodEvent) {
      yield* _mapGetAllFoodEventToState();
    } else if (event is GetFoodDetailsEvent) {
      yield* _mapGetFoodDetailsEventToState(event.foodId);
    }
  }

  Stream<FoodState> _mapGetAllFoodEventToState() async* {
    yield FoodLoading();
    try {
      final foodList = await getAllFoodUseCase.execute();
      yield FoodLoadSuccess(foodList);
    } catch (e) {
      yield const FoodLoadFailure("Failed to fetch food items");
    }
  }

  Stream<FoodState> _mapGetFoodDetailsEventToState(int foodId) async* {
    yield FoodLoading();
    try {
      final foodDetails = await getFoodDetailsUseCase.execute(foodId);
      yield FoodDetailsLoadSuccess(foodDetails);
    } catch (e) {
      yield const FoodLoadFailure("Failed to fetch food details");
    }
  }
}
