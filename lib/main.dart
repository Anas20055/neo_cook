import 'package:cook_app/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:cook_app/core/constants/app_colors.dart';
part "core/theme/theme.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouteNames.login,
      onGenerateRoute: AppRoutes.onGenerateRoutes,
      theme: _theme(),
    );
  }
}
