import 'package:flutter/material.dart';
import 'package:flutter_starter_project/core/route/route.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              RouteApp.routemaster.push('/settings');
            },
            child: const Text('/settings'),
          ),
          ElevatedButton(
            onPressed: () {
              RouteApp.routemaster.push('/profile/sub');
            },
            child: const Text('/profile/sub'),
          ),
        ],
      ),
    );
  }
}
