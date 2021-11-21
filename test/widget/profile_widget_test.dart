import 'package:flutter_starter_project/core/core.dart';
import 'package:flutter_starter_project/feature/profile/view/widgets/profile_actions.dart';
import 'package:flutter_starter_project/feature/profile/view/widgets/profile_content.dart';
import 'package:flutter_starter_project/feature/profile/view/widgets/profile_data.dart';
import 'package:flutter_starter_project/feature/profile/view/widgets/profile_error.dart';
import 'package:flutter_starter_project/model/model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

import '../utils/fixture_reader.dart';
import '../utils/widget_builder.dart';

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
      await mockNetworkImages(() async {
        final builder = getDefaultBuilder(
          ProfileData(
            user: User.fromJson(fixture('user.json')),
          ),
        );
        await tester.pumpDeviceBuilder(builder);
        await screenMatchesGolden(tester, 'profile_data');
      });
    });
    testGoldens('ProfileContent', (tester) async {
      await mockNetworkImages(() async {
        final builder = getDefaultBuilder(
          ProfileContent(
            user: User.fromJson(fixture('user.json')),
          ),
        );
        await tester.pumpDeviceBuilder(builder);
        await screenMatchesGolden(tester, 'profile_content');
      });
    });

    testGoldens('ProfileActions', (tester) async {
      await mockNetworkImages(() async {
        final builder = getDefaultBuilder(
          const ProfileActions(),
        );
        await tester.pumpDeviceBuilder(builder);
        await screenMatchesGolden(tester, 'profile_actions');
      });
    });
  });
}
