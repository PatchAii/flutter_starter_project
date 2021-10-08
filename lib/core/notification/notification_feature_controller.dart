import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

abstract class NotificationFeatureController {
  NotificationChannel getChannel();

  bool getBadgeEnabled();

  String getChannelKey();

  Future<void> dismissedStream({required ReceivedAction receivedAction});

  Future<void> createdStream({
    required ReceivedNotification receivedNotification,
  });

  Future<void> displayedStream({
    required ReceivedNotification receivedNotification,
  });

  Future<void> actionStream({required ReceivedAction receivedAction});

  Future<void> handleRemoteNotification({
    required RemoteMessage remoteMessage,
  });
}
