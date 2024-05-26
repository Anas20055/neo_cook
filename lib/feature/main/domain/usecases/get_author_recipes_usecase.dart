import 'package:cook_app/core/usecase/usecase.dart';
import 'package:cook_app/feature/main/domain/entity/recipe_entity.dart';
import 'package:cook_app/feature/main/domain/repository/repo.dart';

class GetAuthorRecipesUsecase implements UseCases<List<RecipeEntity>, int> {
  final MainRepo mainRepo;
  GetAuthorRecipesUsecase(this.mainRepo);
  @override
  Future<List<RecipeEntity>> call({int? params}) {
    return mainRepo.getAuthorRecipes(id: params!);
  }
}
