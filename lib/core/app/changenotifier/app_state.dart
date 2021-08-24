import 'package:flutter/foundation.dart';
import 'package:flutter_starter_project/core/core.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum LoggedState {
  loggedOut,
  loggedIn,
}

@singleton
class AppState extends ChangeNotifier {
  LoggedState _loggedInState = LoggedState.loggedOut;

  LoggedState get loggedInState {
    final isLoggedIn =
        getIt<SharedPreferences>().getBool('isLoggedIn') ?? false;
    _loggedInState = isLoggedIn ? LoggedState.loggedIn : LoggedState.loggedOut;

    return _loggedInState;
  }

  void logIn() {
    _loggedInState = LoggedState.loggedIn;
    getIt<SharedPreferences>().setBool('isLoggedIn', true);

    notifyListeners();
  }

  Future<void> logOut() async {
    _loggedInState = LoggedState.loggedOut;
    await getIt<SharedPreferences>().setBool('isLoggedIn', false);

    notifyListeners();
  }
}
