import 'package:flutter_starter_project/core/core.dart';
import 'package:flutter_starter_project/feature/profile_notification/view/profile_notification_view.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../utils/golden_device_builder.dart';

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
  });
}
