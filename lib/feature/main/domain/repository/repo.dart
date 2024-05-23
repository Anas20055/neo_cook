import 'package:cook_app/feature/main/domain/entity/author_entity.dart';
import 'package:cook_app/feature/main/domain/entity/detail_recipe_entity.dart';
import 'package:cook_app/feature/main/domain/entity/recipe_entity.dart';

abstract class MainRepo {
  Future<List<RecipeEntity>> getRecipes({required String category});
  Future<DetailRecipeEntity> getDetailRecipe({required int id});
  Future<void> saveRecipe({required int id});
  Future<void> likeRecipe({required int id});
  Future<AuthorEntity> getAuthor({required int id});
}
