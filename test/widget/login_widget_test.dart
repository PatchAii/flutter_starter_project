import 'package:flutter_starter_project/core/core.dart';
import 'package:flutter_starter_project/feature/feature.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../utils/widget_builder.dart';

Future<void> main() async {
  EasyLocalization.logger.enableBuildModes = [];
  await loadAppFonts();
  group('LoginView', () {
    testGoldens('Login Page', (tester) async {
      await mockNetworkImagesFor(() async {
        final builder = getDefaultBuilder(
          const LoginPage(),
        );
        await tester.pumpDeviceBuilder(builder);
        await screenMatchesGolden(tester, 'login_page');
      });
    });
  });
}
