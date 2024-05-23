// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class TokenEntity extends Equatable {
  final String userName;
  final int userId;
  final String token;

  const TokenEntity({
    required this.userName,
    required this.userId,
    required this.token,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        token,
        userId,
        userName,
      ];
}
