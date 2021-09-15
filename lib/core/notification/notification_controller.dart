import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter_project/core/core.dart';

class NotificationController {
  static Future<void> init() async {
    await AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          channelKey: 'basic_channel',
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic tests',
          defaultColor: const Color(0xFF6EC818F),
          ledColor: Colors.white,
        )
      ],
    );
  }

  static Future<void> isNotificationAllowed() async {
    final isAllowed = await AwesomeNotifications().isNotificationAllowed();
    if (!isAllowed) {
      RouteApp.routemaster.push('/notificationpermission');
    } else {
      listen();
    }
  }

  static void listen() {
    AwesomeNotifications().actionStream.listen(
      (receivedNotification) {
        RouteApp.routemaster.push(
            '/notification?title=${receivedNotification.title}&subtitle=${receivedNotification.id}&description=${receivedNotification.payload}');
      },
    );
  }

  static Future<void> create() async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 1,
        channelKey: 'basic_channel',
        title: 'Simple Notification',
        body: 'Simple body',
      ),
    );
  }
}
