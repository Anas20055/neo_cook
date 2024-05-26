import 'package:cook_app/core/usecase/usecase.dart';
import 'package:cook_app/feature/main/domain/repository/repo.dart';

class IsFollowUsecase implements UseCases<bool, int> {
  final MainRepo mainRepo;
  IsFollowUsecase(this.mainRepo);
  @override
  Future<bool> call({int? params}) {
    return mainRepo.isFollowing(id: params!);
  }
}
