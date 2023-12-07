
import '../models/food_model.dart';

abstract class LocalFoodDataSource {
  Future<List<FoodModel>> getCachedFood();
  Future<void> cacheFood(List<FoodModel> foodList);
  Future<FoodModel> getCachedFoodDetails(int foodId);
  Future<void> cacheFoodDetails(FoodModel foodDetails);
}
