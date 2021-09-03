import 'package:flutter/material.dart';
import 'package:flutter_starter_project/core/core.dart';
import 'package:flutter_starter_project/feature/profile/view/profile_page.dart';
import 'package:flutter_starter_project/model/model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

Future<void> main() async {
  EasyLocalization.logger.enableBuildModes = [];
  await loadAppFonts();
  group('ProfileView', () {
    testGoldens('ProfileError', (tester) async {
      final builder = getDefaultBuilder(
        const ProfileError(),
      );
      await tester.pumpDeviceBuilder(builder);
      await screenMatchesGolden(tester, 'profile_error');
    });

    testGoldens('ProfileData', (tester) async {
      final builder = getDefaultBuilder(
        ProfileData(
            user: User.fromJson({
          'id': 1,
          'name': 'Leanne Graham',
          'username': 'Bret',
          'email': 'Sincere@april.biz',
          'phone': '1-770-736-8031 x56442',
          'website': 'hildegard.org'
        })),
      );
      await tester.pumpDeviceBuilder(builder);
      await screenMatchesGolden(tester, 'profile_data');
    });

    testGoldens('ProfileContent', (tester) async {
      final builder = getDefaultBuilder(
        ProfileContent(
            user: User.fromJson({
          'id': 1,
          'name': 'Leanne Graham',
          'username': 'Bret',
          'email': 'Sincere@april.biz',
          'phone': '1-770-736-8031 x56442',
          'website': 'hildegard.org'
        })),
      );
      await tester.pumpDeviceBuilder(builder);
      await screenMatchesGolden(tester, 'profile_content');
    });
  });
}

DeviceBuilder getDefaultBuilder(Widget child) {
  return DeviceBuilder()
    ..overrideDevicesForAllScenarios(
      devices: [
        Device.phone,
        Device.iphone11,
        Device.tabletPortrait,
        Device.tabletLandscape,
      ],
    )
    ..addScenario(
      widget: child,
    );
}
