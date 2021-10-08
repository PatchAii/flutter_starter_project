import 'package:flutter/material.dart';
import 'package:flutter_starter_project/core/route/route.dart';

class NotFoundPage extends StatelessWidget {
  final String route;

  const NotFoundPage({
    required this.route,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$route not found',
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                RouteApp.routemaster.push('/pokedex');
              },
              child: const Text('Home'),
            ),
          ],
        ),
      ),
    );
  }
}
