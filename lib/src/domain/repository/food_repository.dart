
import 'package:nomnom/src/domain/entity/food_entity.dart';

abstract class FoodRepository {
  Future<List<FoodEntity>> getAllFood();
  Future<FoodEntity> getFoodDetails(int foodId);
}
