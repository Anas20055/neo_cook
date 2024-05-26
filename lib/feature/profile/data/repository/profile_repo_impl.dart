import 'dart:convert';
import 'dart:io';

import 'package:cook_app/feature/auth/data/data_source/local/shared_preff.dart';
import 'package:cook_app/feature/auth/data/model/token_model.dart';
import 'package:cook_app/feature/main/data/model/author_model.dart';
import 'package:cook_app/feature/main/data/model/recipe_model.dart';
import 'package:cook_app/feature/profile/data/datasource/profile_api.dart';
import 'package:cook_app/feature/profile/domain/entity/edit_profile.dart';
import 'package:cook_app/feature/profile/domain/repository/profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ProfileApi _profileApi;
  final SessionDataProvider sessionDataProvider;
  ProfileRepoImpl(
    this._profileApi,
    this.sessionDataProvider,
  );

  Future<TokenModel> _getToken() async {
    final tokenModel = await sessionDataProvider.getSessionId();
    final token = TokenModel.fromJson(jsonDecode(tokenModel ?? ''));
    return token;
  }

  @override
  Future<AuthorModel> getAuthor() async {
    final token = await _getToken();
    final httpResponse = await _profileApi.getAuthor(
      token.userId,
      'Bearer ${token.token}',
    );
    return httpResponse.data;
  }

  @override
  Future<List<RecipeModel>> getAuthorRecipes() async {
    final token = await _getToken();
    final httpResponse = await _profileApi.getAuthorRecipes(
        'Bearer ${token.token}', token.userId);
    return httpResponse.data;
  }

  @override
  Future<List<RecipeModel>> getAuthorSaved() async {
    final token = await _getToken();
    final httpResponse =
        await _profileApi.getAuthorSaved('Bearer ${token.token}', token.userId);
    return httpResponse.data;
  }

  @override
  void leave() async {
    await sessionDataProvider.setSessionId(null);
  }

  @override
  Future<String> editProfie(EditProfie edit) async {
    final token = await _getToken();
    final httpResponse = await _profileApi.editProfile(
      'Bearer ${token.token}',
      token.userId,
      edit,
    );
    return httpResponse;
  }

  @override
  Future<String> loadImage(File file) async {
    final token = await _getToken();
    final httpResponse =
        await _profileApi.loadImage('Bearer ${token.token}', file);
    return httpResponse;
  }
}
