import 'package:cook_app/feature/auth/data/data_source/app_api.dart';
import 'package:cook_app/feature/auth/data/data_source/local/shared_preff.dart';
import 'package:cook_app/feature/auth/data/repository/auth_repo_impl.dart';
import 'package:cook_app/feature/auth/domain/repository/auth_repo.dart';
import 'package:cook_app/feature/auth/domain/usecases/login_usecase.dart';
import 'package:cook_app/feature/auth/domain/usecases/register_usecase.dart';
import 'package:cook_app/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:cook_app/feature/main/data/data_source/main_api.dart';
import 'package:cook_app/feature/main/data/repository/repo_impl.dart';
import 'package:cook_app/feature/main/domain/repository/repo.dart';
import 'package:cook_app/feature/main/domain/usecases/follow_usecase.dart';
import 'package:cook_app/feature/main/domain/usecases/get_author_recipes_usecase.dart';
import 'package:cook_app/feature/main/domain/usecases/get_author_usecase.dart';
import 'package:cook_app/feature/main/domain/usecases/get_detail_recipe_usecase.dart';
import 'package:cook_app/feature/main/domain/usecases/get_recipe_usecase.dart';
import 'package:cook_app/feature/main/domain/usecases/is_follow_usecase.dart';
import 'package:cook_app/feature/main/domain/usecases/like_recipe_usecase.dart';
import 'package:cook_app/feature/main/domain/usecases/save_recipe_usecase.dart';
import 'package:cook_app/feature/main/presentation/cubit/main_cubit.dart';
import 'package:cook_app/feature/profile/data/datasource/profile_api.dart';
import 'package:cook_app/feature/profile/data/repository/profile_repo_impl.dart';
import 'package:cook_app/feature/profile/domain/repository/profile_repo.dart';
import 'package:cook_app/feature/profile/domain/usecases/edit_profile_usecase.dart';
import 'package:cook_app/feature/profile/domain/usecases/get_profile_recipes.dart';
import 'package:cook_app/feature/profile/domain/usecases/get_profile_saved.dart';
import 'package:cook_app/feature/profile/domain/usecases/get_profile_usecase.dart';
import 'package:cook_app/feature/profile/domain/usecases/leave_usecase.dart';
import 'package:cook_app/feature/profile/domain/usecases/load_image_usecase.dart';
import 'package:cook_app/feature/profile/presentation/cubit/profile_cubit.dart';
import 'package:get_it/get_it.dart';

import 'package:dio/dio.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

part "dio_client.dart";

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  final dio = _buildDioClient('http://164.92.125.200:8080/api');
  sl.registerSingleton<AppApi>(AppApi(dio));
  sl.registerSingleton<MainApi>(MainApi(dio));
  sl.registerSingleton<ProfileApi>(ProfileApi(dio));
  sl.registerSingleton<SessionDataProvider>(SessionDataProvider());
  sl.registerSingleton<AuthRepo>(AuthRepoImpl(sl()));
  sl.registerSingleton<MainRepo>(MainRepoImpl(sl(), sl()));
  sl.registerSingleton<ProfileRepo>(ProfileRepoImpl(sl(), sl()));
  sl.registerSingleton<GetRecipesUsecase>(GetRecipesUsecase(sl()));
  sl.registerSingleton<LoginUseCase>(LoginUseCase(sl()));
  sl.registerSingleton<RegisterUseCase>(RegisterUseCase(sl()));
  sl.registerSingleton<GetDetailRecipeUsecase>(GetDetailRecipeUsecase(sl()));
  sl.registerSingleton<SaveRecipeUsecase>(SaveRecipeUsecase(sl()));
  sl.registerSingleton<LikeRecipeUsecase>(LikeRecipeUsecase(sl()));
  sl.registerSingleton<GetAuthorUsecase>(GetAuthorUsecase(sl()));
  sl.registerSingleton<GetAuthorRecipesUsecase>(GetAuthorRecipesUsecase(sl()));
  sl.registerSingleton<IsFollowUsecase>(IsFollowUsecase(sl()));
  sl.registerSingleton<FollowUsecase>(FollowUsecase(sl()));
  sl.registerSingleton<GetProfileUsecase>(GetProfileUsecase(sl()));
  sl.registerSingleton<GetProfileRecipesUsecase>(
      GetProfileRecipesUsecase(sl()));
  sl.registerSingleton<LeaveUsecase>(LeaveUsecase(sl()));
  sl.registerSingleton<GetProfileSavedUsecase>(GetProfileSavedUsecase(sl()));
  sl.registerSingleton<EditProfileUsecase>(EditProfileUsecase(sl()));
  sl.registerSingleton<LoadImageUsecase>(LoadImageUsecase(sl()));
  sl.registerSingleton<AuthCubit>(AuthCubit(sl(), sl(), sl()));
  sl.registerSingleton<MainCubit>(
      MainCubit(sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl()));
  sl.registerSingleton<ProfileCubit>(
      ProfileCubit(sl(), sl(), sl(), sl(), sl(), sl()));
}
