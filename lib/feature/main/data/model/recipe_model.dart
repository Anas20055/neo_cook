import 'package:cook_app/feature/main/domain/entity/recipe_entity.dart';

import 'package:json_annotation/json_annotation.dart';

part 'recipe_model.g.dart';

@JsonSerializable()
class RecipeModel extends RecipeEntity {
  const RecipeModel({
    required super.id,
    required super.imagePath,
    required super.name,
    required super.author,
    required super.likes,
    required super.saves,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeModelToJson(this);
}
