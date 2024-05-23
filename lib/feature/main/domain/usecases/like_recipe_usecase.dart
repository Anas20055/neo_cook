import 'package:cook_app/core/usecase/usecase.dart';
import 'package:cook_app/feature/main/domain/repository/repo.dart';

class LikeRecipeUsecase implements UseCases<void, int> {
  final MainRepo mainRepo;
  LikeRecipeUsecase(this.mainRepo);
  @override
  Future<void> call({int? params}) {
    return mainRepo.likeRecipe(id: params!);
  }
}
