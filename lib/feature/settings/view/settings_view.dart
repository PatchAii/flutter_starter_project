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
      backgroundColor: Colors.red,
      appBar: subPage ? null : AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'Settings',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              SnackBarController.showSnackbar('SnackBar from Settings Page!');
            },
            child: const Text('Show SnackBar'),
          ),
          ElevatedButton(
            onPressed: () {
              MaterialBannerController.showMaterialBanner(
                'MaterialBanner from Settings Page!',
              );
            },
            child: const Text('Show MaterialBanner'),
          ),
          ElevatedButton(
            onPressed: () {
              RouteApp.routemaster.push('/settings/bottomsheet');
            },
            child: const Text('Show /settings/bottomsheet'),
          ),
        ],
      ),
    );
  }
}
