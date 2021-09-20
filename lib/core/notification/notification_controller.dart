import 'dart:convert';
import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter_project/core/core.dart';
import 'package:flutter_starter_project/graphql/graphql_operations_api.dart';
import 'package:flutter_starter_project/utils/alert/snackbar_controller.dart';
import 'package:flutter_starter_project/utils/network/graphql_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  await NotificationController.handleRemoteNotification(
    message: message,
  );
}

class NotificationController {
  static Future<void> init() async {
    await _isWeb(
      () async {
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
          _firebaseMessagingBackgroundHandler,
        );
      },
    );
  }

  static Future<void> isNotificationAllowedOrListen() async {
    await _isWeb(
      () async {
        final isAllowed = await AwesomeNotifications().isNotificationAllowed();
        if (!isAllowed) {
          RouteApp.routemaster.push('/notificationpermission');
        } else {
          listen();
        }
      },
    );
  }

  static void listen() {
    _isWeb(
      () {
        getFCMToken().listen(
          (token) {
            debugPrint('FCMTOKEN: $token');
          },
        );

        AwesomeNotifications().actionStream.listen(
          (receivedNotification) async {
            if (Platform.isIOS &&
                receivedNotification.channelKey == 'badge_channel') {
              await AwesomeNotifications().getGlobalBadgeCounter().then(
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
              if (receivedNotification.buttonKeyPressed == 'POSTPONE') {
                final localTimeZone = await getLocalTimeZone();
                await newNotification(
                  content: NotificationContent(
                    id: receivedNotification.id,
                    title: receivedNotification.title,
                    body: receivedNotification.body,
                    channelKey: receivedNotification.channelKey,
                  ),
                  actionButtons: [
                    NotificationActionButton(
                      key: 'POSTPONE',
                      label: 'postpone 1 minute',
                    ),
                  ],
                  schedule: NotificationInterval(
                    interval: 60,
                    timeZone: localTimeZone,
                  ),
                );
                SnackBarController.showSnackbar(
                  'Notification Postponed by one minute',
                );
                return;
              }

              final res = await GraphqlClient.exec(query: GetPokedexQuery());
              SnackBarController.showSnackbar(res.data!.pokemons![0]!.name!);
              return;
            }

            RouteApp.routemaster.push(
              '/dialog?title=${receivedNotification.title}&subtitle=${receivedNotification.id}&description=${receivedNotification.payload}',
            );
          },
        );

        FirebaseMessaging.onMessage.listen(
          (RemoteMessage message) async {
            await handleRemoteNotification(message: message);
          },
        );
      },
    );
  }

  static Future<void> handleRemoteNotification({
    required RemoteMessage message,
  }) async {
    try {
      final res = await GraphqlClient.exec(query: GetPokedexQuery());
      SnackBarController.showSnackbar(res.data!.pokemons![0]!.name!);

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(
        'notification background',
        jsonEncode(message.data) +
            DateTime.now().toIso8601String() +
            res.data!.pokemons![0]!.name!,
      );
    } catch (e) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(
        'notification background',
        e.toString(),
      );
    }
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

  static Future<String> getLocalTimeZone() async {
    return AwesomeNotifications().getLocalTimeZoneIdentifier();
  }

  static Stream<String?> getFCMToken() {
    return Stream.fromFuture(FirebaseMessaging.instance.getToken());
  }
}
