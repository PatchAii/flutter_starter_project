import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

enum LoggedInState {
  loggedOut,
  loggedIn,
}

@singleton
class AppState extends ChangeNotifier {
  LoggedInState _loggedInState = LoggedInState.loggedOut;

  LoggedInState get loggedInState => _loggedInState;

  void logIn() {
    _loggedInState = LoggedInState.loggedIn;
    notifyListeners();
  }

  Future<void> logOut() async {
    _loggedInState = LoggedInState.loggedOut;
    notifyListeners();
  }
}
