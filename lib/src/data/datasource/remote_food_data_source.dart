
import '../models/food_model.dart';

abstract class RemoteFoodDataSource {
  Future<List<FoodModel>> getAllFood();
  Future<FoodModel> getFoodDetails(int foodId);
}
