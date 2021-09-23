import 'package:flutter/material.dart';
import 'package:flutter_starter_project/core/core.dart';
import 'package:flutter_starter_project/utils/utils.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({
    Key? key,
    this.subPage = false,
  }) : super(key: key);

  final bool subPage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: subPage
          ? null
          : AppBar(
              title: const Text(
                'Settings',
              ),
            ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                SnackBarController.showSnackbar('SnackBar from Settings Page!');
              },
              child: const Text('Show SnackBar'),
            ),
            const SizedBox(
              height: 16.0,
            ),
            ElevatedButton(
              onPressed: () {
                MaterialBannerController.showMaterialBanner(
                  'MaterialBanner from Settings Page!',
                );
              },
              child: const Text('Show MaterialBanner'),
            ),
            const SizedBox(
              height: 16.0,
            ),
            ElevatedButton(
              onPressed: () {
                RouteApp.routemaster.push('/settings/bottomsheet');
              },
              child: const Text('Show /settings/bottomsheet'),
            ),
            const SizedBox(
              height: 16.0,
            ),
            ElevatedButton(
              onPressed: () async {
                await NotificationController.cancelScheduledNotifications();
              },
              child: const Text('Cancel all scheduled'),
            ),
            const SizedBox(
              height: 16.0,
            ),
            ElevatedButton(
              onPressed: () async {
                await NotificationController.resetBadgeCount();
              },
              child: const Text('Reset badge count'),
            ),
            const SizedBox(
              height: 16.0,
            ),
          ],
        ),
      ),
    );
  }
}
