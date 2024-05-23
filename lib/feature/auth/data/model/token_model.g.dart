// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenModel _$TokenModelFromJson(Map<String, dynamic> json) => TokenModel(
      token: json['token'] as String,
      userName: json['userName'] as String,
      userId: (json['userId'] as num).toInt(),
    );

Map<String, dynamic> _$TokenModelToJson(TokenModel instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'userId': instance.userId,
      'token': instance.token,
    };
