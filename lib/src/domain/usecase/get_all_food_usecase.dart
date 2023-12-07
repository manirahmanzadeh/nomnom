

import '../entity/food_entity.dart';
import '../repository/food_repository.dart';

class GetAllFoodUseCase {
  final FoodRepository foodRepository;

  GetAllFoodUseCase(this.foodRepository);

  Future<List<FoodEntity>> execute() async {
    return await foodRepository.getAllFood();
  }
}
