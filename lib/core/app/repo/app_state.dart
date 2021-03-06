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

  bool get carouselHasBeenShown =>
      getIt<SharedPreferences>().getBool(SHARED_PREFS_CAROUSELHASBEENSHOWN) ??
      false;

  void logIn() {
    _loggedInState = LoggedState.loggedIn;
    getIt<SharedPreferences>().setBool(SHARED_PREFS_ISLOGGEDIN, true);
    getIt<SharedPreferences>().setString(
      SHARED_PREFS_USER,
      jsonEncode(const User(id: 1).toJson()),
    );

    notifyListeners();
  }

  LoggedState get loggedInState {
    final isLoggedIn =
        getIt<SharedPreferences>().getBool(SHARED_PREFS_ISLOGGEDIN) ?? false;
    _loggedInState = isLoggedIn ? LoggedState.loggedIn : LoggedState.loggedOut;

    return _loggedInState;
  }

  User? get user {
    if (_user != null) {
      return _user;
    }

    final userMap = getIt<SharedPreferences>().getString(SHARED_PREFS_USER);
    if (userMap != null) {
      _user = User.fromJson(jsonDecode(userMap));
    }

    return _user;
  }

  Future<void> logOut() async {
    _loggedInState = LoggedState.loggedOut;
    _user = null;

    await getIt<SharedPreferences>().setBool(SHARED_PREFS_ISLOGGEDIN, false);
    await getIt<SharedPreferences>().remove(SHARED_PREFS_USER);
    await getIt<SharedPreferences>().remove(SHARED_PREFS_CAROUSELHASBEENSHOWN);

    NotificationController.dispose();

    notifyListeners();
  }

  Future<void> setCarouselHasBeenShown(bool value) async {
    await getIt<SharedPreferences>()
        .setBool(SHARED_PREFS_CAROUSELHASBEENSHOWN, value);
    notifyListeners();
  }

  void setUserProperties() {
    _user = const User(
      id: 1,
      name: 'Kimi',
      email: 'Raikkonen',
    );
    getIt<SharedPreferences>().setString(
      SHARED_PREFS_USER,
      jsonEncode(
        _user!.toJson(),
      ),
    );
    notifyListeners();
  }
}
