import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
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
    await _isWeb(() async {
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
      FirebaseMessaging.onBackgroundMessage(
          _firebaseMessagingBackgroundHandler);
    });
  }

  static Future<void> isNotificationAllowedOrListen() async {
    await _isWeb(() async {
      final isAllowed = await AwesomeNotifications().isNotificationAllowed();
      if (!isAllowed) {
        RouteApp.routemaster.push('/notificationpermission');
      } else {
        listen();
      }
    });
  }

  static void listen() {
    _isWeb(() {
      FirebaseMessaging.instance.getToken().then(
        (token) {
          debugPrint('FCMTOKEN: $token');
        },
      );

      AwesomeNotifications().actionStream.listen(
        (receivedNotification) {
          if (Platform.isIOS &&
              receivedNotification.channelKey == 'badge_channel') {
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

          if (receivedNotification.buttonKeyPressed.isNotEmpty) {
            RouteApp.routemaster.push(
              '/dialog?title=${receivedNotification.buttonKeyPressed}',
            );
            return;
          }

          RouteApp.routemaster.push(
            '/dialog?title=${receivedNotification.title}&subtitle=${receivedNotification.id}&description=${receivedNotification.payload}',
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
        await handleRemoteNotification(message: message);
      });
    });
  }

  static Future<void> handleRemoteNotification({
    required RemoteMessage message,
    bool background = false,
  }) async {
    if (message.notification != null) {
      return;
    } else {
      final data = message.data;
      await newNotification(
        content: NotificationContent(
          id: int.tryParse(data['id']),
          channelKey: data['channelKey'],
          title: data['title'],
          body: data['body'],
          payload: data['payload'],
        ),
      );
    }
  }

  static void dispose() {
    _isWeb(() {
      AwesomeNotifications().actionSink.close();
      AwesomeNotifications().createdSink.close();
    });
  }

  static Future<void> newNotification({
    required NotificationContent content,
    List<NotificationActionButton>? actionButtons,
    NotificationSchedule? schedule,
  }) async {
    await _isWeb(
      () async {
        await AwesomeNotifications().createNotification(
          content: content,
          actionButtons: actionButtons,
          schedule: schedule,
        );
      },
      showError: true,
    );
  }

  static Future<void> _isWeb(
    Function function, {
    bool showError = false,
  }) async {
    if (!kIsWeb) {
      await function.call();
    } else {
      if (showError) {
        SnackBarController.showSnackbar(
            'Noification is not supported on web yet...');
      }
    }
  }

  static Future<void> cancelScheduledNotifications() async {
    await AwesomeNotifications().cancelAllSchedules();
    SnackBarController.showSnackbar(
      'All scheduled notifications have been cancelled',
    );
  }

  static int createUniqueId() {
    return DateTime.now().millisecondsSinceEpoch.remainder(100000);
  }

  static Future<String> getLocalTimeZone() async {
    return AwesomeNotifications().getLocalTimeZoneIdentifier();
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
