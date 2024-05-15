import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class TokenEntity extends Equatable {
  final String token;

  const TokenEntity({required this.token});

  @override
  // TODO: implement props
  List<Object?> get props => [token];
}
