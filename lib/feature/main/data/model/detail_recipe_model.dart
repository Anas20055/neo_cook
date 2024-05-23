import 'package:cook_app/feature/main/domain/entity/detail_recipe_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'detail_recipe_model.g.dart';

class DetailRecipeModel extends DetailRecipeEntity {
  const DetailRecipeModel({
    required super.id,
    required super.imagePath,
    required super.name,
    required super.preparationTime,
    required super.authorId,
    required super.author,
    required super.likes,
    required super.description,
    required List<IngredientsModel> super.ingredients,
    required super.difficulty,
    required super.liked,
    required super.saved,
  });

  factory DetailRecipeModel.fromJson(Map<String, dynamic> json) {
    var ingredientsFromJson = json['ingredients'] as List;
    List<IngredientsModel> ingredientList =
        ingredientsFromJson.map((i) => IngredientsModel.fromJson(i)).toList();
    return DetailRecipeModel(
      id: json['id'],
      imagePath: json['imagePath'],
      name: json['name'],
      preparationTime: json['preparationTime'],
      authorId: json['authorId'],
      author: json['author'],
      likes: json['likes'],
      description: json['description'],
      ingredients: ingredientList,
      difficulty: json['difficulty'],
      liked: json['liked'],
      saved: json['saved'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'imagePath': imagePath,
      'name': name,
      'preparationTime': preparationTime,
      'authorId': authorId,
      'author': author,
      'likes': likes,
      'description': description,
      'ingredients': ingredients
          .map((ingredient) => (ingredient as IngredientsModel).toJson())
          .toList(),
      'saved': saved,
      'liked': liked
    };
  }
}

@JsonSerializable()
class IngredientsModel extends Ingredient {
  const IngredientsModel({
    required super.key,
    required super.value,
  });

  factory IngredientsModel.fromJson(Map<String, dynamic> json) =>
      _$IngredientsModelFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientsModelToJson(this);
}
