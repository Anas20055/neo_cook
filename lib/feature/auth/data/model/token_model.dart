import 'package:cook_app/feature/auth/domain/entity/token_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'token_model.g.dart';

@JsonSerializable()
class TokenModel extends TokenEntity {
  const TokenModel({
    required super.token,
    required super.userName,
    required super.userId,
  });

  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      _$TokenModelFromJson(json);
  Map<String, dynamic> toJson() => _$TokenModelToJson(this);

  factory TokenModel.fromEntity(TokenEntity entity) {
    return TokenModel(
      token: entity.token,
      userName: entity.userName,
      userId: entity.userId,
    );
  }
}
