import 'package:cook_app/feature/auth/domain/entity/auth_request.dart';
import 'package:cook_app/feature/auth/domain/entity/token_entity.dart';

abstract class AuthRepo {
  Future<TokenEntity> login(LoginRequest loginRequest);
  Future<String> register(RegisterRequest loginRequest);
}
