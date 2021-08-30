import 'package:flutter/material.dart';

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
      body: const Center(
        child: Text(
          'Settings',
        ),
      ),
    );
  }
}
