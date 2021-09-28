import 'package:flutter/material.dart';
import 'package:flutter_starter_project/core/core.dart';

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
                RouteApp.routemaster.push('/pokedex');
              },
              child: const Text('Go to pokedex'),
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
