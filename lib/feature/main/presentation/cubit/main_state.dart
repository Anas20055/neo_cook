// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'main_cubit.dart';

abstract class MainState extends Equatable {
  final String? name;
  final List<RecipeEntity>? breakfast;
  final List<RecipeEntity>? lunch;
  final List<RecipeEntity>? dinner;
  final DetailRecipeEntity? detailRecipe;
  final AuthorEntity? author;
  final String? error;
  const MainState({
    this.name,
    this.breakfast,
    this.lunch,
    this.dinner,
    this.detailRecipe,
    this.author,
    this.error,
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

class MainAuthorLoading extends MainState {}

class MainSaveLike extends MainState {
  const MainSaveLike({
    super.detailRecipe,
    super.breakfast,
    super.lunch,
    super.dinner,
  });
}

class MainDone extends MainState {
  const MainDone(
      {super.breakfast,
      super.lunch,
      super.dinner,
      super.detailRecipe,
      super.author});
}

class MainError extends MainState {
  const MainError(String error) : super(error: error);
}
