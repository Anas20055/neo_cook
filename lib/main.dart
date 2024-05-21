import 'package:cook_app/feature/auth/data/data_source/local/shared_preff.dart';
import 'package:cook_app/core/di/injection_container.dart';
import 'package:cook_app/core/routes/routes.dart';
import 'package:cook_app/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:cook_app/feature/main/presentation/cubit/main_cubit.dart';
import 'package:flutter/material.dart';
import 'package:cook_app/core/constants/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part "core/theme/theme.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  final localRepo = MyLocalRepo();
  await localRepo.checkAuth();
  runApp(
    MyApp(
      localRepo: localRepo,
    ),
  );
}

class MyApp extends StatelessWidget {
  final MyLocalRepo localRepo;
  const MyApp({
    super.key,
    required this.localRepo,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<AuthCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<MainCubit>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.initialRoute(localRepo.isAuth),
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        theme: _theme(),
      ),
    );
  }
}
