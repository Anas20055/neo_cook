import 'package:cook_app/core/usecase/usecase.dart';
import 'package:cook_app/feature/main/domain/repository/repo.dart';

class SaveRecipeUsecase implements UseCases<void, int> {
  final MainRepo mainRepo;
  SaveRecipeUsecase(this.mainRepo);
  @override
  Future<void> call({int? params}) {
    return mainRepo.saveRecipe(id: params!);
  }
}
