part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
  final AuthorEntity? profile;
  final String? error;
  final List<RecipeEntity>? profileRecipe;
  final List<RecipeEntity>? profileSaved;
  final File? image;
  final String? succesMessage;
  const ProfileState({
    this.succesMessage,
    this.image,
    this.profile,
    this.error,
    this.profileRecipe,
    this.profileSaved,
  });

  @override
  List<Object> get props => [];
}

class ProfileLoading extends ProfileState {
  const ProfileLoading({
    super.profile,
    super.profileRecipe,
    super.profileSaved,
    super.image,
  });
}

class ProfileDone extends ProfileState {
  const ProfileDone({
    super.profile,
    super.profileRecipe,
    super.profileSaved,
    super.image,
    super.succesMessage,
  });
}

class ProfileError extends ProfileState {
  const ProfileError({super.error});
}
