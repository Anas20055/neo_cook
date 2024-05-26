import 'dart:io';

import 'package:cook_app/feature/main/domain/entity/author_entity.dart';
import 'package:cook_app/feature/main/domain/entity/recipe_entity.dart';
import 'package:cook_app/feature/profile/domain/entity/edit_profile.dart';

abstract class ProfileRepo {
  Future<AuthorEntity> getAuthor();
  Future<List<RecipeEntity>> getAuthorRecipes();
  Future<List<RecipeEntity>> getAuthorSaved();
  void leave();
  Future<String> editProfie(EditProfie edit);
  Future<String> loadImage(File file);
}
