import 'package:cook_app/core/usecase/usecase.dart';
import 'package:cook_app/feature/main/domain/entity/recipe_entity.dart';
import 'package:cook_app/feature/profile/domain/repository/profile_repo.dart';

class GetProfileRecipesUsecase implements UseCases<List<RecipeEntity>, void> {
  final ProfileRepo profileRepo;
  GetProfileRecipesUsecase(this.profileRepo);
  @override
  Future<List<RecipeEntity>> call({void params}) {
    return profileRepo.getAuthorRecipes();
  }
}
