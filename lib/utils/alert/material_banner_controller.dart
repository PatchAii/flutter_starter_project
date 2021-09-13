import 'package:flutter/material.dart';
import 'package:flutter_starter_project/core/core.dart';
import 'package:flutter_starter_project/utils/utils.dart';

class MaterialBannerController {
  @visibleForTesting
  static bool testing = false;

  static void showMaterialBanner(
    String text, {
    Duration duration = const Duration(seconds: 2),
  }) {
    if (rootScaffoldMessengerKey.currentState != null) {
      rootScaffoldMessengerKey.currentState!.hideCurrentMaterialBanner();
      rootScaffoldMessengerKey.currentState!.showMaterialBanner(
        MaterialBanner(
          content: Text(text),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                rootScaffoldMessengerKey.currentState!
                    .hideCurrentMaterialBanner();
                RouteApp.routemaster.push('/weather');
              },
              child: const Text('Go to weather'),
            ),
            TextButton(
              onPressed: () {
                rootScaffoldMessengerKey.currentState!
                    .hideCurrentMaterialBanner();
              },
              child: const Text('DISMISS'),
            ),
          ],
        ),
      );
    }
  }
}
