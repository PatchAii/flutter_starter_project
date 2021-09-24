import 'package:flutter/material.dart';
import 'package:flutter_starter_project/core/core.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'OnBoarding',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
