

import '../entity/food_entity.dart';
import '../repository/food_repository.dart';

class GetFoodDetailsUseCase {
  final FoodRepository foodRepository;

  GetFoodDetailsUseCase(this.foodRepository);

  Future<FoodEntity> execute(int foodId) async {
    return await foodRepository.getFoodDetails(foodId);
  }
}
