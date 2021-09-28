import 'package:flutter/material.dart';
import 'package:flutter_starter_project/core/core.dart';
import 'package:flutter_starter_project/feature/profile_notification/view/profile_notification_view.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../utils/widget_builder.dart';

Future<void> main() async {
  EasyLocalization.logger.enableBuildModes = [];
  await loadAppFonts();
  group('ProfileNotificationView', () {
    testGoldens('ProfileNotification Content', (tester) async {
      await mockNetworkImagesFor(() async {
        final builder = getDefaultBuilder(
          const NotificationContent(
            token: '',
          ),
        );
        await tester.pumpDeviceBuilder(builder);
        await screenMatchesGolden(tester, 'profile_notification_content');
      });
    });

    testWidgets('Open pick schedule dialog on button tap', (tester) async {
      await tester.pumpWidget(mountApp(const NotificationContent(
        token: 'token',
      )));
      expect(find.byType(NotificationContent), findsOneWidget);

      expect(find.byKey(const Key('pick_schedule')), findsOneWidget);

      await tester.ensureVisible(find.byKey(const Key('pick_schedule')));

      await tester.tap(find.byKey(const Key('pick_schedule')));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('pick_schedule_dialog')), findsOneWidget);
    });

    testWidgets('Open pick seconds dialog on button tap', (tester) async {
      await tester.pumpWidget(mountApp(const NotificationContent(
        token: 'token',
      )));
      expect(find.byType(NotificationContent), findsOneWidget);

      expect(find.byKey(const Key('pick_seconds')), findsOneWidget);

      await tester.ensureVisible(find.byKey(const Key('pick_seconds')));

      await tester.tap(find.byKey(const Key('pick_seconds')));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('pick_seconds_dialog')), findsOneWidget);
    });
  });
}
