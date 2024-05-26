import 'package:cook_app/core/usecase/usecase.dart';
import 'package:cook_app/feature/main/domain/repository/repo.dart';

class FollowUsecase implements UseCases<void, int> {
  final MainRepo mainRepo;
  FollowUsecase(this.mainRepo);
  @override
  Future<void> call({int? params}) {
    return mainRepo.follow(id: params!);
  }
}
