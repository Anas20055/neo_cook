import 'package:cook_app/core/usecase/usecase.dart';
import 'package:cook_app/feature/auth/domain/entity/auth_request.dart';
import 'package:cook_app/feature/auth/domain/repository/auth_repo.dart';

class RegisterUseCase implements UseCases<String, RegisterRequest> {
  final AuthRepo _authRepo;
  RegisterUseCase(
    this._authRepo,
  );

  @override
  Future<String> call({RegisterRequest? params}) {
    return _authRepo.register(params!);
  }
}
