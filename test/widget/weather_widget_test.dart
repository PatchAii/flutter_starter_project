import 'package:flutter_starter_project/core/core.dart';
import 'package:flutter_starter_project/feature/feature.dart';
import 'package:flutter_starter_project/model/model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import '../utils/fixture_reader.dart';
import '../utils/golden_device_builder.dart';

Future<void> main() async {
  EasyLocalization.logger.enableBuildModes = [];
  await loadAppFonts();
  group('WeatherView', () {
    testGoldens('WeatherError', (tester) async {
      final builder = getDefaultBuilder(
        const WeatherError(),
      );

      await tester.pumpDeviceBuilder(builder);

      await screenMatchesGolden(tester, 'weather_error');
    });

    testGoldens('WeatherList', (tester) async {
      final builder = getDefaultBuilder(
        WeatherList(
          city: 'Monza',
          weathers: [
            Weather.fromJson(fixture('weather.json')),
            Weather.fromJson(fixture('weather.json')),
          ],
        ),
      );

      await tester.pumpDeviceBuilder(builder);

      await screenMatchesGolden(tester, 'weather_list');
    });

    testGoldens('WeatherList Empty', (tester) async {
      final builder = getDefaultBuilder(
        const WeatherList(
          city: 'Monza',
          weathers: [],
        ),
      );

      await tester.pumpDeviceBuilder(builder);

      await screenMatchesGolden(tester, 'weather_list_empty');
    });
  });
}
