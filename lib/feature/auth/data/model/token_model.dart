import 'package:cook_app/feature/auth/domain/entity/token_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'token_model.g.dart';

@JsonSerializable()
class TokenModel extends TokenEntity {
  const TokenModel({required super.token});

  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      _$TokenModelFromJson(json);
  Map<String, dynamic> toJson() => _$TokenModelToJson(this);
}
