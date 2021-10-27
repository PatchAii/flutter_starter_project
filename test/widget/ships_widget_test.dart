import 'package:flutter_starter_project/core/core.dart';
import 'package:flutter_starter_project/feature/feature.dart';
import 'package:flutter_starter_project/graphql/ship_query.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../utils/fixture_reader.dart';
import '../utils/widget_builder.dart';

Future<void> main() async {
  EasyLocalization.logger.enableBuildModes = [];
  await loadAppFonts();
  group('ShipsView', () {
    testGoldens('ShipsError', (tester) async {
      final builder = getDefaultBuilder(
        const ShipsError(),
      );

      await tester.pumpDeviceBuilder(builder);

      await screenMatchesGolden(tester, 'ships_error');
    });

    testGoldens('ShipsList', (tester) async {
      await mockNetworkImagesFor(() async {
        final builder = getDefaultBuilder(
          ShipsList(
            ships: [
              GetShips$Query$Ship.fromJson(fixture('ship.json')),
              GetShips$Query$Ship.fromJson(fixture('ship.json')),
              GetShips$Query$Ship.fromJson(fixture('ship.json')),
              GetShips$Query$Ship.fromJson(fixture('ship.json')),
              GetShips$Query$Ship.fromJson(fixture('ship.json')),
              GetShips$Query$Ship.fromJson(fixture('ship.json')),
              GetShips$Query$Ship.fromJson(fixture('ship.json')),
            ],
          ),
        );

        await tester.pumpDeviceBuilder(builder);

        await screenMatchesGolden(tester, 'ship_list');
      });
    });

    testGoldens('ShipsList Empty', (tester) async {
      final builder = getDefaultBuilder(
        const ShipsList(
          ships: [],
        ),
      );

      await tester.pumpDeviceBuilder(builder);

      await screenMatchesGolden(tester, 'ships_list_empty');
    });
  });
}
