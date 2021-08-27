import 'package:flutter/material.dart';
import 'package:flutter_starter_project/core/core.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'OnBoarding',
            ),
            ElevatedButton(
              onPressed: () {
                getIt<AppState>().setUserProperties();
              },
              child: const Text('set User properties'),
            ),
          ],
        ),
      ),
    );
  }
}
