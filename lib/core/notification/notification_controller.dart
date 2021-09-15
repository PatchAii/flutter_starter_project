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
        ),
        NotificationChannel(
          channelKey: 'badge_channel',
          channelName: 'Badge indicator notifications',
          channelDescription:
              'Notification channel to activate badge indicator',
          channelShowBadge: true,
          defaultColor: Color(0xFF9D50DD),
          ledColor: Colors.yellow,
        ),
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

  static Future<void> createBasicNotification() async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 1,
        channelKey: 'basic_channel',
        title: 'Simple Notification',
        body: 'Simple body',
        payload: {'a': 'b'},
      ),
    );
  }

  static Future<void> createBadgeNotification() async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 2,
        channelKey: 'badge_channel',
        title: 'Badge test notification',
        body: 'This notification does activate badge indicator',
      ),
    );
  }
}
