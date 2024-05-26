import 'dart:convert';

import 'package:cook_app/feature/auth/data/data_source/local/shared_preff.dart';
import 'package:cook_app/feature/auth/data/model/token_model.dart';
import 'package:cook_app/feature/main/data/data_source/main_api.dart';
import 'package:cook_app/feature/main/data/model/author_model.dart';
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

  Future<TokenModel> _getToken() async {
    final tokenModel = await sessionDataProvider.getSessionId();
    final token = TokenModel.fromJson(jsonDecode(tokenModel ?? ''));
    return token;
  }

  @override
  Future<List<RecipeModel>> getRecipes({required String category}) async {
    final token = await _getToken();
    final httpResponse =
        await mainApi.getRecipes('Bearer ${token.token}', category);
    return httpResponse.data;
  }

  @override
  Future<DetailRecipeModel> getDetailRecipe({required int id}) async {
    final token = await _getToken();
    final httpResponse = await mainApi.getDetailRecipe(
        id, 'Bearer ${token.token}', token.userId);
    return httpResponse.data;
  }

  @override
  Future<void> saveRecipe({required int id}) async {
    final token = await _getToken();
    await mainApi.saveRecipe(id, 'Bearer ${token.token}', token.userId);
  }

  @override
  Future<void> likeRecipe({required int id}) async {
    final token = await _getToken();
    await mainApi.likeRecipe(id, 'Bearer ${token.token}', token.userId);
  }

  @override
  Future<AuthorModel> getAuthor({required int id}) async {
    final token = await _getToken();
    final httpResponse = await mainApi.getAuthor(id, 'Bearer ${token.token}');
    return httpResponse.data;
  }

  @override
  Future<void> follow({required int id}) async {
    final token = await _getToken();
    await mainApi.follow('Bearer ${token.token}', token.userId, id);
  }

  @override
  Future<List<RecipeModel>> getAuthorRecipes({required int id}) async {
    final token = await _getToken();
    final httpResponse =
        await mainApi.getAuthorRecipes('Bearer ${token.token}', id);
    return httpResponse.data;
  }

  @override
  Future<bool> isFollowing({required int id}) async {
    final token = await _getToken();
    final httpResponse =
        await mainApi.isFollowing('Bearer ${token.token}', token.userId, id);
    return httpResponse;
  }
}
