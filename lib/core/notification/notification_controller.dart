import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter_project/core/core.dart';
import 'package:flutter_starter_project/core/notification/notification_feature_controller.dart';
import 'package:flutter_starter_project/utils/alert/snackbar_controller.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  await NotificationController.handleRemoteNotification(
    message: message,
  );
}

class NotificationController {
  static late final List<NotificationFeatureController> controllers;

  static Future<void> init(
      List<NotificationFeatureController> controllersList) async {
    controllers = controllersList;
    await _isWeb(
      () async {
        await AwesomeNotifications().initialize(
          null,
          [for (var controller in controllers) controller.getChannel()],
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

        AwesomeNotifications().dismissedStream.listen((dismissedNotification) {
          for (var controller in controllers) {
            if (dismissedNotification.channelKey ==
                controller.getChannelKey()) {
              controller.dismissedStream(
                receivedAction: dismissedNotification,
              );
              return;
            }
          }
        });

        AwesomeNotifications().createdStream.listen((createdNotification) {
          for (var controller in controllers) {
            if (createdNotification.channelKey == controller.getChannelKey()) {
              controller.createdStream(
                receivedNotification: createdNotification,
              );
              return;
            }
          }
        });

        AwesomeNotifications().displayedStream.listen((displayedNotification) {
          for (var controller in controllers) {
            if (displayedNotification.channelKey ==
                controller.getChannelKey()) {
              controller.displayedStream(
                receivedNotification: displayedNotification,
              );
              return;
            }
          }
        });

        AwesomeNotifications().actionStream.listen(
          (receivedNotification) async {
            for (var controller in controllers) {
              if (receivedNotification.channelKey ==
                  controller.getChannelKey()) {
                await _badgeControl(controller.getBadgeEnabled());
                await controller.actionStream(
                  receivedAction: receivedNotification,
                );
                return;
              }
            }
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

  static Future<void> _badgeControl(bool badge) async {
    if (Platform.isIOS && badge) {
      await AwesomeNotifications().getGlobalBadgeCounter().then(
            (value) => AwesomeNotifications().setGlobalBadgeCounter(value - 1),
          );
    }
  }

  static Future<void> handleRemoteNotification({
    required RemoteMessage message,
  }) async {
    if (message.notification != null) {
      return;
    } else {
      for (var controller in controllers) {
        if (message.data['profile_channel'] == controller.getChannelKey()) {
          await controller.handleRemoteNotification(
            remoteMessage: message,
          );
          return;
        }
      }
    }
  }

  static void dispose() {
    _isWeb(() {
      AwesomeNotifications().actionSink.close();
      AwesomeNotifications().createdSink.close();
      AwesomeNotifications().dismissedSink.close();
      AwesomeNotifications().displayedSink.close();
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

  static Future<void> resetBadgeCount() async {
    await AwesomeNotifications().resetGlobalBadge();
    SnackBarController.showSnackbar(
      'Badge count has been reset',
    );
  }

  static Future<String> getLocalTimeZone() async {
    return AwesomeNotifications().getLocalTimeZoneIdentifier();
  }

  static Stream<String?> getFCMToken() {
    return Stream.fromFuture(FirebaseMessaging.instance.getToken());
  }
}
