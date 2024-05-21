import 'package:cook_app/feature/auth/data/data_source/local/shared_preff.dart';
import 'package:cook_app/feature/main/data/data_source/main_api.dart';
import 'package:cook_app/feature/main/data/model/detail_recipe_model.dart';
import 'package:cook_app/feature/main/data/model/recipe_model.dart';
import 'package:cook_app/feature/main/domain/repository/repo.dart';

class MainRepoImpl implements MainRepo {
  final MainApi mainApi;
  final SessionDataProvider sessionDataProvider;
  MainRepoImpl(
    this.mainApi,
    this.sessionDataProvider,
  );
  @override
  Future<List<RecipeModel>> getRecipes({required String category}) async {
    final token = await sessionDataProvider.getSessionId();
    final httpResponse = await mainApi.getRecipes('Bearer $token', category);
    return httpResponse.data;
  }

  @override
  Future<DetailRecipeModel> getDetailRecipe({required int id}) async {
    final token = await sessionDataProvider.getSessionId();
    final httpResponse = await mainApi.getDetailRecipe(id, 'Bearer $token');
    return httpResponse.data;
  }
}
