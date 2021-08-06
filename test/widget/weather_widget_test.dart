import 'package:flutter/material.dart';
import 'package:flutter_starter_project/core/core.dart';
import 'package:flutter_starter_project/feature/feature.dart';
import 'package:flutter_starter_project/model/model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

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
            Weather.fromJson({
              'id': 4701509490049024,
              'weather_state_name': 'Heavy Rain',
              'weather_state_abbr': 'hr',
              'wind_direction_compass': 'S',
              'created': '2021-08-05T09:56:01.775321Z',
              'applicable_date': '2021-08-05',
              'min_temp': 13.35,
              'max_temp': 21.005000000000003,
              'the_temp': 20.384999999999998,
              'wind_speed': 8.604628544579656,
              'wind_direction': 182.66568781397157,
              'air_pressure': 1005.5,
              'humidity': 63,
              'visibility': 10.833606736657918,
              'predictability': 77
            }),
            Weather.fromJson({
              'id': 4701509490049024,
              'weather_state_name': 'Heavy Rain',
              'weather_state_abbr': 'hr',
              'wind_direction_compass': 'S',
              'created': '2021-08-05T09:56:01.775321Z',
              'applicable_date': '2021-08-05',
              'min_temp': 13.35,
              'max_temp': 21.005000000000003,
              'the_temp': 20.384999999999998,
              'wind_speed': 8.604628544579656,
              'wind_direction': 182.66568781397157,
              'air_pressure': 1005.5,
              'humidity': 63,
              'visibility': 10.833606736657918,
              'predictability': 77
            })
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
