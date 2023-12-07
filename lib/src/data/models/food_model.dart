
import '../../domain/entity/food_entity.dart';

class FoodModel {
  final int id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  FoodModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  factory FoodModel.fromEntity(FoodEntity entity) {
    return FoodModel(
      id: entity.id,
      name: entity.name,
      description: entity.description,
      price: entity.price,
      imageUrl: entity.imageUrl,
    );
  }

  FoodEntity toEntity() {
    return FoodEntity(
      id: id,
      name: name,
      description: description,
      price: price,
      imageUrl: imageUrl,
    );
  }
}
