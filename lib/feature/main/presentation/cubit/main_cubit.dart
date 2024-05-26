import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cook_app/feature/main/domain/entity/author_entity.dart';
import 'package:cook_app/feature/main/domain/entity/detail_recipe_entity.dart';
import 'package:cook_app/feature/main/domain/entity/recipe_entity.dart';
import 'package:cook_app/feature/main/domain/usecases/follow_usecase.dart';
import 'package:cook_app/feature/main/domain/usecases/get_author_recipes_usecase.dart';
import 'package:cook_app/feature/main/domain/usecases/get_author_usecase.dart';
import 'package:cook_app/feature/main/domain/usecases/get_detail_recipe_usecase.dart';
import 'package:cook_app/feature/main/domain/usecases/get_recipe_usecase.dart';
import 'package:cook_app/feature/main/domain/usecases/is_follow_usecase.dart';
import 'package:cook_app/feature/main/domain/usecases/like_recipe_usecase.dart';
import 'package:cook_app/feature/main/domain/usecases/save_recipe_usecase.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  final FollowUsecase followUsecase;
  final IsFollowUsecase isFollowUsecase;
  final GetAuthorRecipesUsecase getAuthorRecipesUsecase;
  final GetDetailRecipeUsecase getDetailRecipeUsecase;
  final GetRecipesUsecase getRecipesUsecase;
  final SaveRecipeUsecase saveRecipeUsecase;
  final LikeRecipeUsecase likeRecipeUsecase;
  final GetAuthorUsecase getAuthorUsecase;
  MainCubit(
    this.followUsecase,
    this.isFollowUsecase,
    this.getAuthorRecipesUsecase,
    this.getDetailRecipeUsecase,
    this.getRecipesUsecase,
    this.saveRecipeUsecase,
    this.likeRecipeUsecase,
    this.getAuthorUsecase,
  ) : super(MainLoading());
  void getRecipes() async {
    try {
      final breakfast = await getRecipesUsecase.call(params: 'BREAKFAST');
      final lunch = await getRecipesUsecase.call(params: 'LUNCH');
      final dinner = await getRecipesUsecase.call(params: 'DINNER');
      emit(
        MainDone(
          breakfast: breakfast,
          lunch: lunch,
          dinner: dinner,
        ),
      );
    } catch (e) {
      print(e.toString());
      emit(MainError(e.toString()));
    }
  }

  void getDetailRecipe({required int id}) async {
    final currentState = state;
    emit(MainLoadingDetail());
    try {
      final detailRecipe = await getDetailRecipeUsecase.call(params: id);
      emit(
        MainDone(
          breakfast: currentState.breakfast,
          lunch: currentState.lunch,
          dinner: currentState.dinner,
          detailRecipe: detailRecipe,
        ),
      );
    } catch (e) {
      emit(MainError(e.toString()));
    }
  }

  void saveRecipe({required int id}) async {
    final currentState = state;
    emit(MainSaveLikeFollow(
      detailRecipe: currentState.detailRecipe,
      breakfast: currentState.breakfast,
      lunch: currentState.lunch,
      dinner: currentState.dinner,
    ));
    try {
      await saveRecipeUsecase.call(params: id);
      emit(MainDone(
        breakfast: currentState.breakfast,
        lunch: currentState.lunch,
        dinner: currentState.dinner,
        detailRecipe: currentState.detailRecipe?.copyWith(
          saved: !currentState.detailRecipe!.saved,
        ),
      ));
    } catch (e) {
      emit(MainError(e.toString()));
    }
  }

  void likeRecipe({required int id}) async {
    final currentState = state;
    emit(MainSaveLikeFollow(
      detailRecipe: currentState.detailRecipe,
      breakfast: currentState.breakfast,
      lunch: currentState.lunch,
      dinner: currentState.dinner,
    ));
    try {
      await likeRecipeUsecase.call(params: id);
      emit(MainDone(
        breakfast: currentState.breakfast,
        lunch: currentState.lunch,
        dinner: currentState.dinner,
        detailRecipe: currentState.detailRecipe?.copyWith(
          liked: !currentState.detailRecipe!.liked,
          likes: currentState.detailRecipe!.liked
              ? currentState.detailRecipe!.likes - 1
              : currentState.detailRecipe!.likes + 1,
        ),
      ));
    } catch (e) {
      emit(MainError(e.toString()));
    }
  }

  void getAuthor({required int id}) async {
    final currentState = state;
    emit(
      MainAuthorLoading(
        detailRecipe: currentState.detailRecipe,
        breakfast: currentState.breakfast,
        lunch: currentState.lunch,
        dinner: currentState.dinner,
      ),
    );
    try {
      final author = await getAuthorUsecase.call(params: id);
      final authorRecipes = await getAuthorRecipesUsecase.call(params: id);
      final isAuthorFollow = await isFollowUsecase.call(params: id);
      emit(
        MainDone(
          breakfast: currentState.breakfast,
          lunch: currentState.lunch,
          dinner: currentState.dinner,
          detailRecipe: currentState.detailRecipe,
          author: author,
          authorRecipe: authorRecipes,
          isFollowing: isAuthorFollow,
        ),
      );
    } catch (e) {
      emit(MainError(e.toString()));
    }
  }

  void follow({required int id}) async {
    final currentState = state;
    emit(
      MainSaveLikeFollow(
        detailRecipe: currentState.detailRecipe,
        breakfast: currentState.breakfast,
        lunch: currentState.lunch,
        dinner: currentState.dinner,
        author: currentState.author,
        isFollowing: currentState.isFollowing,
        authorRecipe: currentState.authorRecipe,
      ),
    );
    try {
      await followUsecase.call(params: id);
      emit(
        MainDone(
          detailRecipe: currentState.detailRecipe,
          breakfast: currentState.breakfast,
          lunch: currentState.lunch,
          dinner: currentState.dinner,
          author: currentState.author?.copyWith(
            followersCount: currentState.isFollowing!
                ? currentState.author!.followersCount - 1
                : currentState.author!.followersCount + 1,
          ),
          isFollowing: !currentState.isFollowing!,
          authorRecipe: currentState.authorRecipe,
        ),
      );
    } catch (e) {
      emit(MainError(e.toString()));
    }
  }
}
