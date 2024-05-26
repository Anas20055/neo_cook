// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:cook_app/feature/profile/domain/entity/edit_profile.dart';
import 'package:cook_app/feature/profile/domain/usecases/edit_profile_usecase.dart';
import 'package:cook_app/feature/profile/domain/usecases/leave_usecase.dart';
import 'package:cook_app/feature/profile/domain/usecases/load_image_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cook_app/feature/main/domain/entity/author_entity.dart';
import 'package:cook_app/feature/main/domain/entity/recipe_entity.dart';
import 'package:cook_app/feature/profile/domain/usecases/get_profile_recipes.dart';
import 'package:cook_app/feature/profile/domain/usecases/get_profile_saved.dart';
import 'package:cook_app/feature/profile/domain/usecases/get_profile_usecase.dart';
import 'package:image_picker/image_picker.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final EditProfileUsecase editProfileUsecase;
  final LoadImageUsecase loadImageUsecase;
  final GetProfileRecipesUsecase getProfileRecipesUsecase;
  final GetProfileSavedUsecase getProfileSavedUsecase;
  final GetProfileUsecase getProfileUsecase;
  final LeaveUsecase leaveUsecase;
  ProfileCubit(
    this.getProfileRecipesUsecase,
    this.getProfileSavedUsecase,
    this.getProfileUsecase,
    this.leaveUsecase,
    this.editProfileUsecase,
    this.loadImageUsecase,
  ) : super(const ProfileLoading());
  void getProfile() async {
    try {
      final profile = await getProfileUsecase.call();
      final profileRecipes = await getProfileRecipesUsecase.call();
      final profileSaved = await getProfileSavedUsecase.call();
      emit(ProfileDone(
        profile: profile,
        profileRecipe: profileRecipes,
        profileSaved: profileSaved,
      ));
    } catch (e) {
      emit(ProfileError(error: e.toString()));
    }
  }

  void getImage() async {
    final currentState = state;
    emit(ProfileLoading(
      profile: currentState.profile,
      profileRecipe: currentState.profileRecipe,
      profileSaved: currentState.profileSaved,
      image: currentState.image,
    ));
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) return;
    emit(ProfileDone(
      image: File(returnedImage.path),
      profile: currentState.profile,
      profileRecipe: currentState.profileRecipe,
      profileSaved: currentState.profileSaved,
    ));
  }

  void leave() async {
    await leaveUsecase.call();
  }

  void onBack() {
    final currentState = state;
    emit(ProfileLoading(
      profile: currentState.profile,
      profileRecipe: currentState.profileRecipe,
      profileSaved: currentState.profileSaved,
    ));
    emit(ProfileDone(
      profile: currentState.profile,
      profileRecipe: currentState.profileRecipe,
      profileSaved: currentState.profileSaved,
    ));
  }

  void onEdit({String? name, String? bio}) async {
    final currentState = state;
    emit(ProfileLoading(
      profile: currentState.profile,
      profileRecipe: currentState.profileRecipe,
      profileSaved: currentState.profileSaved,
      image: currentState.image,
    ));
    try {
      final image = await loadImageUsecase.call(params: currentState.image);
      final succesMessage = await editProfileUsecase.call(
          params: EditProfie(
        editedName: name,
        editedBio: bio,
        editedAvatarPath: image,
      ));
      final profile = await getProfileUsecase.call();
      emit(ProfileDone(
          profile: profile,
          profileRecipe: currentState.profileRecipe,
          profileSaved: currentState.profileSaved,
          succesMessage: succesMessage));
    } catch (e) {
      ProfileError(error: e.toString());
    }
  }
}
