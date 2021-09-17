import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({
    Key? key,
    this.subPage = false,
  }) : super(key: key);

  final bool subPage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: subPage ? null : AppBar(),
      body: Column(
        children: [
          const Center(
            child: Text(
              'Notification',
            ),
          ),
        ],
      ),
    );
  }
}
