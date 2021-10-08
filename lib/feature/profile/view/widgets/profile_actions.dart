import 'package:flutter/material.dart';
import 'package:flutter_starter_project/core/core.dart';

class ProfileActions extends StatelessWidget {
  const ProfileActions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const SizedBox(
          height: 16.0,
        ),
        ElevatedButton(
          key: const Key('settings_button'),
          onPressed: () {
            RouteApp.routemaster.push('/settings');
          },
          child: const Text('/settings'),
        ),
        const SizedBox(
          height: 16.0,
        ),
        ElevatedButton(
          onPressed: () {
            RouteApp.routemaster.push('/profile/sub');
          },
          child: const Text('/profile/sub'),
        ),
        const SizedBox(
          height: 16.0,
        ),
        ElevatedButton(
          onPressed: () {
            RouteApp.routemaster.push('/profile/bottomsheet');
          },
          child: const Text('/bottomsheet'),
        ),
        const SizedBox(
          height: 16.0,
        ),
        ElevatedButton(
          onPressed: () {
            RouteApp.routemaster.push('/posts?userId=1');
          },
          child: const Text('/posts/userId:1'),
        ),
        const SizedBox(
          height: 16.0,
        ),
        ElevatedButton(
          onPressed: () {
            RouteApp.routemaster.push('/posts?userId=2');
          },
          child: const Text('/posts/userId:2'),
        ),
        const SizedBox(
          height: 16.0,
        ),
        ElevatedButton(
          onPressed: () {
            RouteApp.routemaster.push(
              '/dialog?title=Kimi&subtitle=Raikkonen&description=AlfaRomeo Raicing ORLEN',
            );
          },
          child: const Text('/dialog'),
        ),
        const SizedBox(
          height: 16.0,
        ),
        ElevatedButton(
          onPressed: () {
            RouteApp.routemaster.push('/profile/notification');
          },
          child: const Text('/profile/notification'),
        ),
        const SizedBox(
          height: 16.0,
        ),
      ],
    );
  }
}
