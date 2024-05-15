// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cook_app/app/data/data_source/app_api.dart';
import 'package:cook_app/feature/auth/domain/entity/auth_request.dart';
import 'package:cook_app/feature/auth/domain/entity/token_entity.dart';
import 'package:cook_app/feature/auth/domain/repository/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final AppApi _api;
  AuthRepoImpl(
    this._api,
  );
  @override
  Future<TokenEntity> login(LoginRequest loginRequest) async {
    final httpResponse = await _api.login(loginRequest);
    return httpResponse.data;
  }

  @override
  Future<String> register(RegisterRequest loginRequest) async {
    final httpResponse = await _api.register(loginRequest);
    return httpResponse;
  }
}
