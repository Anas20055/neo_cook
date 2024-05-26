import 'package:cook_app/core/usecase/usecase.dart';
import 'package:cook_app/feature/main/domain/entity/author_entity.dart';
import 'package:cook_app/feature/profile/domain/repository/profile_repo.dart';

class GetProfileUsecase implements UseCases<AuthorEntity, void> {
  final ProfileRepo profileRepo;

  GetProfileUsecase(this.profileRepo);
  @override
  Future<AuthorEntity> call({void params}) {
    return profileRepo.getAuthor();
  }
}
