import 'package:cook_app/core/usecase/usecase.dart';
import 'package:cook_app/feature/profile/domain/repository/profile_repo.dart';

class LeaveUsecase implements UseCases<void, void> {
  final ProfileRepo profileRepo;
  LeaveUsecase(this.profileRepo);
  @override
  Future<void> call({void params}) async {
    return profileRepo.leave();
  }
}
