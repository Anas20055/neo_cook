part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  final TokenEntity? token;
  final String? error;
  final String? success;
  const AuthState({
    this.token,
    this.error,
    this.success,
  });

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthError extends AuthState {
  const AuthError(String error) : super(error: error);
}

class AuthSuccess extends AuthState {
  const AuthSuccess(String success) : super(success: success);
}

class AuthWaiting extends AuthState {
  const AuthWaiting();
}

class Authorized extends AuthState {
  const Authorized(TokenEntity tokenEntity) : super(token: tokenEntity);
}
