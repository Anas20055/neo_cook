// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthorModel _$AuthorModelFromJson(Map<String, dynamic> json) => AuthorModel(
      name: json['name'] as String,
      id: (json['id'] as num).toInt(),
      recipesCount: (json['recipesCount'] as num).toInt(),
      followersCount: (json['followersCount'] as num).toInt(),
      followingsCount: (json['followingsCount'] as num).toInt(),
      bio: json['bio'] as String?,
      imagePath: json['imagePath'] as String?,
    );

Map<String, dynamic> _$AuthorModelToJson(AuthorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imagePath': instance.imagePath,
      'name': instance.name,
      'recipesCount': instance.recipesCount,
      'followersCount': instance.followersCount,
      'followingsCount': instance.followingsCount,
      'bio': instance.bio,
    };
