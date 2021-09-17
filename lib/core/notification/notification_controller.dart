import 'dart:convert';
import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter_project/core/core.dart';
import 'package:flutter_starter_project/utils/alert/snackbar_controller.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  await NotificationController.handleRemoteNotification(
    message: message,
    background: true,
  );
}

class NotificationController {
  static Future<void> init() async {
    await AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          channelKey: 'basic_channel',
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic tests',
          defaultColor: const Color(0xFF6EC818),
          ledColor: Colors.white,
          importance: NotificationImportance.High,
        ),
        NotificationChannel(
          channelKey: 'badge_channel',
          channelName: 'Badge indicator notifications',
          channelDescription:
              'Notification channel to activate badge indicator',
          channelShowBadge: true,
          defaultColor: const Color(0xFF9D50DD),
          ledColor: Colors.green,
          importance: NotificationImportance.High,
        ),
        NotificationChannel(
          channelKey: 'scheduled_channel',
          channelName: 'Scheduled notifications',
          channelDescription: 'Notification channel for scheduled tests',
          defaultColor: const Color(0xFF1896C8),
          ledColor: Colors.white,
          importance: NotificationImportance.High,
        ),
      ],
    );
    await Firebase.initializeApp();
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
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
    FirebaseMessaging.instance.getToken().then(
      (token) {
        debugPrint('FCMTOKEN: $token');
      },
    );

    AwesomeNotifications().actionStream.listen(
      (receivedNotification) {
        if (Platform.isIOS) {
          AwesomeNotifications().getGlobalBadgeCounter().then(
                (value) =>
                    AwesomeNotifications().setGlobalBadgeCounter(value - 1),
              );
        }

        if (receivedNotification.payload?['redirect'] != null) {
          RouteApp.routemaster.push(
            '${receivedNotification.payload?['redirect']}',
          );
          return;
        }

        RouteApp.routemaster.push(
          '/notification?title=${receivedNotification.title}&subtitle=${receivedNotification.id}&description=${receivedNotification.payload}',
        );
      },
    );

    AwesomeNotifications().createdStream.listen(
      (notification) {
        SnackBarController.showSnackbar(
          'Notification Created on ${notification.channelKey}',
        );
      },
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      /* print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}'); */
      await handleRemoteNotification(message: message);
    });
  }

  static Future<void> handleRemoteNotification({
    required RemoteMessage message,
    bool background = false,
  }) async {
    if (message.notification != null) {
      return;
    } else {
      //await AwesomeNotifications().createNotificationFromJsonData(message.data);
      final data = message.data;
      final payload = Map<String, String>.from(jsonDecode(data['payload']));
      await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: int.tryParse(data['id']),
          channelKey: data['channelKey'],
          title: data['title'],
          body: data['body'],
          payload: payload,
        ),
      );
    }
  }

  static Future<void> createBasicNotification() async {
    /* final interval = NotificationInterval(
      interval: 5,
    ); */
    /* final calendar = NotificationCalendar(
       weekday: notificationSchedule.dayOfTheWeek,
      hour: notificationSchedule.timeOfDay.hour,
      minute: notificationSchedule.timeOfDay.minute,
      second: 0,
      millisecond: 0,
    );*/
    await AwesomeNotifications().createNotification(
      //schedule: calendar,
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

  static Future<void> createRedirectNotification() async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 1,
        channelKey: 'basic_channel',
        title: 'Redirect Notification',
        body: 'Redirect body',
        payload: {'redirect': '/settings'},
      ),
    );
  }

  static Future<void> createSecondsRepeatingNotification(seconds) async {
    final localTimeZone =
        await AwesomeNotifications().getLocalTimeZoneIdentifier();
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: createUniqueId(),
          channelKey: 'scheduled_channel',
          title: 'Notification at every $seconds seconds',
          body: 'This notification was schedule to repeat.',
        ),
        schedule: NotificationInterval(
            interval: seconds, timeZone: localTimeZone, repeats: true));
  }

  static Future<void> createScheduledNotification(
      NotificationWeekAndTime notificationSchedule) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: createUniqueId(),
        channelKey: 'scheduled_channel',
        title: '${Emojis.wheater_droplet} Add some water to your plant!',
        body: 'Water your plant regularly to keep it healthy.',
        notificationLayout: NotificationLayout.Default,
      ),
      actionButtons: [
        NotificationActionButton(
          key: 'MARK_DONE',
          label: 'Mark Done',
        ),
      ],
      schedule: NotificationCalendar(
        weekday: notificationSchedule.dayOfTheWeek,
        hour: notificationSchedule.timeOfDay.hour,
        minute: notificationSchedule.timeOfDay.minute,
        second: 0,
        millisecond: 0,
        repeats: true,
      ),
    );
  }

  static Future<void> createMinuteRepeatingNotification() async {
    final localTimeZone =
        await AwesomeNotifications().getLocalTimeZoneIdentifier();
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: createUniqueId(),
          channelKey: 'scheduled_channel',
          title: 'Notification at exactly every single minute',
          body:
              'This notification was schedule to repeat at every single minute at clock.',
        ),
        schedule: NotificationCalendar(
            second: 0, millisecond: 0, timeZone: localTimeZone, repeats: true));
  }

  static Future<void> createTargetRepeatingNotification() async {
    final localTimeZone =
        await AwesomeNotifications().getLocalTimeZoneIdentifier();
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: createUniqueId(),
          channelKey: 'scheduled_channel',
          title: 'Notification every hour when it is 10 minutes and 30 seconds',
          body:
              'This notification was schedule to repeat at a specific moment in time.',
        ),
        schedule: NotificationCalendar(
            minute: 10,
            second: 30,
            millisecond: 0,
            timeZone: localTimeZone,
            repeats: true));
  }

  static void dispose() {
    AwesomeNotifications().actionSink.close();
    AwesomeNotifications().createdSink.close();
  }

  static Future<void> cancelScheduledNotifications() async {
    await AwesomeNotifications().cancelAllSchedules();
    SnackBarController.showSnackbar(
      'All scheduled notifications have been cancelled',
    );
  }
}

class NotificationWeekAndTime {
  final int dayOfTheWeek;
  final TimeOfDay timeOfDay;

  NotificationWeekAndTime({
    required this.dayOfTheWeek,
    required this.timeOfDay,
  });
}

int createUniqueId() {
  return DateTime.now().millisecondsSinceEpoch.remainder(100000);
}
