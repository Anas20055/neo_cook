// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthorModel _$AuthorModelFromJson(Map<String, dynamic> json) => AuthorModel(
      id: (json['id'] as num).toInt(),
      recipesCount: (json['recipesCount'] as num).toInt(),
      followersCount: (json['followersCount'] as num).toInt(),
      followingsCount: (json['followingsCount'] as num).toInt(),
    );

Map<String, dynamic> _$AuthorModelToJson(AuthorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'recipesCount': instance.recipesCount,
      'followersCount': instance.followersCount,
      'followingsCount': instance.followingsCount,
    };
