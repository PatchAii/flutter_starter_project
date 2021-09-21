import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

abstract class NotificationFeatureController {
  NotificationChannel getChannel();

  String getChannelName();

  Future<void> dismissedStream({
    required ReceivedAction message,
  });

  Future<void> createdStream({
    required ReceivedNotification message,
  });

  Future<void> displayedStream({
    required ReceivedNotification message,
  });

  Future<void> actionStream({
    required ReceivedAction message,
  });

  Future<void> handleRemoteNotification({
    required RemoteMessage message,
  });
}
