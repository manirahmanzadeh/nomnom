part of '../bloc/food_bloc.dart';

abstract class FoodState extends Equatable {
  const FoodState();

  @override
  List<Object?> get props => [];
}

class FoodInitial extends FoodState {}

class FoodLoading extends FoodState {}

class FoodLoadSuccess extends FoodState {
  final List<FoodEntity> foodList;

  const FoodLoadSuccess(this.foodList);

  @override
  List<Object?> get props => [foodList];
}

class FoodDetailsLoadSuccess extends FoodState {
  final FoodEntity foodDetails;

  const FoodDetailsLoadSuccess(this.foodDetails);

  @override
  List<Object?> get props => [foodDetails];
}

class FoodLoadFailure extends FoodState {
  final String errorMessage;

  const FoodLoadFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
