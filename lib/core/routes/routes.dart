import 'package:cook_app/feature%20/auth/presentation/login_page/login_page.dart';
import 'package:cook_app/feature%20/auth/presentation/sing_up_page/sing_up_page.dart';
import 'package:cook_app/feature%20/main/presentation/home_page.dart';
import 'package:flutter/material.dart';

abstract class AppRouteNames {
  static const login = '/login';
  static const register = '/login/register';
  static const homePage = '/';
}

abstract class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    return switch (settings.name) {
      AppRouteNames.homePage => _materialRoute(const HomePage()),
      AppRouteNames.login => _materialRoute(const LoginPage()),
      AppRouteNames.register => _materialRoute(const SingUpPage()),
      _ => _materialRoute(const LoginPage()),
    };
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}