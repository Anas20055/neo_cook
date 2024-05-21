import 'package:cook_app/core/usecase/usecase.dart';
import 'package:cook_app/feature/main/domain/entity/recipe_entity.dart';
import 'package:cook_app/feature/main/domain/repository/repo.dart';

class GetRecipesUsecase implements UseCases<List<RecipeEntity>, String> {
  final MainRepo mainRepo;

  GetRecipesUsecase(this.mainRepo);
  @override
  Future<List<RecipeEntity>> call({String? params}) {
    return mainRepo.getRecipes(category: params!);
  }
}
