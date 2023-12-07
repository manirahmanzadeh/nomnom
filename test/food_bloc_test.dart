import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:nomnom/src/domain/entity/food_entity.dart';
import 'package:nomnom/src/domain/usecase/get_all_food_usecase.dart';
import 'package:nomnom/src/domain/usecase/get_food_details_usecase.dart';
import 'package:nomnom/src/presentation/bloc/food_bloc.dart';
import 'package:mocktail/mocktail.dart';


class MockGetAllFoodUseCase extends Mock implements GetAllFoodUseCase {}

class MockGetFoodDetailsUseCase extends Mock implements GetFoodDetailsUseCase {}

void main() {
  late MockGetAllFoodUseCase mockGetAllFoodUseCase;
  late MockGetFoodDetailsUseCase mockGetFoodDetailsUseCase;

  setUp(() {
    mockGetAllFoodUseCase = MockGetAllFoodUseCase();
    mockGetFoodDetailsUseCase = MockGetFoodDetailsUseCase();
  });

  group('FoodBloc', () {
    const foodList = [FoodEntity(id: 1, name: 'Burger', price: 5.99, description: 'description', imageUrl: 'some image url')];
    const foodDetails = FoodEntity(id: 1, name: 'Burger', price: 5.99, description: 'description', imageUrl: 'some image url');

    blocTest<FoodBloc, FoodState>(
      'emits [FoodLoading, FoodLoadSuccess] when GetAllFoodEvent is added',
      build: () {
        when(() => mockGetAllFoodUseCase.execute()).thenAnswer((_) async => foodList);
        return FoodBloc(
          getAllFoodUseCase: mockGetAllFoodUseCase,
          getFoodDetailsUseCase: mockGetFoodDetailsUseCase,
        );
      },
      act: (bloc) => bloc.add(GetAllFoodEvent()),
      expect: () => [
        FoodLoading(),
        const FoodLoadSuccess(foodList),
      ],
    );

    blocTest<FoodBloc, FoodState>(
      'emits [FoodLoading, FoodDetailsLoadSuccess] when GetFoodDetailsEvent is added',
      build: () {
        when(() => mockGetFoodDetailsUseCase.execute(1)).thenAnswer((_) async => foodDetails);
        return FoodBloc(
          getAllFoodUseCase: mockGetAllFoodUseCase,
          getFoodDetailsUseCase: mockGetFoodDetailsUseCase,
        );
      },
      act: (bloc) => bloc.add(const GetFoodDetailsEvent(1)),
      expect: () => [
        FoodLoading(),
        const FoodDetailsLoadSuccess(foodDetails),
      ],
    );
  });
}
