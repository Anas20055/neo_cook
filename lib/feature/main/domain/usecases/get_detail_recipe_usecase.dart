import 'package:cook_app/core/usecase/usecase.dart';
import 'package:cook_app/feature/main/domain/entity/detail_recipe_entity.dart';
import 'package:cook_app/feature/main/domain/repository/repo.dart';

class GetDetailRecipeUsecase implements UseCases<DetailRecipeEntity, int> {
  final MainRepo mainRepo;
  GetDetailRecipeUsecase(this.mainRepo);
  @override
  Future<DetailRecipeEntity> call({int? params}) {
    return mainRepo.getDetailRecipe(id: params!);
  }
}
