import 'package:get_it/get_it.dart';

import '../../data/datasource/local_food_data_source.dart';
import '../../data/datasource/remote_food_data_source.dart';
import '../../data/repository_impl/food_repository_impl.dart';
import '../../domain/repository/food_repository.dart';
import '../../domain/usecase/get_all_food_usecase.dart';
import '../../domain/usecase/get_food_details_usecase.dart';
import '../../presentation/bloc/food_bloc.dart';


final GetIt di = GetIt.instance;

void setupDependencyInjection() {
  // // Data Sources
  // di.registerLazySingleton<RemoteFoodDataSource>(() => RemoteFoodDataSource());
  // di.registerLazySingleton<LocalFoodDataSource>(() => YourLocalFoodDataSource());

  // Repositories
  di.registerLazySingleton<FoodRepository>(() => FoodRepositoryImpl(
    remoteDataSource: di<RemoteFoodDataSource>(),
    localDataSource: di<LocalFoodDataSource>(),
  ));

  // Use Cases
  di.registerLazySingleton<GetAllFoodUseCase>(() => GetAllFoodUseCase(di<FoodRepository>()));
  di.registerLazySingleton<GetFoodDetailsUseCase>(() => GetFoodDetailsUseCase(di<FoodRepository>()));

  // BLoCs
  di.registerFactory(() => FoodBloc(
    getAllFoodUseCase: di<GetAllFoodUseCase>(),
    getFoodDetailsUseCase: di<GetFoodDetailsUseCase>(),
  ));
}
