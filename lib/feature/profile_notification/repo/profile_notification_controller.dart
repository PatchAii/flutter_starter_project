import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter_project/core/core.dart';
import 'package:flutter_starter_project/core/notification/notification_controller.dart';
import 'package:flutter_starter_project/core/notification/notification_feature_controller.dart';
import 'package:flutter_starter_project/core/notification/notification_week_time.dart';
import 'package:flutter_starter_project/utils/utils.dart';

class ProfileNotificationController extends NotificationFeatureController {
  static const CHANNEL_NAME = 'profile_channel';

  @override
  Future<void> actionStream({
    required ReceivedAction receivedAction,
  }) async {
    SnackBarController.showSnackbar(
        'ProfileNotificationController: notification action');

    if (receivedAction.payload?['redirect'] != null) {
      RouteApp.routemaster.push(
        '${receivedAction.payload?['redirect']}',
      );
      return;
    }

    if (receivedAction.buttonKeyPressed.isNotEmpty) {
      if (receivedAction.buttonKeyPressed == 'POSTPONE') {
        final localTimeZone = await NotificationController.getLocalTimeZone();
        await NotificationController.newNotification(
          content: NotificationContent(
            id: receivedAction.id,
            title: receivedAction.title,
            body: receivedAction.body,
            channelKey: receivedAction.channelKey,
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
    }
  }

  @override
  Future<void> createdStream({
    required ReceivedNotification receivedNotification,
  }) async {
    SnackBarController.showSnackbar(
        'ProfileNotificationController: notification created');
  }

  @override
  Future<void> dismissedStream({
    required ReceivedAction receivedAction,
  }) async {
    SnackBarController.showSnackbar(
        'ProfileNotificationController: notification dismissed');
  }

  @override
  Future<void> displayedStream({
    required ReceivedNotification receivedNotification,
  }) async {
    SnackBarController.showSnackbar(
        'ProfileNotificationController: notification displayed');
  }

  @override
  bool getBadgeEnabled() => false;

  @override
  NotificationChannel getChannel() {
    return NotificationChannel(
      channelKey: getChannelKey(),
      channelShowBadge: getBadgeEnabled(),
      channelName: 'Profile notifications',
      channelDescription: 'Notification channel for profile page',
      defaultColor: const Color(0xFFC5C818),
      ledColor: Colors.white,
      importance: NotificationImportance.High,
    );
  }

  @override
  String getChannelKey() => CHANNEL_NAME;

  @override
  Future<void> handleRemoteNotification({
    required RemoteMessage remoteMessage,
  }) async {
    SnackBarController.showSnackbar(
        'ProfileNotificationController: remote notification received');

    final data = remoteMessage.data;
    await NotificationController.newNotification(
      content: NotificationContent(
        id: int.tryParse(data['id']),
        channelKey: data['channelKey'],
        title: data['title'],
        body: data['body'],
        payload: data['payload'],
      ),
    );
  }

  ///Create a basic notification with a title, a body and a payload
  static Future<void> createBasicNotification() async {
    await NotificationController.newNotification(
      content: NotificationContent(
        id: createUniqueId(),
        channelKey: CHANNEL_NAME,
        title: '$CHANNEL_NAME Simple Notification',
        body: '$CHANNEL_NAME Simple body',
        payload: {'a': 'b'},
      ),
    );
  }

  ///Create a basic notification which will increase the badge count
  static Future<void> createBadgeNotification() async {
    await NotificationController.newNotification(
      content: NotificationContent(
        id: createUniqueId(),
        channelKey: CHANNEL_NAME,
        title: 'Badge test notification',
        body: 'This notification does activate badge indicator',
      ),
    );
  }

  ///Create a notification with a payload for displaying redirect capability
  static Future<void> createRedirectNotification() async {
    await NotificationController.newNotification(
      content: NotificationContent(
        id: createUniqueId(),
        channelKey: CHANNEL_NAME,
        title: 'Redirect Notification',
        body: 'Redirect body',
        payload: {'redirect': '/settings'},
      ),
    );
  }

  ///Create a notification with actionButtons
  static Future<void> createActionNotification() async {
    await NotificationController.newNotification(
        content: NotificationContent(
          id: createUniqueId(),
          channelKey: 'basic_channel',
          title: 'Action Notification',
          body: 'Action body',
        ),
        actionButtons: [
          NotificationActionButton(
            key: 'ACTION 1',
            label: 'Action 1',
          ),
          NotificationActionButton(
            key: 'ACTION 2',
            label: 'Action 2',
          ),
        ]);
  }

  ///Create a notification which can be postponed
  static Future<void> createPostponeNotification() async {
    await NotificationController.newNotification(
        content: NotificationContent(
          id: createUniqueId(),
          channelKey: CHANNEL_NAME,
          title: 'Postpone Notification',
          body: 'Postpone body',
        ),
        actionButtons: [
          NotificationActionButton(
            key: 'POSTPONE',
            label: 'postpone 1 minute',
          ),
        ]);
  }

  ///Create a notification which will be repeated every [seconds], starting from the moment is created.
  static Future<void> createSecondsRepeatingNotification(seconds) async {
    final localTimeZone = await NotificationController.getLocalTimeZone();
    await NotificationController.newNotification(
        content: NotificationContent(
          id: createUniqueId(),
          channelKey: CHANNEL_NAME,
          title: 'Notification at every $seconds seconds',
          body: 'This notification reschedule itself every $seconds seconds.',
        ),
        schedule: NotificationInterval(
            interval: seconds, timeZone: localTimeZone, repeats: true));
  }

  ///Create a notification which will be display at a specific moment in time
  static Future<void> createScheduledNotification({
    required NotificationWeekAndTime notificationSchedule,
    bool repeats = false,
  }) async {
    await NotificationController.newNotification(
      content: NotificationContent(
        id: createUniqueId(),
        channelKey: CHANNEL_NAME,
        title: '${Emojis.office_calendar} This is a scheduled notification',
        body:
            'It should be ${notificationSchedule.timeOfDay.toString()} of day ${notificationSchedule.dayOfTheWeek.toString()} of the week.',
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
          repeats: repeats),
    );
  }

  ///Create a notification scheduled to repeat at every single minute at clock
  static Future<void> createMinuteRepeatingNotification() async {
    final localTimeZone = await NotificationController.getLocalTimeZone();
    await NotificationController.newNotification(
        content: NotificationContent(
          id: createUniqueId(),
          channelKey: CHANNEL_NAME,
          title: 'Notification at exactly every single minute',
          body:
              'This notification was schedule to repeat at every single minute at clock.',
        ),
        schedule: NotificationCalendar(
            second: 0, millisecond: 0, timeZone: localTimeZone, repeats: true));
  }

  ///Create a notification scheduled to repeat at every single occurrence of a specific moment in time
  static Future<void> createTargetRepeatingNotification() async {
    final localTimeZone = await NotificationController.getLocalTimeZone();
    await NotificationController.newNotification(
        content: NotificationContent(
          id: createUniqueId(),
          channelKey: CHANNEL_NAME,
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

  static int createUniqueId() {
    return DateTime.now().millisecondsSinceEpoch.remainder(100000);
  }
}
