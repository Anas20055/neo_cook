// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeModel _$RecipeModelFromJson(Map<String, dynamic> json) => RecipeModel(
      id: (json['id'] as num).toInt(),
      imagePath: json['imagePath'] as String,
      name: json['name'] as String,
      author: json['author'] as String,
      likes: (json['likes'] as num).toInt(),
      saves: (json['saves'] as num).toInt(),
    );

Map<String, dynamic> _$RecipeModelToJson(RecipeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imagePath': instance.imagePath,
      'name': instance.name,
      'author': instance.author,
      'likes': instance.likes,
      'saves': instance.saves,
    };
