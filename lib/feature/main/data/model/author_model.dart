import 'package:cook_app/feature/main/domain/entity/author_entity.dart';

import 'package:json_annotation/json_annotation.dart';

part 'author_model.g.dart';

@JsonSerializable()
class AuthorModel extends AuthorEntity {
  const AuthorModel(
      {required super.name,
      required super.id,
      required super.recipesCount,
      required super.followersCount,
      required super.followingsCount,
      super.bio,
      super.imagePath});

  factory AuthorModel.fromJson(Map<String, dynamic> json) =>
      _$AuthorModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorModelToJson(this);
}
