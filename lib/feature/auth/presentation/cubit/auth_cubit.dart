import 'dart:convert';

import 'package:cook_app/feature/auth/data/data_source/local/shared_preff.dart';
import 'package:cook_app/feature/auth/data/model/token_model.dart';
import 'package:cook_app/feature/auth/domain/entity/auth_request.dart';
import 'package:cook_app/feature/auth/domain/entity/token_entity.dart';
import 'package:cook_app/feature/auth/domain/usecases/login_usecase.dart';
import 'package:cook_app/feature/auth/domain/usecases/register_usecase.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final SessionDataProvider sessionDataProvider;
  AuthCubit(
    this.loginUseCase,
    this.registerUseCase,
    this.sessionDataProvider,
  ) : super(const AuthInitial());
  void login(LoginRequest request) async {
    emit(const AuthWaiting());
    try {
      final token = await loginUseCase.call(params: request);
      await sessionDataProvider.setSessionId(TokenModel.fromEntity(token));
      emit(Authorized(token));
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        emit(const AuthError('User doesn\'t exist'));
      } else if (e.response?.statusCode == 400) {
        emit(const AuthError('Wrong email and password'));
      } else if (e.response?.statusCode == 403) {
        emit(const AuthError('User is not verified,please verify your email'));
      } else {
        emit(const AuthError('Someting went wrong try it again later'));
      }
    }
  }

  void register(RegisterRequest request) async {
    emit(const AuthWaiting());
    try {
      final successMessage = await registerUseCase.call(params: request);
      emit(AuthSuccess(successMessage));
    } on DioException catch (e) {
      if (e.response?.statusCode == 409) {
        emit(const AuthError('User with that email already exists'));
      } else {
        emit(const AuthError('Someting went wrong try it again later'));
      }
    }
  }

  void logout() async {
    await sessionDataProvider.setSessionId(null);
    emit(const AuthInitial());
  }

  void getUser() async {
    final token = await sessionDataProvider.getSessionId();
    final Map<String, dynamic> model = jsonDecode(token!);
    emit(Authorized(TokenModel.fromJson(model)));
  }
}
