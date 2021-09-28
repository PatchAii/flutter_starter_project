import 'package:flutter/material.dart';
import 'package:flutter_starter_project/core/core.dart';
import 'package:flutter_starter_project/feature/common/top_bar.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(
        label: 'OnBoarding',
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
