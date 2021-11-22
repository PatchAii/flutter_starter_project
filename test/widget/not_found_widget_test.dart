import 'package:flutter_starter_project/core/core.dart';
import 'package:flutter_starter_project/feature/not_found/view/not_found_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

import '../utils/widget_builder.dart';

Future<void> main() async {
  EasyLocalization.logger.enableBuildModes = [];
  await loadAppFonts();
  group('NotFoundView', () {
    testGoldens('NotFound Page', (tester) async {
      await mockNetworkImages(() async {
        final builder = getDefaultBuilder(
          const NotFoundPage(
            route: '',
          ),
        );
        await tester.pumpDeviceBuilder(builder);
        await screenMatchesGolden(tester, 'not_found_page');
      });
    });
  });
}
