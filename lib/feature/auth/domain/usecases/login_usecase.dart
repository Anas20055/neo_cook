import 'package:cook_app/core/usecase/usecase.dart';
import 'package:cook_app/feature/auth/domain/entity/auth_request.dart';
import 'package:cook_app/feature/auth/domain/entity/token_entity.dart';
import 'package:cook_app/feature/auth/domain/repository/auth_repo.dart';

class LoginUseCase implements UseCases<TokenEntity, LoginRequest> {
  final AuthRepo _authRepo;
  LoginUseCase(
    this._authRepo,
  );

  @override
  Future<TokenEntity> call({LoginRequest? params}) {
    return _authRepo.login(params!);
  }
}
