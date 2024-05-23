// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_request.g.dart';

@JsonSerializable()
class RegisterRequest extends Equatable {
  final String email;
  final String name;
  final String password;
  const RegisterRequest({
    required this.email,
    required this.name,
    required this.password,
  });

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

@JsonSerializable()
class LoginRequest extends Equatable {
  final String email;
  final String password;
  const LoginRequest({
    required this.email,
    required this.password,
  });

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
