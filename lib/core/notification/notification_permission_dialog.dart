import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter_project/core/core.dart';

class NotificationPermissionDialog extends StatelessWidget {
  const NotificationPermissionDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        type: MaterialType.card,
        child: SizedBox(
          width: 300.0,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'NotificationPermissionDialog',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlinedButton(
                        child: const Text('Cancel'),
                        onPressed: () {
                          RouteApp.routemaster.pop();
                        },
                      ),
                      ElevatedButton(
                        child: const Text('Ok'),
                        onPressed: () async {
                          final result = await AwesomeNotifications()
                              .requestPermissionToSendNotifications();
                          if (result) {
                            NotificationController.listen();
                          }
                          await RouteApp.routemaster.pop();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
