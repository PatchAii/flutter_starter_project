import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_starter_project/core/core.dart';
import 'package:flutter_starter_project/model/model.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum LoggedState {
  loggedOut,
  loggedIn,
}

@singleton
class AppState extends ChangeNotifier {
  LoggedState _loggedInState = LoggedState.loggedOut;
  User? _user;

  LoggedState get loggedInState {
    final isLoggedIn =
        getIt<SharedPreferences>().getBool('isLoggedIn') ?? false;
    _loggedInState = isLoggedIn ? LoggedState.loggedIn : LoggedState.loggedOut;

    return _loggedInState;
  }

  User? get user {
    if (_user != null) return _user;

    final userMap = getIt<SharedPreferences>().getString('user');
    if (userMap != null) {
      _user = User.fromJson(jsonDecode(userMap));
    }

    return _user;
  }

  bool onBoardRequired() {
    if (user != null && user!.name != null && user!.email != null) {
      return false;
    } else {
      return true;
    }
  }

  void logIn() {
    _loggedInState = LoggedState.loggedIn;
    getIt<SharedPreferences>().setBool('isLoggedIn', true);
    getIt<SharedPreferences>().setString(
      'user',
      jsonEncode(const User(id: 1).toJson()),
    );

    notifyListeners();
  }

  void setUserProperties() {
    _user = const User(
      id: 1,
      name: 'Kimi',
      email: 'Raikkonen',
    );
    getIt<SharedPreferences>().setString(
      'user',
      jsonEncode(
        _user!.toJson(),
      ),
    );
    notifyListeners();
  }

  Future<void> logOut() async {
    _loggedInState = LoggedState.loggedOut;
    _user = null;
    await getIt<SharedPreferences>().setBool('isLoggedIn', false);
    await getIt<SharedPreferences>().remove('user');

    notifyListeners();
  }
}
