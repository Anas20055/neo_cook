import 'package:cook_app/core/usecase/usecase.dart';
import 'package:cook_app/feature/main/domain/entity/author_entity.dart';
import 'package:cook_app/feature/main/domain/repository/repo.dart';

class GetAuthorUsecase implements UseCases<AuthorEntity, int> {
  final MainRepo mainRepo;

  GetAuthorUsecase(this.mainRepo);
  @override
  Future<AuthorEntity> call({int? params}) {
    return mainRepo.getAuthor(id: params!);
  }
}
