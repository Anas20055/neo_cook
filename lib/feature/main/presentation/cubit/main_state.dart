part of 'main_cubit.dart';

abstract class MainState extends Equatable {
  final List<RecipeEntity>? breakfast;
  final List<RecipeEntity>? lunch;
  final List<RecipeEntity>? dinner;
  final DetailRecipeEntity? detailRecipe;
  final String? error;
  const MainState({
    this.detailRecipe,
    this.error,
    this.breakfast,
    this.lunch,
    this.dinner,
  });

  @override
  List<Object> get props => [
        breakfast ?? [],
        lunch ?? [],
        dinner ?? [],
        error ?? '',
      ];
}

class MainLoading extends MainState {}

class MainLoadingDetail extends MainState {}

class MainDone extends MainState {
  const MainDone({
    super.breakfast,
    super.lunch,
    super.dinner,
    super.detailRecipe,
  });
}

class MainError extends MainState {
  const MainError(String error) : super(error: error);
}
