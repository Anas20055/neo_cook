import 'package:cook_app/feature/main/domain/entity/detail_recipe_entity.dart';
import 'package:cook_app/feature/main/domain/entity/recipe_entity.dart';
import 'package:cook_app/feature/main/domain/usecases/get_detail_recipe_usecase.dart';
import 'package:cook_app/feature/main/domain/usecases/get_recipe_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  final GetDetailRecipeUsecase getDetailRecipeUsecase;
  final GetRecipesUsecase getRecipesUsecase;
  MainCubit(
    this.getRecipesUsecase,
    this.getDetailRecipeUsecase,
  ) : super(MainLoading());
  void getRecipes() async {
    try {
      final breakfast = await getRecipesUsecase.call(params: 'BREAKFAST');
      final lunch = await getRecipesUsecase.call(params: 'LUNCH');
      final dinner = await getRecipesUsecase.call(params: 'DINNER');
      print(dinner.toString());
      emit(
        MainDone(
          breakfast: breakfast,
          lunch: lunch,
          dinner: dinner,
        ),
      );
    } catch (e) {
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
}
