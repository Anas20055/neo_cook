import 'package:cook_app/app/data/data_source/app_api.dart';
import 'package:cook_app/app/data/data_source/local/shared_preff.dart';
import 'package:cook_app/feature/auth/data/repository/auth_repo_impl.dart';
import 'package:cook_app/feature/auth/domain/repository/auth_repo.dart';
import 'package:cook_app/feature/auth/domain/usecases/login_usecase.dart';
import 'package:cook_app/feature/auth/domain/usecases/register_usecase.dart';
import 'package:cook_app/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:get_it/get_it.dart';

import 'package:dio/dio.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

part "dio_client.dart";

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  final dio = _buildDioClient('http://164.92.125.200:8080/api');
  sl.registerSingleton<AppApi>(AppApi(dio));
  sl.registerSingleton<AuthRepo>(AuthRepoImpl(sl()));
  sl.registerSingleton<LoginUseCase>(LoginUseCase(sl()));
  sl.registerSingleton<RegisterUseCase>(RegisterUseCase(sl()));
  sl.registerSingleton<SessionDataProvider>(SessionDataProvider());
  sl.registerSingleton<AuthCubit>(AuthCubit(sl(), sl(), sl()));
}
