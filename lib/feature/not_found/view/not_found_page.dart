import 'package:flutter/material.dart';
import 'package:flutter_starter_project/core/route/route.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({
    Key? key,
    required this.route,
  }) : super(key: key);

  final String route;

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
                RouteApp.routemaster.push('/weather');
              },
              child: const Text('Home'),
            )
          ],
        ),
      ),
    );
  }
}
