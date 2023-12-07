part of '../bloc/food_bloc.dart';

abstract class FoodEvent extends Equatable {
  const FoodEvent();

  @override
  List<Object?> get props => [];
}

class GetAllFoodEvent extends FoodEvent {}

class GetFoodDetailsEvent extends FoodEvent {
  final int foodId;

  const GetFoodDetailsEvent(this.foodId);

  @override
  List<Object?> get props => [foodId];
}
