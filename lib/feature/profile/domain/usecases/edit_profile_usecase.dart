import 'package:cook_app/core/usecase/usecase.dart';
import 'package:cook_app/feature/profile/domain/entity/edit_profile.dart';
import 'package:cook_app/feature/profile/domain/repository/profile_repo.dart';

class EditProfileUsecase implements UseCases<String, EditProfie> {
  final ProfileRepo profileRepo;
  EditProfileUsecase(this.profileRepo);
  @override
  Future<String> call({EditProfie? params}) {
    return profileRepo.editProfie(params!);
  }
}
