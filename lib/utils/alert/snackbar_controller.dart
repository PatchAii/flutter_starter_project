import 'package:flutter/material.dart';
import 'package:flutter_starter_project/utils/utils.dart';

class SnackBarController {
  @visibleForTesting
  static bool testing = false;

  static void showSnackbar(
    String text, {
    Duration duration = const Duration(seconds: 2),
  }) {
    if (!testing && rootScaffoldMessengerKey.currentState != null) {
      rootScaffoldMessengerKey.currentState!.hideCurrentSnackBar();
      rootScaffoldMessengerKey.currentState!.showSnackBar(
        SnackBar(
          content: Text(text),
          margin: const EdgeInsets.all(20),
          duration: duration,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }
}
