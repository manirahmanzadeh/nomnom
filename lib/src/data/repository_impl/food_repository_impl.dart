

import '../../domain/entity/food_entity.dart';
import '../../domain/repository/food_repository.dart';
import '../datasource/local_food_data_source.dart';
import '../datasource/remote_food_data_source.dart';

class FoodRepositoryImpl implements FoodRepository {
  final RemoteFoodDataSource remoteDataSource;
  final LocalFoodDataSource localDataSource;

  FoodRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<List<FoodEntity>> getAllFood() async {
    try {
      // Attempt to fetch data from the remote data source
      final remoteFoodList = await remoteDataSource.getAllFood();

      // Cache the data locally for future use
      await localDataSource.cacheFood(remoteFoodList);

      // Convert and return the remote data as domain entities
      return remoteFoodList.map((foodModel) => foodModel.toEntity()).toList();
    } catch (e) {
      // If an error occurs, attempt to fetch data from the local data source
      final cachedFoodList = await localDataSource.getCachedFood();

      // Return the cached data as domain entities
      return cachedFoodList.map((foodModel) => foodModel.toEntity()).toList();
    }
  }

  @override
  Future<FoodEntity> getFoodDetails(int foodId) async {
    try {
      // Attempt to fetch detailed data from the remote data source
      final remoteFoodDetails = await remoteDataSource.getFoodDetails(foodId);

      // Cache the detailed data locally for future use
      await localDataSource.cacheFoodDetails(remoteFoodDetails);

      // Convert and return the remote detailed data as a domain entity
      return remoteFoodDetails.toEntity();
    } catch (e) {
      // If an error occurs, attempt to fetch detailed data from the local data source
      final cachedFoodDetails = await localDataSource.getCachedFoodDetails(foodId);

      // Return the cached detailed data as a domain entity
      return cachedFoodDetails.toEntity();
    }
  }
}
