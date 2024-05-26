import 'dart:io';

import 'package:cook_app/core/usecase/usecase.dart';
import 'package:cook_app/feature/profile/domain/repository/profile_repo.dart';

class LoadImageUsecase implements UseCases<String, File> {
  final ProfileRepo profileRepo;
  LoadImageUsecase(this.profileRepo);
  @override
  Future<String> call({File? params}) {
    return profileRepo.loadImage(params!);
  }
}
