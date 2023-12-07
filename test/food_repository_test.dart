import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nomnom/src/data/datasource/local_food_data_source.dart';
import 'package:nomnom/src/data/datasource/remote_food_data_source.dart';
import 'package:nomnom/src/data/repository_impl/food_repository_impl.dart';
import 'package:nomnom/src/domain/entity/food_entity.dart';


class MockRemoteFoodDataSource extends Mock implements RemoteFoodDataSource {}

class MockLocalFoodDataSource extends Mock implements LocalFoodDataSource {}

void main() {
  late MockRemoteFoodDataSource mockRemoteDataSource;
  late MockLocalFoodDataSource mockLocalDataSource;
  late FoodRepositoryImpl repository;

  setUp(() {
    mockRemoteDataSource = MockRemoteFoodDataSource();
    mockLocalDataSource = MockLocalFoodDataSource();
    repository = FoodRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
    );
  });

  group('FoodRepositoryImpl', () {
    const foodList = [FoodEntity(id: 1, name: 'Burger', price: 5.99, description: 'description', imageUrl: 'image url',)];
    const foodDetails = FoodEntity(id: 1, name: 'Burger', price: 5.99, description: 'description', imageUrl: 'image url',);

    test('getAllFood returns food list from remote data source', () async {
      when(() => mockRemoteDataSource.getAllFood()).thenAnswer((_) async{
        return foodList;
      });

      final result = await repository.getAllFood();

      expect(result, equals(foodList));
      verify(() => mockRemoteDataSource.getAllFood()).called(1);
      verifyZeroInteractions(mockLocalDataSource);
    });

    test('getAllFood falls back to local data source on remote error', () async {
      when(() => mockRemoteDataSource.getAllFood()).thenThrow(Exception('Test Exception'));
      when(() => mockLocalDataSource.getCachedFood()).thenAnswer((_) async => foodList);

      final result = await repository.getAllFood();

      expect(result, equals(foodList));
      verify(() => mockRemoteDataSource.getAllFood()).called(1);
      verify(() => mockLocalDataSource.getCachedFood()).called(1);
    });

    test('getFoodDetails returns food details from remote data source', () async {
      when(() => mockRemoteDataSource.getFoodDetails(1)).thenAnswer((_) async => foodDetails);

      final result = await repository.getFoodDetails(1);

      expect(result, equals(foodDetails));
      verify(() => mockRemoteDataSource.getFoodDetails(1)).called(1);
      verifyZeroInteractions(mockLocalDataSource);
    });

    test('getFoodDetails falls back to local data source on remote error', () async {
      when(() => mockRemoteDataSource.getFoodDetails(1)).thenThrow(Exception('Test Exception'));
      when(() => mockLocalDataSource.getCachedFoodDetails(1)).thenAnswer((_) async => foodDetails);

      final result = await repository.getFoodDetails(1);

      expect(result, equals(foodDetails));
      verify(() => mockRemoteDataSource.getFoodDetails(1)).called(1);
      verify(() => mockLocalDataSource.getCachedFoodDetails(1)).called(1);
    });
  });
}
