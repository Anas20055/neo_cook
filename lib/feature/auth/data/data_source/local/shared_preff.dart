import 'dart:convert';

import 'package:cook_app/feature/auth/data/model/token_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyLocalRepo {
  final _sessionDataProvider = SessionDataProvider();
  var _isAuth = false;
  bool get isAuth => _isAuth;

  Future<bool> checkAuth() async {
    final sessionId = await _sessionDataProvider.getSessionId();
    return _isAuth = sessionId != null;
  }
}

class SessionDataProvider {
  Future<String?> getSessionId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<void> setSessionId(TokenModel? value) async {
    final prefs = await SharedPreferences.getInstance();
    if (value != null) {
      await prefs.setString('token', jsonEncode(value.toJson()));
    } else {
      await prefs.remove('token');
    }
  }
}
