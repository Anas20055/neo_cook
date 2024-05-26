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
  final List<RecipeEntity>? authorRecipe;
  final bool? isFollowing;
  const MainState({
    this.authorRecipe,
    this.isFollowing,
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

class MainAuthorLoading extends MainState {
  const MainAuthorLoading({
    super.detailRecipe,
    super.breakfast,
    super.lunch,
    super.dinner,
  });
}

class MainSaveLikeFollow extends MainState {
  const MainSaveLikeFollow({
    super.detailRecipe,
    super.breakfast,
    super.lunch,
    super.dinner,
    super.isFollowing,
    super.authorRecipe,
    super.author,
  });
}

class MainDone extends MainState {
  const MainDone({
    super.breakfast,
    super.lunch,
    super.dinner,
    super.detailRecipe,
    super.author,
    super.isFollowing,
    super.authorRecipe,
  });
}

class MainError extends MainState {
  const MainError(String error) : super(error: error);
}
